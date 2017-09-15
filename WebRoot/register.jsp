<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css" />
<script src="easyui/jquery.min.js"></script>
<script src="easyui/jquery.easyui.min.js"></script>
<script src="easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
$(function() {  
       $("#newimg").click(function() {  
           var rom = new Date();  
           $("#randomCode").attr("src", "randomCodeAction.action?timestamp="+rom);  
       });  
    });
</script>
<title>登录界面</title>
<link type="text/css" href="js/mini_24.css" rel="stylesheet" />
</head>
<body>
<div class="main" id="main">
	<div class="panel reg_panel" id="regPanel"  >
		<div class="form_reg">
			<div class="tabs fix">
				<a class="tabs_nav current" href="#">注册</a>
			</div>
			<form class="form form1 tabs_content" action="userAction_add" method="post">
			    <div class="tr input_wrap mobile_wrap">
			        <input required="required" placeholder="请输入账号" autocomplete="off" requiredtitle="别忘了账号" patterntitle="账号不正确呢" class="mobile" type="text" name="user.username" id="mobile" />
			    </div>
	            <div class="tr input_wrap passwd_wrap">
	                <input required="required" placeholder="请输入密码" autocomplete="off" title="别忘了密码" class="passwd" type="password" name="user.password" id="passwd"/>
	            </div>
			   <div class="tr input_wrap passwd_wrap">
	                <input required="required" placeholder="请再次密码" autocomplete="off" title="别忘了密码" class="passwd" type="password" name="repassword" id="passwd"/>
	            </div>
			   
				<div class="tr rule_wrap">
					<input type="checkbox" autocomplete="off" class="rule common_chk" checked="checked"/>我已阅读并同意<a href="http://www.baidu.com" target="_blank" tabIndex="-1">帐号使用协议</a>
				</div>
		        <div class="tr submit_wrap">
		            <input type="hidden" name="user.role" value="1" />
		            <input class="submit" type="submit" value="注 册"/>
		        </div>
			</form>
			
		</div>
		<div class="divider_line"></div>
		<div class="oauth_login">
			<div class="title">功能建设中</div>
	            <div class="oauth_frequent fix">
	                <a data-type="2" class="btn weibo_btn" href="#"><b>>></b>微博登录</a>
	                <a data-type="3" class="btn qq_btn" href="#"><b>>></b>QQ登录</a>
	            </div>
	           
	        </div>
		</div>
	</div>
	<div class="other_panel" id="otherPanel"></div>
<div class="loading" id="loading"></div>
<script type="text/javascript">
document.domain = 'tudou.com';
var _iwt_no_flash = 1; //fix艾瑞统计会造成页面刷新
</script>


</body>
</html>