<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
<meta charset="UTF-8">
<head>
<TITLE>视屏播放页面</TITLE>
<LINK href="js/g_82.css" rel="stylesheet" type="text/css">
<LINK href="js/index_24.css" rel="stylesheet" type="text/css">
<STYLE type="text/css">
.table a{
  color: rgb(75, 127, 129);
  position: relative;top: 10px;
}
.table span{
  color: rgb(40, 40, 40);
}
.v_login {
	text-align: center;
	margin-right: 16px;
	float: left;
	background: rgb(255, 102, 0);
	border-radius: 2px;
	border: 1px solid rgb(199, 206, 210);
	border-image: none;
	width: 78px;
	height: 42px;
	text-align: center;
	color: rgb(25, 29, 36);
	line-height: 42px;
	display: block;
}

.v_login:hover {
	background: rgb(235, 82, 30);
	box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.08);
}

.v_login span {
	color: rgb(255, 255, 255);
}

.index_top {
	background-color: rgb(255, 102, 0);
}

.index_top span {
	color: rgb(255, 255, 255);
}

.oly-medal {
	float: right;
	width: 305px;
	height: 32px;
	line-height: 32px;
	font-size: 13px;
	color: #fff;
	position: absolute;
	right: 0px;
	top: 20px;
	display: inline-block;
	background: url("http://r4.ykimg.com/0510000057A0686367BC3D0548093BA3")
		right bottom no-repeat
}

.oly-medal span {
	float: right;
	margin-right: 13px;
}

.oly-medal span.flag {
	margin-right: 24px;
}

.oly-medal em {
	font-style: normal;
}

.oly-medal .oly-ico {
	width: 16px;
	height: 16px;
	display: inline-block;
	position: relative;
	top: 3px;
	right: 4px;
	background: url("http://r3.ykimg.com/0510000057A0686A67BC3D4B48027726")
		no-repeat;
}

.oly-medal .ico-gold {
	background-position: 0 0;
}

.oly-medal .ico-silver {
	background-position: -18px 0;
}

.oly-medal .ico-copper {
	background-position: -36px 0;
}

.oly-medal .ico-flag {
	width: 26px;
	height: 18px;
	top: 4px;
	background-position: -54px 0;
}

.oly-logo {
	float: left;
}

/*.page-container{ background: #fff url(http://u2.thimg.com/3/256/150/15287416533077464662098175528966007933.jpg) top center no-repeat; padding-top: 153px; } */
.mod_app {
	margin-top: 16px;
}

.page-container {
	overflow-x: hidden;
}

.pop_right_top {
	position: absolute;
	top: 18px;
	right: 0;
}

.w880 .w880-hide {
	display: none;
}
</STYLE>

<script type="text/javascript" src="js/jquery-1.4.3.min.js"></script>
</HEAD>
<BODY>


	<DIV class="g-top" id="gTop">
		<DIV class="g_main">
			<DIV class="mask g_main_mask"></DIV>
			<DIV class="logo">
				<A title="土豆 tudou.com 每个人都是生活的导演" class="g_logo"
					href="http://www.tudou.com/"><IMG width="100px" height="50px"
					src="js/logo.jpg"></A>
			</DIV>
			<DIV class="g_main_c">
				<DIV class="g-search">
					<FORM action="http://www.soku.com/t/nisearch.do" method="get"
						target="_blank">
						<DIV class="g-search-box">
							<INPUT name="kw" class="g-search-text tui_searchint" id="headq"
								accesskey="s" onfocus="this['_gs_focus']=1"
								onblur="this['_gs_focus']=0" type="text" autocomplete="off">
						</DIV>
						<DIV class="g-search-btn">
							<BUTTON class="g-search-submit" type="submit">
								<I class="iconfont"></I>搜库
							</BUTTON>
						</DIV>
						<INPUT name="cid" disabled="disabled" type="hidden" value="th.t">
					</FORM>
					<A title="土豆排行榜" class="g-rank iconfont"
						href="http://www.tudou.com/top/rank.html" target="_blank"></A>
				</DIV>
			</DIV>
			<DIV class="g_user_wrap">
				<DIV class="g_upload" id="uploadNav">
					<A class="g_dropdown_toggle" id="uploadVideo"
						href="http://www.tudou.com/my/program/publish.html"
						target="_blank">上传视频</A><I class="caret"><I></I></I>
					<DIV class="g_dropdown_menu">
						<UL class="fix">
							<LI><A href="http://www.tudou.com/my/program/publish.html"
								target="_blank"><I class="iconfont"></I>上传</A></LI>
							<LI><A
								href="http://www.tudou.com/my/center/item/itemList.do"
								target="_blank"><I class="iconfont"></I>视频管理</A></LI>
							<LI><A href="http://index.tudou.com/mydata/index.html"
								target="_blank"><I class="iconfont"></I>指数</A></LI>
							<LI><A href="http://share.tudou.com/" target="_blank"><I
									class="iconfont"></I>分成</A></LI>
						</UL>
					</DIV>
				</DIV>
				<DIV style="" class="v_login">
					<a href="" target="_blank"><span>登录</span></a>
				</DIV>
				<DIV class="g_message" id="gTopMessage">
					<A class="g_dropdown_toggle"
						href="http://www.tudou.com/my/center/message.action"
						target="_blank"><I class="iconfont"></I></A>
				</DIV>
			</DIV>
			<!--导航  -->
			<DIV class="g_nav">
				<DIV class="g_nav_main">
					<UL class="g-nav-master" id="master">
						<LI id="g-nav-first"><A href="http://www.tudou.com/">首页</A></LI>
						<LI><A href="http://tv.tudou.com/">电视剧</A></LI>
						<LI><A href="http://movie.tudou.com/">电影</A></LI>
						<LI><A href="http://cartoon.tudou.com/">动漫</A></LI>
						<LI><A href="http://child.tudou.com/">少儿</A></LI>
						<LI><A href="http://zy.tudou.com/">综艺</A></LI>
						<LI><A href="http://music.tudou.com/">音乐</A></LI>
						<LI><A href="http://zhibo.tudou.com/">来疯</A></LI>
						<LI><A href="http://ent.tudou.com/">娱乐</A></LI>
						<LI><A href="http://fun.tudou.com/">搞笑</A></LI>
						<LI><A href="http://fashion.tudou.com/">时尚</A></LI>
					</UL>
					<UL class="g-nav-sub" id="gNavSub">
						<LI><A href="http://vip.tudou.com/">会员</A></LI>
						<LI><A href="http://z.youku.com/?from=thzz" target="_blank">奇幻</A></LI>
					</UL>
				</DIV>
			</DIV>
		</DIV>
	</DIV>
	<DIV class="g-container" id="gContainer">
		<DIV class="g-sidebar g-sidebar-init" id="gSideBar">
			<DIV class="g-side-menu">
				<UL id="gSideMenu">
					<LI data-act="home" class="index_top"><A
						href="http://www.tudou.com/"><I class="iconfont"></I><SPAN>首页</SPAN></A></LI>
					<LI data-act="sub"><A
						href="http://www.tudou.com/watch/subscribe/" data-role="pagex"><I
							class="iconfont"></I><SPAN>我的</SPAN><EM id="gSideSubBadge">•</EM><B
							class="count-badge" id="gSideSubCount"></B></A></LI>
					<LI data-act="history"><A
						href="http://www.tudou.com/watch/history/" data-role="pagex"><I
							class="iconfont"></I><SPAN>观看记录</SPAN></A></LI>
					<LI data-act="vip"><A href="http://vip.tudou.com/"><I
							class="iconfont"></I><SPAN>会员尊享</SPAN></A></LI>
				</UL>
			</DIV>
			<DIV class="g-side-subs" id="gSideSubs">
				<DIV class="g-subs-recom">
					<H2>
						<I class="iconfont"></I>新鲜自频道
					</H2>
				</DIV>
				<DIV class="g-subs-title">
					<H2>
						<I class="iconfont"></I>订阅列表
					</H2>
				</DIV>
			</DIV>
		</DIV>
		<DIV class="g-side-menu g-side-manage">
			<UL>
				<LI class="square" data-act="square"><A
					href="http://gc.tudou.com/index.html"><I class="iconfont"></I><SPAN>添加自频道</SPAN></A></LI>
				<LI data-act="manage"><A
					href="http://www.tudou.com/watch/subscribe/?type=manage"
					data-role="pagex"><I class="iconfont"></I><SPAN>管理订阅</SPAN></A></LI>
			</UL>
		</DIV>
	</DIV>
	
	<table class="table" style="margin-left: 300px;margin-top: -50px">
		<tr>
			<th  rowspan="8" >
				<!--酷播迷你CuPlayerMiniV4.0/代码开始--> <script type="text/javascript"
					src="images/swfobject.js"></script>
				<div class="video" id="CuPlayer" style="950px;margin:0 auto;">
					我爱播放器(52player.com) 提示：您的Flash Player版本过低，请<a
						href="http://www.52player.com/">点此进行网页播放器升级</a>！
				<% String video = (String)request.getAttribute("videoname"); %>
				</div> <script type="text/javascript">
					var so = new SWFObject("CuPlayerMiniV4.swf", "CuPlayerV4", "720", "480", "9", "#000000");
					so.addParam("allowfullscreen", "true");
					so.addParam("allowscriptaccess", "always");
					so.addParam("wmode", "opaque");
					so.addParam("quality", "high");
					so.addParam("salign", "lt");
					so.addVariable("CuPlayerSetFile", "CuPlayerSetFile.xml"); //播放器配置文件地址
					so.addVariable("CuPlayerFile", "video/<%=video %>.mp4"); //视频文件地址
					so.addVariable("CuPlayerImage", "images/<%=video %>.jpg"); //视频略缩图
					so.addVariable("CuPlayerWidth", "720"); //视频宽度
					so.addVariable("CuPlayerHeight", "480"); //视频高度
					so.addVariable("CuPlayerAutoPlay", "no"); //是否自动播放
					so.write("CuPlayer");
				</script> 
			</th>
		</tr>
		<tr>
			<th><a href="#" onclick="changeStream(0);">&nbsp;&nbsp;<span>【</span>达利园青梅绿茶宣传广告梅绿茶宣告<span>】</span></a></th>
        </tr><tr>
			<th><a href="#" onclick="changeStream(1);">&nbsp;&nbsp;<span>【</span>达利园青梅绿茶宣传广告梅<span>】</span></a></th>
        </tr><tr>
			<th><a href="#" onclick="changeStream(2);">&nbsp;&nbsp;<span>【</span>达利园青梅绿茶宣传广告梅绿茶宣告<span>】</span></a></th>
        </tr><tr>
			<th><a href="#" onclick="changeStream(3);">&nbsp;&nbsp;<span>【</span>达利园青梅绿茶宣传广告梅绿茶<span>】</span></a></th>
        </tr><tr>
			<th><a href="#" onclick="changeStream(4);">&nbsp;&nbsp;<span>【</span>达利园青梅绿茶宣传广告梅<span>】</span></a></th>
        </tr><tr>
			<th><a href="#" onclick="changeStream(5);">&nbsp;&nbsp;<span>【</span>达利园青梅绿茶宣传广告梅绿茶宣告<span>】</span></a></th>
        </tr><tr>
			<th><a href="#" onclick="changeStream(6);">&nbsp;&nbsp;<span>【</span>达利园青梅绿茶宣传广告梅绿茶<span>】</span></a></th>
		</tr>
	</table>
</BODY>
</HTML>
