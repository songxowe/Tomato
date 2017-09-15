<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
  <head>
  <meta charset="utf-8">
    <title>推荐视频列表</title>
    <link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css" />
<script src="easyui/jquery.min.js"></script>
<script src="easyui/jquery.easyui.min.js"></script>
<script src="easyui/locale/easyui-lang-zh_CN.js"></script>
  </head>
  <body>
  <h1>推荐视频列表</h1>
  <div style="margin : 10px 30px">
		<div style="margin-top : 10px">
			<div id="searchVideoForm" style="padding: 10px">
				<div style="margin-bottom: 10px">
				<!-- <a href="#" class="easyui-linkbutton"
				         data-options="iconCls:'icon-add',plain:true"
				         onclick="video_obj.add();">新增</a> -->
				       <a href="#" class="easyui-linkbutton"
				         data-options="iconCls:'icon-edit',plain:true"
				         onclick="video_obj.edit();">修改</a>
				       <a href="#" class="easyui-linkbutton"
				         data-options="iconCls:'icon-remove',plain:true"
				         onclick="video_obj.remove();">删除</a>
				       <a href="#" class="easyui-linkbutton"
				         data-options="iconCls:'icon-tip',plain:true"
				         onclick="video_obj.selectAll();" id="selectAll">全选/全不选</a>
				       <a href="#" class="easyui-linkbutton"
				         data-options="iconCls:'icon-cancel',plain:true"
				         onclick="video_obj.cancel();">取推</a>
				       <a href="#" class="easyui-linkbutton"
				         data-options="iconCls:'icon-save',plain:true" style="display:none" id="save"
				         onclick="video_obj.save();">保存</a>
				       <a href="#" class="easyui-linkbutton"
				         data-options="iconCls:'icon-redo',plain:true" style="display:none" id="redo"
				         onclick="video_obj.redo();">取消编辑</a>
  				</div>
  		&nbsp;
  		<input placeholder="视频名" type="text" id="videoname" /> 
  		<input placeholder="视频类型" type="text" id="filetype" /> 
  		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" onclick="video_obj.search();">查询</a>
  	</div>
  	<div style="margin-top : 10px">
  		<table id="videoDataGrid">
  			
  		</table>
  	</div>
  </div>
  </div>
  <script type="text/javascript">
  	$(function(){
  	
  		video_obj = {
  			editRow : undefined,
  			selectRow : undefined,
  			search : function(){
  				$("#videoDataGrid").datagrid('load',{
				    videoname : $.trim($("#videoname").val()),
				    filetype : $.trim($("#filetype").val())
				  });
  			},
  			selectAll : function(){
  				if(this.selectRow == undefined){
	  				$('#videoDataGrid').datagrid("selectAll");
	  				this.selectRow = 1;
  				}else{
  					$('#videoDataGrid').datagrid("unselectAll");
  					this.selectRow = undefined;
  				}
  				
  				
  			},
  			cancel : function(){
					var rows = $('#videoDataGrid').datagrid("getSelections");
					if(rows.length == 12){
						$.messager.confirm("消息","确认取消推荐所选的视频吗",function(flag){
							if(flag){
								$.ajax({
						           type : "post",
						           url : "videoAction_show?cancel=1&length="+rows.length,
						           data : {videos:rows}, 
						           beforeSend : function(){
						           // 显示载入状态
						             $("#videoDataGrid").datagrid("loading");
						           },
						           success : function(data){
						             if(data) {
						             // 隐藏载入状态
						             $("#videoDataGrid").datagrid("loaded");
						             // 加载和显示第一页的所有行
						             $("#videoDataGrid").datagrid("load");
						             // 取消选择所有当前页中所有的行
						             $("#videoDataGrid").datagrid("unselectAll");
						             $.messager.show({
						             title : "提示",
						             msg : data + "个视频被取消推荐"
						             });
						           }
						           }
						         });
							}
						})
					}else{
						$.messager.alert("警告","需选择'一打'视频","warning");
					}
  			},
  			add : function(){
					$("#save,#redo").show();
					if(this.editRow == undefined){
						//在第一行的位置插入一个新的行
						$("#videoDataGrid").datagrid("insertRow",{
							index:0,row:{}
						});
						//将第一行设为可编辑状态
						$("#videoDataGrid").datagrid("beginEdit",0);
						this.editRow = 0;
					};
				},
				save : function(){
					//将指定行设为结束编辑状态
					$("#videoDataGrid").datagrid("endEdit",this.editRow);
				},
				redo : function(){
					this.editRow = undefined;
					$("#save,#redo").hide();
					//回滚所有从创建或者上一次调用acceptCHanges函数后更改的数据
					$("#videoDataGrid").datagrid("rejectChanges");
				},
				edit : function(){
					var rows = $('#videoDataGrid').datagrid("getSelections");
					if(rows.length == 1){
						if(this.editRow != undefined){
							$("#videoDataGrid").datagrid("endEdit",this.editRow);
						}
						if(this.editRow == undefined){
							var rowIndex = $("#videoDataGrid").datagrid("getRowIndex",rows[0]);
							//alert(rowIndex);
							$("#videoDataGrid").datagrid("beginEdit",rowIndex);
							$("#save,#redo").show();
							this.editRow = rowIndex;
							$("#videoDataGrid").datagrid("unselectRow",rowIndex);
						}
					}else if(rows.length > 1){
						$.messager.alert("警告","只能选中一行","warning");
					}else{
						$.messager.alert("警告","请选中一行","warning");
					}
				},
				remove : function() { // 删除
			         // 返回所有被选中的行，当没有记录被选中的时候将返回一个空数组
			         var rows = $("#videoDataGrid").datagrid("getSelections");
			         if(rows.length > 0) {
			           $.messager.confirm("消息","确认真的要删除所选的视频吗",function(flag){
			           if(flag){
			         var videos = [];
			         for(var i=0;i<rows.length;i++){
			           // [7369 7788 7936]
			           videos.push(rows[i].id);
			         }
			         $.ajax({
			           type : "post",
			           url : "videoAction_remove",
			           data : {
			             videos : videos.join(","),
			           },
			           beforeSend : function(){
			           // 显示载入状态
			             $("#videoDataGrid").datagrid("loading");
			           },
			           success : function(data){
			             if(data) {
			             // 隐藏载入状态
			             $("#videoDataGrid").datagrid("loaded");
			             // 加载和显示第一页的所有行
			             $("#videoDataGrid").datagrid("load");
			             // 取消选择所有当前页中所有的行
			             $("#videoDataGrid").datagrid("unselectAll");
			             $.messager.show({
			             title : "提示",
			             msg : data + "个视频被删除"
			             });
			           }
			           }
			         });
			          }
			         });
			         }else {
			           $.messager.alert("警告", "请选中要删除的视频","warning");
			         }
			       }
  		}
  	
  		$('#videoDataGrid').datagrid({    
	    	    url:'videoAction_list?show=1',   // 一个URL从远程站点请求数据
	    	    title : '推荐列表',
	          fitColumns : true, // 自动展开/收缩列
	          striped : true,    // 显示斑马线效果
	          rownumbers : true, // 行号
	    	    columns:[[{ // -- 列开始 ---------
	  				field : 'id',
	  				title : '编号',
	  				width : 50,
	 	          	sortable : true
	 	        },{
	 	          field : 'videoname',
	 	          title : '视频名',
	 	          width : 100,
	 	          sortable : true,
	 	        },{
	 	          field : 'introduce',
	 	          title : '影片简介',
	 	          width : 100,
	 	          sortable : true,
	 	         editor : {
	 	        	  type : "validatebox",
	 	          }
	 	        },{
	 	          field : 'filetype',
	 	          title : '影片类型',
	 	          width : 100,
	 	          sortable : true,
	 	         editor : {
	 	        	  type : "validatebox",
	 	          }
	 	        },{
	 	          field : 'timer',
	 	          title : '时长',
	 	          width : 100,
	 	          sortable : true,
	 	         editor : {
	 	        	  type : "validatebox",
	 	          }
	 	        },{
	 	          field : 'releasetime',
	 	          title : '发行时间',
	 	          width : 100,
	 	          sortable : true,
	 	         editor : {
	 	        	  type : "datetimebox",
	 	          }
	 	        },{
	 	          field : 'isshow',
	 	          title : '是否主推',
	 	          width : 100,
	 	          sortable : true,
	 	         editor : {
	 	        	  type : "numberbox",
	 	        	  options : {required:true,min:0,max:1}
	 	          }
	 	        },      
	    	    ]],
	    	    toolbar : "#searchVideoForm",
	    	    pagination : true, // -- 分页设置 ----
	          pageSize : 15,// rows:每页显示的记录条数 (page 控件自动计算)
	          pageList : [5, 10, 15, 20 ],// 设置每页条数的列表
	          sortName : "id", // sort:排序列 (默认)
	          sortOrder : "ASC",
	          onAfterEdit:function(rowIndex,rowDate,changes){
					$("#save,#redo").hide();
					var inserted =$("#videoDataGrid").datagrid("getChanges","inserted");
					var updated =$("#videoDataGrid").datagrid("getChanges","updated");
					var url="videoAction_modify";
					var state="";
					if(inserted.length>0){
						state="新增";
					}
					if(updated.length>0){
						state="修改";
					}
					$.ajax({
						url:url,
						type:"post",
						data:{video : rowDate
						},
						beforeSend:function(){
							//显示载入状态
							$("#videoDataGrid").datagrid("loading");
						},
						success:function(data){
							if(data) {
	    			            // 隐藏载入状态
	    			            $("#videoDataGrid").datagrid("loaded");
	    			            // 加载和显示第一页的所有行
	    			            $("#videoDataGrid").datagrid("load");
	    			            // 取消选择所有当前页中所有的行
	    			            $("#videoDataGrid").datagrid("unselectAll");
	    			            $.messager.show({
	    			            title : "提示",
	    			            msg : data + "个视频被"+state
	    			            });
	    			          }
							video_obj.editRow=undefined;
						}
						
					});
				},
				onDblClickRow:function(rowIndex,rowData){
				if(video_obj.editRow!=undefined){
					$("#videoDataGrid").datagrid("endEdit",video_obj.editRow);
				}
				if(video_obj.editRow==undefined){
					$("#videoDataGrid").datagrid("beginEdit",rowIndex);
					$("#save,#redo").show();
					video_obj.editRow=rowIndex;
				}
			},
	          });
  	});
  	
  </script>
  </body>
</html>
