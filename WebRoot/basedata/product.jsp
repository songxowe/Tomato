<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查询产品信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script src="../js/common.js"></script>
<script type="text/javascript">
  function find(){
    document.f.submit();
  }
</script>
</head>
<body>
<s:form action="productAction!list" method="post" namespace="basedata" name="f">

<div class="page_title">产品查询</div>
<div class="button_bar">
  <button class="common_button" onclick="help('产品查询');">帮助</button>
  <button class="common_button" onclick="find();">查询</button>  
</div>
<table class="query_form_table">
  <tr>
    <th>名称</th>
    <td><s:textfield name="product.prodName"/></td>
    <th>型号</th>
    <td><s:textfield name="product.prodType"/></td>
    <th>批次</th>
    <td><s:textfield name="product.prodBatch"/></td>
  </tr>
</table>
<br />
<table class="data_list_table">
  <tr>
    <th>编号</th>
    <th>名称</th>
    <th>型号</th>
    <th>等级/批次</th>
    <th>单位</th>
    <th>单价（元）</th>
    <th>备注</th>
  </tr>

  <s:iterator var="product" value="listProduct">
	  <tr>
	    <td class="list_data_number"><s:property value="#product.prodId"/></td>
	    <td class="list_data_ltext"><s:property value="#product.prodName"/></td>
	    <td class="list_data_text"><s:property value="#product.prodType"/></td>
	    <td class="list_data_text"><s:property value="#product.prodBatch"/></td>
	    <td class="list_data_text"><s:property value="#product.prodUnit"/></td>
	    <td class="list_data_number"><s:property value="#product.prodPrice"/></td>
	    <td class="list_data_ltext"><s:property value="#product.prodMemo"/>&nbsp;</td>    
	  </tr>
  </s:iterator>
  <tr>
    <th colspan="100" class="pager">
      <div class="pager">
               共<s:property value="totalRows"/>行&nbsp;
               第<s:property value="currentPage"/>页&nbsp;
               共<s:property value="pager.getTotalPages()"/>页&nbsp;
               
			<s:url var="firstUrl" action="productAction!list">
			  <s:param name="currentPage" value="#currentPage"/>
			  <s:param name="pagerMethod" value="'first'"/>
			</s:url>
      <s:a href="%{firstUrl}">首页</s:a>
      
      <s:url var="previousUrl" action="productAction!list">
        <s:param name="currentPage" value="currentPage"/>
        <s:param name="pagerMethod" value="'previous'"/>
      </s:url>
      <s:a href="%{previousUrl}">上一页</s:a>
      
      <s:url var="nextUrl" action="productAction!list">
        <s:param name="currentPage" value="currentPage"/>
        <s:param name="pagerMethod" value="'next'"/>
      </s:url>
      <s:a href="%{nextUrl}">下一页</s:a>
      
      <s:url var="lastUrl" action="productAction!list">
        <s:param name="currentPage" value="currentPage"/>
        <s:param name="pagerMethod" value="'last'"/>
      </s:url>
      <s:a href="%{lastUrl}">尾页</s:a>
      </div>
      
    </th>
  </tr>
</table>
</s:form>
</body>

</html>