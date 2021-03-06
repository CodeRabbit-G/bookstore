<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
  <head>
  	<link rel="stylesheet" type="text/css" href="<c:url value='/css/Pub.css'/>"></link>
  	<script type="text/javascript" src="<c:url value='/js/pub.js'/>"></script>
  	<script type="text/javascript">
  		var path = "<c:url value='/'/>";
  	</script>
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
  		.txt{
  			border:0px;
  			background:transparent;
  		}
  	</style>
  </head>
  <body>
  		<p>订单信息：</p>
  		<div style="background:#F0F0F0;">
  			<table style="width:70%">
					<tr>
						<td>
							订单编号：
						</td>
						<td>
							<input class="txt" readonly="readonly" type="text" name="id" value="${order.id}"/>
						</td>
					</tr>
					<tr>
						<td>
							收货人/地址：
						</td>
						<td>
							<input class="txt" readonly="readonly" type="text" name="consignee" value="${order.consignee}"/>
						</td>
					</tr>
					<tr style="background:#E0E0E0;">
						<td>
							总金额：
						</td>
  						<td>
  							<input class="txt" readonly="readonly" value="${order.amt}元" type="text" name="amt" id="amt"/>
  					   </td>
  			       </tr>
  			       <tr>
						<td>
							支付方式：
						</td>
  						<td>
  							<c:choose>
  								<c:when test="${order.paytype==1}">
  									 货到付款
  								</c:when>
  								<c:otherwise>
  									网银转账
  								</c:otherwise>
  							</c:choose>
  					   </td>
  			       </tr>
				</table>
  		</div>
  		<p>订单明细：</p>
  		<table id="table">
  			<colgroup>
  				<col width="30%">
  				<col width="20%">
  				<col width="20%">
  				<col width="20%">
  			</colgroup>
  			<tr class="head">
  				<td>
  					书名
  				</td>
  				<td>
  					数量
  				</td>
  				<td>
  					价格
  				</td>
  				<td>
  					合计
  				</td>
  			</tr>
  			<c:forEach items="${order.orderLines}" var="line">
  				<tr>
  					<td>
  						<a target="_new" href="<c:url value='/IndexServlet?cmd=queryBook&id=${line.bookid}'/>">
  							${line.name}
  						</a>
  					</td>
  					<td>
  						${line.amt}
  					</td>
  					<td>
  						${line.price}
  					</td>
  					<td>
						${line.sum}
  					</td>
  				</tr>
  			</c:forEach>
  		</table>
  </body>
</html>
