<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
		<script src="dhtmltree/dhtmlx.js" type="text/javascript"></script>
		<script src="dhtmltree/connector.js" type="text/javascript"></script>
		<link rel="stylesheet" href="dhtmltree/dhtmlx.css" type="text/css" />
	</head>
	<body style="background-color: rgb(182, 192, 186);">
		<div id="treebox_tree"
			style="width: 155px; background-color: rgb(182, 192, 186);"></div>
	</body>
	<script type="text/javascript">
		tree = new dhtmlXTreeObject("treebox_tree", "100%",
				$(document).height() - 40, 0);
		tree.setImagePath("dhtmltree/imgs/");
	
		tree.attachEvent("onClick", function(id) {
			// 为父模块时
				if (tree.getUserData(id, "url") == undefined
						|| tree.getUserData(id, "url") == '#') {
					// 当前节点关闭着
				if (tree.getOpenState(id) == -1) {
					tree.openItem(id);
					// 当前节点打开着时
				} else if (tree.getOpenState(id) == 1) {
					tree.closeItem(id);
				}
				return false;
			}
	
			// 不是父模块,子模块获取url在frame右边显示页面信息
			window.parent.frames.right.location.href = tree.getUserData(id, "url");
			return true;
		});
		
		// tree.loadXML("menu.xml");
  </script>
    <script>
      tree.loadXML("menu/menu.xml");
    </script>
  <%-- <s:elseif test="#session.user.usrRoleId == 2">
    <script>
      tree.loadXML("menu/menu_newer_c.xml");
    </script>
  </s:elseif>
  <s:elseif test="#session.user.usrRoleId == 3">
    <script>
      tree.loadXML("menu/menu_newer_s.xml");
    </script>
  </s:elseif>
  <s:elseif test="#session.user.usrRoleId == 4">
    <script>
      tree.loadXML("menu/menu_newer_m.xml");
    </script>
  </s:elseif>
  <s:else>
    <script>
      tree.loadXML("menu_newer.xml");
    </script>
  </s:else> --%>
</html>