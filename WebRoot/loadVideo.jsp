<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>Load Video</title>
<link rel="stylesheet" type="text/css"
	href="easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css" />
<script src="easyui/jquery.min.js"></script>
<script src="easyui/jquery.easyui.min.js"></script>
<script src="easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	function load(){
		$.ajax({
           type : "post",
           url : "videoAction_add",
         });
	}
</script>
</head>

<body>
	<h1>Load Video</h1>
	<a id="load" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="load();">Load Video</a>
</body>
</html>
