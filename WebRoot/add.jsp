<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css"
	href="easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css" />
<script src="easyui/jquery.min.js"></script>
<script src="easyui/jquery.easyui.min.js"></script>
<script src="easyui/locale/easyui-lang-zh_CN.js"></script>
</head>
<body>
	<h1>注册</h1>
	<s:form action="userAction_add" method="post">
		<table>
			<tr>
				<td><s:textfield name="user.username" label="账号" /></td>
			</tr>
			<tr>
				<td><s:password name="user.password" label="密码" /></td>
			</tr>
			<tr>
				<td><s:password name="repassword" label="重复密码" /></td>
			</tr>
			<tr>
			<td><s:textfield name="user.role" value="1" label="权限" readonly="readonly"/></td>
			</tr>
			<tr>
				<td><s:submit value="注册" /></td>
			</tr>
		</table>
	</s:form>
</body>
</html>