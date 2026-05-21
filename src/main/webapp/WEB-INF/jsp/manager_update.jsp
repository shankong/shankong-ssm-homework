<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>修改管理员</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: "Microsoft YaHei", "微软雅黑", Arial, sans-serif;
            background-color: #f2f9fd;
            font-size: 14px;
            color: #333;
            padding: 20px;
        }
        .update-page-panel {
            max-width: 600px;
            margin: 0 auto;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 16px rgba(0, 0, 0, 0.06);
            overflow: hidden;
        }
        .update-page-header {
            background: linear-gradient(135deg, #1565c0, #1a73e8);
            padding: 24px 28px;
            text-align: center;
        }
        .update-page-header h2 {
            color: #fff;
            font-size: 18px;
            font-weight: 500;
            letter-spacing: 2px;
            margin: 0;
        }
        .update-page-header .subtitle {
            color: rgba(255, 255, 255, 0.75);
            font-size: 12px;
            margin-top: 4px;
        }
        .update-form { padding: 8px 0; }
        .update-form .form-row {
            display: flex;
            align-items: center;
            padding: 16px 28px;
            border-bottom: 1px solid #f5f5f5;
            transition: background 0.15s;
        }
        .update-form .form-row:hover { background: #fafcff; }
        .update-form .form-row:last-of-type { border-bottom: none; }
        .update-form .form-label {
            width: 100px;
            flex-shrink: 0;
            font-weight: 600;
            color: #37474f;
            font-size: 14px;
            display: flex;
            align-items: center;
            gap: 6px;
        }
        .update-form .form-label .label-icon {
            display: inline-block;
            width: 22px;
            height: 22px;
            line-height: 22px;
            text-align: center;
            background: #e3f2fd;
            color: #1a73e8;
            border-radius: 4px;
            font-size: 11px;
            font-weight: 700;
        }
        .update-form .form-field { flex: 1; }
        .update-form .form-field input[type="text"],
        .update-form .form-field input[type="password"] {
            width: 100%;
            height: 40px;
            padding: 0 14px;
            border: 1.5px solid #e0e0e0;
            border-radius: 8px;
            font-size: 14px;
            color: #333;
            background: #fafbfc;
            outline: none;
            transition: all 0.2s;
        }
        .update-form .form-field input:hover { border-color: #90caf9; }
        .update-form .form-field input:focus {
            border-color: #1a73e8;
            background: #fff;
            box-shadow: 0 0 0 3px rgba(26, 115, 232, 0.08);
        }
        .update-form .form-field select {
            width: 100%;
            height: 40px;
            padding: 0 14px;
            border: 1.5px solid #e0e0e0;
            border-radius: 8px;
            font-size: 14px;
            color: #333;
            outline: none;
            background: #fafbfc;
            cursor: pointer;
            -webkit-appearance: none;
            appearance: none;
        }
        .update-form .form-field select:focus {
            border-color: #1a73e8;
            background-color: #fff;
            box-shadow: 0 0 0 3px rgba(26, 115, 232, 0.08);
        }
        .update-form .form-field .readonly-value {
            display: inline-block;
            height: 40px;
            line-height: 40px;
            padding: 0 14px;
            background: #f5f7fa;
            border-radius: 6px;
            color: #1a73e8;
            font-weight: 600;
            font-size: 14px;
            letter-spacing: 0.5px;
        }
        .update-form .form-actions {
            padding: 24px 28px;
            text-align: center;
            background: #fafbfc;
            border-top: 1px solid #e8e8e8;
        }
        .update-form .btn-submit {
            height: 42px;
            padding: 0 40px;
            background: linear-gradient(135deg, #1a73e8, #1565c0);
            color: #fff;
            border: none;
            border-radius: 8px;
            font-size: 15px;
            font-weight: 500;
            cursor: pointer;
            letter-spacing: 2px;
            transition: all 0.25s;
        }
        .update-form .btn-submit:hover {
            background: linear-gradient(135deg, #1565c0, #0d47a1);
            box-shadow: 0 6px 20px rgba(26, 115, 232, 0.35);
            transform: translateY(-1px);
        }
    </style>
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
</head>
<body>

<div class="update-page-panel">
    <div class="update-page-header">
        <h2>修改管理员</h2>
        <div class="subtitle">修改管理员账号信息</div>
    </div>

    <form class="update-form" method="post" action="${pageContext.request.contextPath}/manager/updateManager">
        <input type="hidden" name="managerId" value="${manager.managerId}" />

        <div class="form-row">
            <div class="form-label">
                <span class="label-icon">ID</span>
                管理员ID
            </div>
            <div class="form-field">
                <span class="readonly-value">${manager.managerId}</span>
            </div>
        </div>

        <div class="form-row">
            <div class="form-label">
                <span class="label-icon">N</span>
                用户名
            </div>
            <div class="form-field">
                <input type="text" name="managerName" value="${manager.managerName}" placeholder="请输入管理员用户名" />
            </div>
        </div>

        <div class="form-row">
            <div class="form-label">
                <span class="label-icon">P</span>
                新密码
            </div>
            <div class="form-field">
                <input type="password" name="managerPwd" placeholder="留空则不修改密码" autocomplete="new-password" />
            </div>
        </div>

        <div class="form-row">
            <div class="form-label">
                <span class="label-icon">S</span>
                状态
            </div>
            <div class="form-field">
                <select name="managerState">
                    <c:set var="s" value="${manager.managerState}" />
                    <option value="1" <c:if test="${s eq '1' || s eq '启用'}">selected</c:if>>启用</option>
                    <option value="0" <c:if test="${s eq '0' || s eq '禁用'}">selected</c:if>>禁用</option>
                </select>
            </div>
        </div>

        <div class="form-actions">
            <button type="submit" class="btn-submit">保存修改</button>
        </div>
    </form>
</div>

</body>
</html>
