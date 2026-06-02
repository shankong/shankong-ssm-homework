/**
 * Shared admin list page functionality.
 * Usage: add data-config to the batch form with deleteUrl and checkboxName.
 *   <form ... data-delete-url="/catalog/deleteCatalog" data-checkbox-name="catalogId">
 */
(function () {
    var form = document.getElementById('batchForm');
    if (!form) return;

    var checkallBtn = document.getElementById('checkallBtn');
    var batchDelBtn = document.getElementById('batchDelBtn');
    if (!checkallBtn || !batchDelBtn) return;

    var deleteUrl = form.getAttribute('data-delete-url');
    var isAllSelected = false;

    function getItemCheckboxes() {
        return document.querySelectorAll('.item-checkbox');
    }

    function updateBtnText() {
        checkallBtn.innerHTML = isAllSelected
            ? '<span class="icon-check"></span> 取消全选'
            : '<span class="icon-check"></span> 全选本页';
    }

    function updateAllState() {
        var boxes = getItemCheckboxes();
        var allChecked = true;
        for (var i = 0; i < boxes.length; i++) {
            if (!boxes[i].checked) {
                allChecked = false;
                break;
            }
        }
        isAllSelected = allChecked;
        updateBtnText();
    }

    checkallBtn.addEventListener('click', function () {
        isAllSelected = !isAllSelected;
        var boxes = getItemCheckboxes();
        for (var i = 0; i < boxes.length; i++) {
            boxes[i].checked = isAllSelected;
        }
        updateBtnText();
    });

    // Delegate change events on item checkboxes via the form
    form.addEventListener('change', function (e) {
        if (e.target.classList.contains('item-checkbox')) {
            updateAllState();
        }
    });

    batchDelBtn.addEventListener('click', function () {
        var checked = document.querySelectorAll('.item-checkbox:checked');
        if (checked.length === 0) {
            alert('请选择您要删除的内容！');
            return;
        }
        if (confirm('您确认要删除选中的' + checked.length + '条内容吗？')) {
            form.submit();
        }
    });

    // Single delete via event delegation
    document.addEventListener('click', function (e) {
        var btn = e.target.closest('.js-delete-btn');
        if (!btn) return;
        e.preventDefault();
        var id = btn.getAttribute('data-id');
        if (id && confirm('您确定要删除吗？')) {
            window.location.href = getContextPath() + deleteUrl + '?id=' + id + '&page=' + getCurrentPage();
        }
    });

    function getContextPath() {
        var path = window.location.pathname;
        var ctx = path.substring(0, path.indexOf('/', 1));
        return ctx || '';
    }

    function getCurrentPage() {
        var pageInput = form.querySelector('input[name="page"]');
        return pageInput ? pageInput.value : '1';
    }
})();
