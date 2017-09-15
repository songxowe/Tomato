<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
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
<link type="text/css" href="js/mini_24.css" rel="stylesheet" charset="utf-8"/>
</head>
<body>
<div class="main" id="main">
	<div class="panel login_panel fix" id="loginPanel"  style="display:block;" >
		<div class="form_login">
			<div class="header fix">
				<h2>登录<span class="form_login_title_tip">暂仅支持用户名登录</span></h2>
			</div>
	        <div class="oauth_login">
	            <div class="oauth_frequent fix">
	                <a href="#" class="btn weibo_btn" ><b></b>微博登录</a>
	                <a href="#" class="btn qq_btn"><b></b>QQ登录</a>
	                <a href="#" class="more"></a>
	            </div>
	            <div class="oauth_more fix">
	                	                					<a href="#" title="淘宝网" class="btn taobao_btn" data-type="11"><b></b>淘宝网</a>
	            </div>
	        </div>
			<form class=""  action="userAction_login" method="post">
				<div class="clear">&nbsp;</div>
	            <div class="tr input_wrap loginname_wrap">
	                <input type="text" required="required" title="请填写账号" placeholder="账号" class="loginname" name="user.username" id="loginname"/><i class="iconfont mobile_ico">&#xe623;</i>
	                <i class="iconfont email_ico">&#xe62b;</i>
	            </div>
	            <div class="tr input_wrap password_wrap">
		            <div class="password_wrap1">
		                <input required="required" title="请填写密码" placeholder="密码" type="password" class="password" name="user.password" id="password1"/>
		            </div>
		            
					<a href="#" class="v_btn">动态密码登录</a>
					<div class="free_reg_tips">
						<span class="arrow"></span>
						<span class="arrow_help"></span>
						<p><em>免注册</em>仅需<br/>手机号快速登录</p>
					</div>
	            </div>
				<div style="margin-top: 15px">
				<table>
			        <tr><th><input placeholder="验证码" type="text" name="validateCode" style="height: 23px"/><td>
			        <th>
					<a href="#" id="newimg"><img src="randomCodeAction" id="randomCode"	width="90" height="25" alt="验证码图片" /></a>
					</th></tr>
			    </table>
			    </div>
				<div class="tr submit_wrap">
					<input class="submit" type="submit" value="登 录"/>
				</div>
				<ul class="quick_nav fix">
					<li class="first">
						<input type="checkbox" name="remember" checked="checked" class="common_chk" value="true"/>自动登录 
					</li>
					<li>
						<a href="http://login.tudou.com/lost.do?act=selectMethod" target="_blank" class="forget">忘记密码</a>
					</li>
					<li class="last">
						<a class="go_reg" href="/Tomato/register.jsp">免费注册</a>
					</li>
				</ul>
			</form>
		</div>
		<div class="divider_line"></div>
		<div class="QRcode_login" id="QRcodeLogin">
			<div class="title">用手机扫描，加支付宝~</div>
			<div class="img">
				<img src="js/disable.jpg" id="QRcodeImg"/>
				<div class="mask"></div>
				<div class="invalid_note">二维码已失效</div>
				<a href="#" class="refresh">点击刷新</a>
			</div>
			<div class="support_note">欢迎捐赠~</div>
		</div>
	</div>
	<div class="panel reg_panel" id="regPanel"  >
	</div>
	<div class="other_panel" id="otherPanel"></div>
</div>
<div class="loading" id="loading"></div>
<script type="text/javascript">
document.domain = 'tudou.com';
var _iwt_no_flash = 1; //fix艾瑞统计会造成页面刷新
</script>
<script src="http://js.tudouui.com/v3/dist/js/lib_6.js" id="libjsnode"></script>
<script src="http://js.tudouui.com/v3/dist/js/g_136.js"></script>
<script src="http://js.tudouui.com/v3/dist/js/page/login/mini_41.js"></script>

</body>
</html>