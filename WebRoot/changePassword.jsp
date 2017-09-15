<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>crm</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
  <div class="page_title">修改密码(加密)</div>
  <br/><br/><br/>
  
  <font color="red"><s:actionmessage/></font>
  <s:form action="sysUserAction_changePassword" method="post" namespace="/">
	  <table class="data_list_table">
		  <tr>
		    <td align="right">旧密码:</td>
		    <td><s:password name="oldPassword"/></td>
		  </tr>
		  <tr>
	      <td align="right">新密码:</td>
	      <td><s:password name="newPassword"/></td>
	    </tr>
	    <tr>
	      <td align="right">确认新密码:</td>
	      <td><s:password name="renewPassword"/></td>
	    </tr>
	    <tr>
	      <td>&nbsp;</td>
	      <td><s:submit value="确定"/></td>
	    </tr>
	  </table>
  </s:form>
</body>
</html>