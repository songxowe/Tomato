<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script type="text/javascript">
		function logout() { 
			var msg = "您确定要退出吗？"; 
			if (confirm(msg)){ 
				window.parent.location = "sysUserAction_logout.action";
			}
		} 
		</script>
		<style type="text/css">
a {
	text-decoration: none;
	font-weight: 800;
}

a:link {
	color: #FFFFFF;
}

a:visited {
	color: #FFFFFF;
}  /*激活过后状态*/
a:hover {
	color: rgb(230,230,230);
}  /*移上去中状态*/
a:active {
	color: rgb(230,230,230);
} /*移上去点击时状态*/
</style>
	</head>
	<body topmargin="0">
		<table width="100%" height="88" cellpadding="0" cellspacing="0">
			<tr
				style="background-image: url(images/top-background.png); background-repeat: repeat-x;">
				<td>
					<img src="images/logo.gif" width="49" height="49">
				</td>
				<td style="font-family:黑体;font-size:33px;font-weight:bold;"> 电影管理系统</td>
				
				<td align="right">
				    当前用户:&nbsp;<s:property value="#session.user.usrName" />&nbsp;|&nbsp;
					<a href="changePassword.jsp" target="right"
						title="修改密码">修改密码 </a> &nbsp;|&nbsp;
					<a href="javascript: logout();" title="注销"> 注销 </a>

				</td>
				<td width="10"></td>
			</tr>
			<tr height="8" style="background-image: url(images/bar.gif);">
				<td colspan="4"></td>
			</tr>
		</table>
	</body>
</html>