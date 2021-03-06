<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
  <head>
  	<link rel="stylesheet" type="text/css" href="<c:url value='/css/Pub.css'/>"></link>
  	<script type="text/javascript">
  		var path = "${pageContext.request.contextPath}";
  	</script>
  	<script type="text/javascript" src="${pageContext.request.contextPath }/js/car.js"></script>
  	<style type="text/css">
  		*{
  			font-size:10pt;
  		}
  		table{
  			border:1px solid gray;
  			border-collapse: collapse;
  			width:80%;
  		}
  		td{
  			border:1px solid gray;
  			padding:5px;
  		}
  		.head{
  			background:#9393FF;
  		}
  		.head td{
  			text-align:center;
  			font:bold;
  			padding:5px;
  		}
  		.even{
  			background:#DDDDFF;
  		}
  		td button{
  			margin-left:7px;
  		}
  		.oper{
  			cursor:pointer;
  			border:0px;
  			background:transparent;
  		}
  	</style>
  </head>
  <body>
  		<p>以下是你买的所有图书-><font color="red" style="font:bold;">订单明细</font>-->选择/添加收货地址->确认订单->网银付款或到货付款->查收货物</p>
  		<table id="table">
  			<tr class="head">
  				<td>
  					书名
  				</td>
  				<td>
  					价格
  				</td>
  				<td>
  					数量
  				</td>
  				<td>
  					合计
  				</td>
  				<td>
  					增/删
  				</td>
  			</tr>
  			<c:set value="0" var="sum"/>
  			<c:forEach items="${sessionScope.car}" var="entry" varStatus="idx">
  				<tr <c:if test="${idx.count%2==0}">class="even"</c:if>>
	  				<td>
	  					<a href="${pageContext.request.contextPath }/index?action=queryBook&id=${entry.value.id}">
	  						${entry.value.name}
	  					</a>
	  				</td>
	  				<td>
	  					${entry.value.currentPrice}
	  				</td>
	  				<td>
	  					${entry.value.amt}
	  				</td>
	  				<td>
	  					<fmt:formatNumber value="${entry.value.currentPrice*entry.value.amt}" pattern="#.##"/>
	  					<c:set value="${sum+(entry.value.currentPrice*entry.value.amt)}" var="sum"/>
	  					<fmt:formatNumber value="${sum}" pattern="#.##" var="sum"/>
	  				</td>
	  				<td>
	  					<input class="oper" type="button"  onclick="_add('${entry.value.id}')" value="+"/>
	  					&nbsp;
	  					<input class="oper" type="button"  onclick="_del('${entry.value.id}')" value="-"/>
	  				</td>
  				</tr>
  			</c:forEach>
  			<tr class="head">
  				<td colspan="5" style="text-align:right;">
  					总金额：
  					<label id="sum">
  					${sum}
  					</label>
  					元
  				</td>
  			</tr>
  			<tr style="background:#E0E0E0;">
  				<td colspan="5" style="text-align:right;">
  					<button class="OperBtn" onclick="sure();" style="width:220px;">下一步->选择收货地址</button>
  					<button class="OperBtn" onclick="alert('请同学们完成\n清空session中的car数据');" style="width:120px;">全部取消</button>
  				</td>
  			</tr>
  		</table>
  </body>
</html>
