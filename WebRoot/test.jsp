<%@page import="com.spring.pojo.VVideo"%>
<%@page import="java.util.List"%>
<%@page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<meta charset="UTF-8">
<head>
		 <TITLE>niconico~</TITLE>		 
<META name="Keywords" content="视频下载,视频搜索,电影视频,电视剧视频,综艺视频,游戏视频,舞蹈视频,在线视频免费视频,自拍,视频教学,网络视频,搞笑视频,视频短片">
		 
<META name="Description" content="免费无限空间，上传你的视频，观看和搜索海量视频节目，收藏你喜欢的视频，订阅你关注的播客，简单方便地分享给你的朋友们。土豆热爱原创，每个人都是生活的导演，戴上土豆面具，每个人都是明星。">
		 <LINK href="js/g_82.css" rel="stylesheet" 
type="text/css">		 <LINK href="js/index_24.css" 
rel="stylesheet" type="text/css">		 
<STYLE type="text/css">

.v_login {
	text-align: center; margin-right: 16px; float: left;
	background: rgb(255, 102, 0); border-radius: 2px; border: 1px solid rgb(199, 206, 210); border-image: none; width: 78px; height: 42px; text-align: center; color: rgb(25, 29, 36); line-height: 42px; display: block;
}
.v_login:hover {
	background: rgb(235, 82, 30); box-shadow: 0px 1px 1px rgba(0,0,0,0.08);
}
.v_login span{ color: rgb(255, 255, 255);}

.index_top{background-color: rgb(255, 102, 0);}
.index_top span{ color: rgb(255, 255, 255);}
.oly-medal{
float:right;width:305px;height:32px;line-height:32px;font-size:13px;color:#fff;position:absolute;right:0px;top:20px;display:inline-block;background:url("http://r4.ykimg.com/0510000057A0686367BC3D0548093BA3") right bottom no-repeat}
.oly-medal span{float: right; margin-right:13px;}
.oly-medal span.flag{margin-right: 24px;}
.oly-medal em{ font-style: normal;}
.oly-medal .oly-ico{width: 16px; height: 16px;display: inline-block;position: relative;top:3px;right: 4px;background:url("http://r3.ykimg.com/0510000057A0686A67BC3D4B48027726") no-repeat; }
.oly-medal .ico-gold{ background-position: 0 0 ; }
.oly-medal .ico-silver{background-position: -18px 0 ;}
.oly-medal .ico-copper{background-position: -36px 0 ;}
.oly-medal .ico-flag{width: 26px;height: 18px;top:4px;background-position: -54px 0 ;}
.oly-logo{float:left;}

/*.page-container{ background: #fff url(http://u2.tdimg.com/3/256/150/15287416533077464662098175528966007933.jpg) top center no-repeat; padding-top: 153px; } */
.mod_app{margin-top:16px;}
.page-container{overflow-x:hidden;}
.pop_right_top{position: absolute; top: 18px; right: 0;}
.w880 .w880-hide{display:none;}

/*首页1+8模块置灰*/
/*
#m1268,#m1269,#m1271{
filter: grayscale(100%);
-webkit-filter: grayscale(100%);
-moz-filter: grayscale(100%);
-ms-filter: grayscale(100%);
-o-filter: grayscale(100%);
filter: url("data:image/svg+xml;utf8,<svg xmlns=\'http://www.w3.org/2000/svg\'><filter id=\'grayscale\'><feColorMatrix type=\'matrix\' values=\'0.3333 0.3333 0.3333 0 0 0.3333 0.3333 0.3333 0 0 0.3333 0.3333 0.3333 0 0 0 0 0 1 0\'/></filter></svg>#grayscale");
filter:progid:DXImageTransform.Microsoft.BasicImage(grayscale=1);
-webkit-filter: grayscale(1);
}


*/</STYLE>
	
<META name="GENERATOR" content="MSHTML 11.00.9600.18377"></HEAD>							
<BODY>
<SCRIPT>
			/**
 * @modified $Author: mushaofeng $
 * @version $Rev: f757627042b9e1522880d4334bfd08a25d9199f9 $
 */
!function(e){if(navigator.userAgent.indexOf("iPad")>-1){var t=e.createElement("meta");t.setAttribute("name","viewport");t.setAttribute("content","width=1180px");e.head.appendChild(t);e.body.className="w1104 g-sidebar-hide g-sidebar-top"}else{var i=e.body;var n=i.className||"";var a=(e.documentElement||i).clientWidth;if(/g-sidebar-hide/.test(n)){if(a>1388)n+=" w1328";else if(a<1164)n+=" w880"}else if(a>1588)n+=" w1328";else if(a<=1364&&a>=1140)n+=" w880";else if(a<=1140)n+=" w880  g-sidebar-hide";if(a<1140)n+=" g-sidebar-top";i.className=n}}(document);;
			var pageId = 300;
		</SCRIPT>
		 
<DIV class="g-top" id="gTop">
<DIV class="g_main">
<DIV class="mask g_main_mask"></DIV>
<DIV class="logo"><A title="土豆 tudou.com 每个人都是生活的导演" class="g_logo" href="http://www.tudou.com/"><IMG width="100px" height="50px" src="js/logo.jpg"></A>
</DIV>
<DIV class="g_main_c">
<DIV class="g-search">
<FORM action="http://www.soku.com/t/nisearch.do" method="get" target="_blank" searchtype="">
<DIV 
class="g-search-box"><INPUT name="kw" class="g-search-text tui_searchint" id="headq" accesskey="s" onfocus="this['_gs_focus']=1" onblur="this['_gs_focus']=0" type="text" autocomplete="off"></DIV>
<DIV class="g-search-btn"><BUTTON class="g-search-submit" type="submit"><I 
class="iconfont"></I>搜库</BUTTON></DIV><INPUT name="cid" disabled="disabled" type="hidden" value="td.t"></FORM><A 
title="土豆排行榜" class="g-rank iconfont" href="http://www.tudou.com/top/rank.html" 
target="_blank"></A></DIV></DIV>
<DIV class="g_user_wrap">
<DIV class="g_upload" id="uploadNav"><A class="g_dropdown_toggle" id="uploadVideo" 
href="http://www.tudou.com/my/program/publish.html" target="_blank">上传视频</A><I 
class="caret"><I></I></I>
<DIV class="g_dropdown_menu">
<UL class="fix">
  <LI><A href="http://www.tudou.com/my/program/publish.html" target="_blank"><I 
  class="iconfont"></I>上传</A></LI>
  <LI><A href="http://www.tudou.com/my/center/item/itemList.do" 
  target="_blank"><I class="iconfont"></I>视频管理</A></LI>
  <LI><A href="http://index.tudou.com/mydata/index.html" target="_blank"><I 
  class="iconfont"></I>指数</A></LI>
  <LI><A href="http://share.tudou.com/" target="_blank"><I 
  class="iconfont"></I>分成</A></LI></UL></DIV></DIV>
<DIV style="" class="v_login"><c:if test="${empty sessionScope.user}"><a href="/Tomato/login.jsp" target="_blank"><span>登录</span></a></c:if><c:if  test="${!empty sessionScope.user}"><span>欢迎回来</span></c:if></DIV>
<DIV class="g_message" id="gTopMessage"><A class="g_dropdown_toggle" href="http://www.tudou.com/my/center/message.action" 
target="_blank"><I class="iconfont"></I></A></DIV></DIV>
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
<UL class="g-nav-sub" id="gNavSub">
  <LI><A href="http://vip.tudou.com/">会员</A></LI>
  <LI><A href="http://z.youku.com/?from=tdzz" 
target="_blank">奇幻</A></LI></UL></DIV></DIV></DIV></DIV>
<DIV class="g-container" id="gContainer">
<DIV class="g-sidebar g-sidebar-init" id="gSideBar">
<DIV class="g-side-menu">
<UL id="gSideMenu">
  <LI data-act="home" class="index_top"><A href="http://www.tudou.com/"><I 
  class="iconfont"></I><SPAN>首页</SPAN></A></LI>
  <LI data-act="sub"><A href="http://www.tudou.com/watch/subscribe/" data-role="pagex"><I 
  class="iconfont"></I><SPAN>我的</SPAN><EM id="gSideSubBadge">•</EM><B class="count-badge" 
  id="gSideSubCount"></B></A></LI>
  <LI data-act="history"><A href="http://www.tudou.com/watch/history/" 
  data-role="pagex"><I class="iconfont"></I><SPAN>观看记录</SPAN></A></LI>
  <LI data-act="vip"><A href="http://vip.tudou.com/"><I 
  class="iconfont"></I><SPAN>会员尊享</SPAN></A></LI></UL></DIV>
<DIV class="g-side-subs" id="gSideSubs">
<DIV class="g-subs-recom">
<H2><I class="iconfont"></I>新鲜自频道</H2></DIV>
<DIV class="g-subs-title">
<H2><I class="iconfont"></I>订阅列表</H2></DIV>
<DIV title="排序" class="g-subs-sort" id="gSideSubSort"><I class="iconfont"></I>
<UL>
  <LI data-order="1">更新时间(从新到旧)</LI>
  <LI data-order="0">订阅时间(从新到旧)</LI>
  <LI data-order="2">名称首字母(升序)</LI></UL></DIV>
<DIV class="g-subs-list-wrap">
<DIV class="g-subs-message" id="gSideSubMessage"></DIV>
<DIV class="g-subs-list" id="gSideSubList">
<UL class="g-subs-group" id="gSideSubGroup"></UL>
<UL class="g-subs-group" id="gSideSubItems"></UL>
<DIV class="g-side-recom" id="gSideRecom">
<UL class="g-subs-group" id="gSideRecomItems"></UL><A class="more-recom" href="http://gc.tudou.com/index.html">更多推荐&gt;&gt;</A></DIV></DIV></DIV>
<DIV class="g-subs-mo g-subs-list" id="gSideMore">
<DIV class="g-sidesub-scroll">
<UL class="g-subs-group" id="gSideSubScroll"></UL><A class="goto" href="http://www.tudou.com/watch/subscribe/?type=manage">查看全部</A></DIV></DIV></DIV>
<DIV class="gSideloading"></DIV>
<DIV class="g-side-menu g-side-manage">
<UL>
  <LI class="square" data-act="square"><A 
  href="http://gc.tudou.com/index.html"><I 
  class="iconfont"></I><SPAN>添加自频道</SPAN></A></LI>
  <LI data-act="manage"><A href="http://www.tudou.com/watch/subscribe/?type=manage" 
  data-role="pagex"><I class="iconfont"></I><SPAN>管理订阅</SPAN></A></LI></UL></DIV>
</DIV>
<DIV class="page-container">
<DIV class="warp">
<DIV id="ab_101312"></DIV>
<DIV id="ab_101313"></DIV>
<DIV class="ad_video_banner ad_banner">
<DIV id="ab_101215"></DIV></DIV>
<DIV class="main" id="main">
<DIV class="mod fix" id="m1268">

<% List<VVideo> v = (List<VVideo>)request.getAttribute("video");%>

<DIV class="col6" data-mp="mp305">
<DIV class="col2">
<DIV class="pack_focus">
<DIV class="pic"><A title="<<%=v.get(0).getVideoname() %>>正在热播~" href="videoAction_deliver?videoname=<%=v.get(0).getVideoname() %>" 
></A><I class="bg"></I><IMG class="quic" src="images/<%=v.get(0).getVideoname() %>.jpg"></DIV>
<DIV class="txt">
<H6 class="caption"><A title="<<%=v.get(0).getVideoname() %>>正在热播~" href="videoAction_deliver?videoname=<%=v.get(0).getVideoname() %>" 
>&lt;<%=v.get(0).getVideoname() %>&gt;正在热播~</A></H6>
<P><%=v.get(0).getIntroduce() %></P></DIV></DIV>


<DIV class="col1 ">
<DIV class="pack packs">
<DIV class="pic"><A title="<<%=v.get(1).getVideoname() %>><%=v.get(1).getIntroduce() %>" href="videoAction_deliver?videoname=<%=v.get(1).getVideoname() %>" 
target="new"></A><I class="bg"></I><IMG class="quic" src="images/<%=v.get(1).getVideoname() %>.jpg"></DIV>
<DIV class="txt ">
<H6 class="caption"><A title="<<%=v.get(1).getVideoname() %>><%=v.get(1).getIntroduce() %>" href="videoAction_deliver?videoname=<%=v.get(1).getVideoname() %>" 
target="new">&lt;<%=v.get(1).getVideoname() %>&gt;<%=v.get(1).getIntroduce() %></A></H6>
<UL class="info">
  <LI class="d">免费观看</LI>
  <LI class="play"><A href="videoAction_deliver?videoname=<%=v.get(1).getVideoname() %>" 
  target="_blank">查看详情</A></LI></UL></DIV></DIV></DIV>
  
<DIV class="col1  col0">
<DIV class="pack packs">
<DIV class="pic"><A title="<<%=v.get(2).getVideoname() %>><%=v.get(2).getIntroduce() %>" href="videoAction_deliver?videoname=<%=v.get(2).getVideoname() %>" 
target="new"></A><I class="bg"></I><IMG class="quic" src="images/<%=v.get(2).getVideoname() %>.jpg"></DIV>
<DIV class="txt ">
<H6 class="caption"><A title="<<%=v.get(2).getVideoname() %>><%=v.get(2).getIntroduce() %>" href="videoAction_deliver?videoname=<%=v.get(2).getVideoname() %>" 
target="new">&lt;<%=v.get(2).getVideoname() %>&gt;<%=v.get(2).getIntroduce() %></A></H6>
<UL class="info">
  <LI class="d">免费观看</LI>
  <LI class="play"><A href="videoAction_deliver?videoname=<%=v.get(2).getVideoname() %>" 
  target="_blank">查看详情</A></LI></UL></DIV></DIV></DIV></DIV>
  
<DIV class="col1  ">
<DIV class="pack packs">
<DIV class="pic"><A title="<<%=v.get(3).getVideoname() %>><%=v.get(3).getIntroduce() %>" href="videoAction_deliver?videoname=<%=v.get(3).getVideoname() %>" 
target="new"></A><I class="bg"></I><IMG class="quic" src="images/<%=v.get(3).getVideoname() %>.jpg"></DIV>
<DIV class="txt ">
<H6 class="caption"><A title="<<%=v.get(3).getVideoname() %>><%=v.get(3).getIntroduce() %>" href="videoAction_deliver?videoname=<%=v.get(3).getVideoname() %>" 
target="new">&lt;<%=v.get(3).getVideoname() %>&gt;<%=v.get(3).getIntroduce() %></A></H6>
<UL class="info">
  <LI class="d">免费观看</LI>
  <LI class="play"><A href="videoAction_deliver?videoname=<%=v.get(3).getVideoname() %>" 
  target="_blank">查看详情</A></LI></UL></DIV></DIV>
  
  
<DIV class="pack packs">
<DIV class="pic"><A title="<<%=v.get(4).getVideoname() %>><%=v.get(4).getIntroduce() %>" href="videoAction_deliver?videoname=<%=v.get(4).getVideoname() %>" 
target="new"></A><I class="bg"></I><IMG class="quic" src="images/<%=v.get(4).getVideoname() %>.jpg"></DIV>
<DIV class="txt ">
<H6 class="caption"><A title="<<%=v.get(4).getVideoname() %>><%=v.get(4).getIntroduce() %>" href="videoAction_deliver?videoname=<%=v.get(4).getVideoname() %>" 
target="new">&lt;<%=v.get(4).getVideoname() %>&gt;<%=v.get(4).getIntroduce() %></A></H6>
<UL class="info">
  <LI class="d">免费观看</LI>
  <LI class="play"><A href="videoAction_deliver?videoname=<%=v.get(4).getVideoname() %>" 
  target="_blank">查看详情</A></LI></UL></DIV></DIV>
  
  
<DIV class="pack packs">
<DIV class="pic"><A title="<<%=v.get(5).getVideoname() %>><%=v.get(5).getIntroduce() %>" href="videoAction_deliver?videoname=<%=v.get(5).getVideoname() %>" 
target="new"></A><I class="bg"></I><IMG class="quic" src="images/<%=v.get(5).getVideoname() %>.jpg"></DIV>
<DIV class="txt ">
<H6 class="caption"><A title="<<%=v.get(5).getVideoname() %>><%=v.get(5).getIntroduce() %>" href="videoAction_deliver?videoname=<%=v.get(4).getVideoname() %>" 
target="new">&lt;<%=v.get(5).getVideoname() %>&gt;<%=v.get(5).getIntroduce() %></A></H6>
<UL class="info">
  <LI class="d">免费观看</LI>   
  <LI class="play"><A href="videoAction_deliver?videoname=<%=v.get(5).getVideoname() %>" 
  target="_blank">立即播放</A></LI></UL></DIV></DIV></DIV>


<DIV class="col1  colxx ">
<DIV class="pack packs">
<DIV class="pic"><A title="<<%=v.get(6).getVideoname() %>><%=v.get(6).getIntroduce() %>" href="http://v.youku.com/v_show/id_XMTY4NzE5MDc6MA==.html" 
target="new"></A><I class="bg"></I><IMG class="quic" src="images/<%=v.get(6).getVideoname() %>.jpg"></DIV>
<DIV class="txt ">
<H6 class="caption"><A title="<<%=v.get(6).getVideoname() %>><%=v.get(6).getIntroduce() %>" href="http://v.youku.com/v_show/id_XMTY4NzE5MDc6MA==.html" 
target="new">&lt;<%=v.get(6).getVideoname() %>&gt;<%=v.get(6).getIntroduce() %></A></H6>
<UL class="info">
  <LI class="d">免费观看</LI>
  <LI class="play"><A href="videoAction_deliver?videoname=<%=v.get(6).getVideoname() %>" 
  target="_blank">立即播放</A></LI></UL></DIV></DIV>
  
  
<DIV class="pack packs">
<DIV class="pic"><A title="<<%=v.get(7).getVideoname() %>><%=v.get(7).getIntroduce() %>" href="videoAction_deliver?videoname=<%=v.get(7).getVideoname() %>" 
target="new"></A><I class="bg"></I><IMG class="quic" src="images/<%=v.get(7).getVideoname() %>.jpg"></DIV>
<DIV class="txt ">
<H6 class="caption"><A title="<<%=v.get(7).getVideoname() %>><%=v.get(7).getIntroduce() %>" href="videoAction_deliver?videoname=<%=v.get(7).getVideoname() %>" 
target="new">&lt;<%=v.get(7).getVideoname() %>&gt;<%=v.get(7).getIntroduce() %></A></H6>
<UL class="info">
  <LI class="d"><%=v.get(7).getIntroduce() %></LI>
  <LI class="play"><A href="videoAction_deliver?videoname=<%=v.get(7).getVideoname() %>" 
  target="_blank">查看详情</A></LI></UL></DIV></DIV>
  
  
<DIV class="pack packs">
<DIV class="pic"><A title="<<%=v.get(8).getVideoname() %>><%=v.get(8).getIntroduce() %>" href="videoAction_deliver?videoname=<%=v.get(8).getVideoname() %>" 
target="new"></A><I class="bg"></I><IMG class="quic" src="images/<%=v.get(8).getVideoname() %>.jpg"></DIV>
<DIV class="txt ">
<H6 class="caption"><A title="<<%=v.get(8).getVideoname() %>><%=v.get(8).getIntroduce() %>" href="videoAction_deliver?videoname=<%=v.get(8).getVideoname() %>" 
target="new">&lt;<%=v.get(8).getVideoname() %>&gt;<%=v.get(8).getIntroduce() %></A></H6>
<UL class="info">
  <LI class="d"><%=v.get(8).getIntroduce() %></LI>
  <LI class="play"><A href="videoAction_deliver?videoname=<%=v.get(8).getVideoname() %>" 
  target="_blank">查看详情</A></LI></UL></DIV></DIV></DIV>
  
  
<DIV class="col1  ">
<DIV class="pack packs">
<DIV class="pic"><A title="<<%=v.get(9).getVideoname() %>><%=v.get(9).getIntroduce() %>" href="videoAction_deliver?videoname=<%=v.get(9).getVideoname() %>" 
target="new"></A><I class="bg"></I><IMG class="quic" src="images/<%=v.get(9).getVideoname() %>.jpg"></DIV>
<DIV class="txt ">
<H6 class="caption"><A title="<<%=v.get(9).getVideoname() %>><%=v.get(9).getIntroduce() %>" href="videoAction_deliver?videoname=<%=v.get(9).getVideoname() %>" 
target="new">&lt;<%=v.get(9).getVideoname() %>&gt;<%=v.get(9).getIntroduce() %></A></H6>
<UL class="info">
  <LI class="d"><%=v.get(9).getIntroduce() %></LI>
  <LI class="play"><A href="videoAction_deliver?videoname=<%=v.get(9).getVideoname() %>" 
  target="_blank">查看详情</A></LI></UL></DIV></DIV>
  
  
<DIV class="pack packs">
<DIV class="pic"><A title="<<%=v.get(10).getVideoname() %>><%=v.get(10).getIntroduce() %>" href="videoAction_deliver?videoname=<%=v.get(10).getVideoname() %>" 
target="new"></A><I class="bg"></I><IMG class="quic" src="images/<%=v.get(10).getVideoname() %>.jpg"></DIV>
<DIV class="txt ">
<H6 class="caption"><A title="<<%=v.get(10).getVideoname() %>><%=v.get(10).getIntroduce() %>" href="videoAction_deliver?videoname=<%=v.get(10).getVideoname() %>" 
target="new">&lt;<%=v.get(10).getVideoname() %>&gt;<%=v.get(10).getIntroduce() %></A></H6>
<UL class="info">
  <LI class="d"><%=v.get(10).getIntroduce() %></LI>
  <LI class="play"><A href="videoAction_deliver?videoname=<%=v.get(10).getVideoname() %>" 
  target="_blank">查看详情</A></LI></UL></DIV></DIV>
  
  
<DIV class="pack packs">
<DIV class="pic"><A title="<<%=v.get(11).getVideoname() %>><%=v.get(11).getIntroduce() %>" href="videoAction_deliver?videoname=<%=v.get(11).getVideoname() %>" 
target="new"></A><I class="bg"></I><IMG class="quic" src="images/<%=v.get(11).getVideoname() %>.jpg"></DIV>
<DIV class="txt ">
<H6 class="caption"><A title="<<%=v.get(11).getVideoname() %>><%=v.get(11).getIntroduce() %>" href="videoAction_deliver?videoname=<%=v.get(11).getVideoname() %>" 
target="new">&lt;<%=v.get(11).getVideoname() %>&gt;<%=v.get(11).getIntroduce() %></A></H6>
<UL class="info">
  <LI class="d"><%=v.get(11).getIntroduce() %></LI>
  <LI class="play"><A href="videoAction_deliver?videoname=<%=v.get(11).getVideoname() %>" 
  target="_blank">查看详情</A></LI></UL></DIV></DIV></DIV></DIV>
<DIV class="bline"></DIV></DIV>




	</BODY><!-- latest modify 1471589880033 --><!-- PC END --></HTML>
