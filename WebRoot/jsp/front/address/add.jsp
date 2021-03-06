<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
  <head>
  		<link rel="stylesheet" type="text/css" href="<c:url value='/css/Pub.css'/>"></link>
  		<style type="text/css">
  			*{
  				font-size:10pt;
  			}
  			table{
  				width:400px;
  				border:1px solid gray;
  				border-collapse:collapse;
  			}
  			td{
  				border:1px solid gray;
  				padding:3px;
  			}
  			.txt{
  				border:0px;
  				border-bottom:1px solid blue;
  				width:100%;
  			}
  		</style>
  </head>
  <body>
  		<p>添加收货地址-></p>
  		<form name="f1" method="post" action="<c:url value='/address/address?action=addAddress'/>" target="_dataFrame">
  			<table>
  				<colgroup>
  					<col width="30%"/>
  					<col width="80%"/>
  				</colgroup>
  				<tr style="background:#9393FF;">
  					<td colspan="2" align="center">
  						添加收货地址
  					</td>
  				</tr>
  				<tr>
  					<td valign="top">
  						收货人/地址：
  					</td>
  					<td>
  						<textarea name="name" class="txt" rows="3" cols="40"></textarea>
  					</td>
  				</tr>
  				<tr>
  					<td>
  						电话：
  					</td>
  					<td>
  						<input class="txt" type="text" name="phone"/>
  					</td>
  				</tr>
  				<tr>
  					<td>
  						邮编：
  					</td>
  					<td>
  						<input class="txt" type="text" name="zip"/>
  					</td>
  				</tr>
  				<tr>
  					<td colspan="2" align="center">
  						<button class="OperBtn" onclick="sure();">确定</button>
  						<input type="button" class="OperBtn" onclick="window.close();" value="取消"/>
  					</td>
  				</tr>
  			</table>
  		</form>
  		<iframe name="_dataFrame" style="display:none;"></iframe>
  </body>
  <script type="text/javascript">
  		function sure(){
  			document.forms['f1'].submit();
  		}
  		//添加成功
  		function addBack(){
  			window.opener.window.location.reload();
  			window.close();
  		}
  </script>
</html>
