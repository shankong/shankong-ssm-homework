/* ========== 管理员登陆页面 — 记住我功能 ========== */
document.addEventListener('DOMContentLoaded', function() {
    var nameInput = document.getElementById('managerName');
    var remember = document.getElementById('rememberMe');
    if (!nameInput || !remember) return;

    function setCookie(name, value, days) {
        var d = new Date();
        d.setTime(d.getTime() + days * 24 * 60 * 60 * 1000);
        document.cookie = encodeURIComponent(name) + '=' + encodeURIComponent(value)
            + ';expires=' + d.toUTCString() + ';path=/';
    }

    function getCookie(name) {
        var prefix = encodeURIComponent(name) + '=';
        var cookies = document.cookie.split(';');
        for (var i = 0; i < cookies.length; i++) {
            var c = cookies[i].trim();
            if (c.indexOf(prefix) === 0) {
                return decodeURIComponent(c.substring(prefix.length));
            }
        }
        return '';
    }

    function delCookie(name) {
        document.cookie = encodeURIComponent(name) + '=;expires=Thu, 01 Jan 1970 00:00:00 UTC;path=/';
    }

    var savedName = getCookie('rememberedManagerName');
    if (savedName) {
        nameInput.value = savedName;
        remember.checked = true;
    }

    var form = document.getElementById('loginForm');
    if (form) {
        form.addEventListener('submit', function() {
            if (remember.checked && nameInput.value.trim()) {
                setCookie('rememberedManagerName', nameInput.value.trim(), 7);
            } else if (!remember.checked) {
                delCookie('rememberedManagerName');
            }
        });
    }
});

/* ========== 后台首页 — 左侧导航菜单 ========== */
document.addEventListener('DOMContentLoaded', function() {
    var leftnav = document.querySelector('.leftnav');
    if (!leftnav) return;

    // 菜单折叠/展开
    var headings = leftnav.querySelectorAll('h2');
    for (var i = 0; i < headings.length; i++) {
        headings[i].addEventListener('click', function() {
            var ul = this.nextElementSibling;
            if (ul && ul.tagName === 'UL') {
                ul.classList.toggle('open');
            }
            this.classList.toggle('on');
        });
    }

    // 菜单项点击高亮 + 设置面包屑文本
    var links = leftnav.querySelectorAll('ul li a');
    for (var i = 0; i < links.length; i++) {
        links[i].addEventListener('click', function(e) {
            var leaderTxt = document.getElementById('a_leader_txt');
            if (leaderTxt) {
                leaderTxt.textContent = this.textContent;
            }
            for (var j = 0; j < links.length; j++) {
                links[j].classList.remove('on');
            }
            this.classList.add('on');
        });
    }
});

/* ========== 管理员列表页 — 全选 / 删除 ========== */
document.addEventListener('DOMContentLoaded', function() {
    var checkallBtn = document.getElementById('checkall');
    var itemCheckboxes = document.querySelectorAll('.item-checkbox');
    if (!checkallBtn || itemCheckboxes.length === 0) return;

    var isAllSelected = false;

    var updateBtnText = function() {
        checkallBtn.innerHTML = isAllSelected
            ? '<span class="icon-check"></span> 取消全选'
            : '<span class="icon-check"></span> 全选本页';
    };

    var updateAllState = function() {
        var allChecked = true;
        for (var i = 0; i < itemCheckboxes.length; i++) {
            if (!itemCheckboxes[i].checked) {
                allChecked = false;
                break;
            }
        }
        isAllSelected = allChecked;
        updateBtnText();
    };

    checkallBtn.addEventListener('click', function() {
        isAllSelected = !isAllSelected;
        for (var i = 0; i < itemCheckboxes.length; i++) {
            itemCheckboxes[i].checked = isAllSelected;
        }
        updateBtnText();
    });

    for (var i = 0; i < itemCheckboxes.length; i++) {
        itemCheckboxes[i].addEventListener('change', updateAllState);
    }
});

/* 单条删除 — 事件委托 */
(function() {
    document.addEventListener('click', function(e) {
        var btn = e.target.closest('.js-delete-btn');
        if (!btn) return;
        e.preventDefault();
        var id = btn.getAttribute('data-id');
        if (id && confirm('您确定要删除吗？')) {
            window.location.href = getContextPath() + '/manager/updateManagerState?id=' + id;
        }
    });
})();

/* 批量删除确认 */
function delSelect() {
    var checked = document.querySelectorAll('.item-checkbox:checked');
    if (checked.length === 0) {
        alert('请选择您要删除的内容！');
        return false;
    }
    return confirm('您确认要删除选中的内容吗？');
}

function getContextPath() {
    var path = window.location.pathname;
    var ctx = path.substring(0, path.indexOf('/', 1));
    return ctx || '';
}
