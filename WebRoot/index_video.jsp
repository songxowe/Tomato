
<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>网页MP4播放测试</title>
</head>
<body>

	<div class="maincontent">
		<div style="margin-top:30px;">
		<fieldset>
			<legend>
				<strong class="f14">播放器介绍</strong>
			</legend>
	<div>
		<div>
			<div>
				<table style="width:922px"  border="">
					<tr>
						<td style="width: 428px">
							<!--酷播迷你CuPlayerMiniV4.0/代码开始--> <script
								type="text/javascript" src="images/swfobject.js"></script>
							<div class="video" id="CuPlayer" style="950px;margin:0 auto;">
								<strong>我爱播放器(52player.com) 提示：您的Flash Player版本过低，请<a
									href="http://www.52player.com/">点此进行网页播放器升级</a>！
								</strong>
							</div> <script type="text/javascript">
								var so = new SWFObject("CuPlayerMiniV4.swf", "CuPlayerV4", "450", "300", "9", "#000000");
								so.addParam("allowfullscreen", "true");
								so.addParam("allowscriptaccess", "always");
								so.addParam("wmode", "opaque");  
								so.addParam("quality", "high");
								so.addParam("salign", "lt");
								so.addVariable("CuPlayerSetFile", "CuPlayerSetFile.xml"); //播放器配置文件地址
								so.addVariable("CuPlayerFile", "video/蓝精灵.mp4"); //视频文件地址
								so.addVariable("CuPlayerImage", "images/蓝精灵.jpg"); //视频略缩图
								so.addVariable("CuPlayerWidth", "450"); //视频宽度
								so.addVariable("CuPlayerHeight", "300"); //视频高度
								so.addVariable("CuPlayerAutoPlay", "no"); //是否自动播放
								so.write("CuPlayer");
							</script> <!--酷播迷你CuPlayerMiniV4.0/代码结束-->
							<h1>网页MP4播放测试</h1>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
		</fieldset>
	</div>
	</div>
</body>
</html>