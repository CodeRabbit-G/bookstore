<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
  <head>
  	<link rel="stylesheet" type="text/css" href="<c:url value='/css/Pub.css'/>"></link>
  	<script type="text/javascript">
  		var path = "${pageContext.request.contextPath}";
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
  		td button{
  			margin-left:5px;
  		}
  	</style>
  </head>
  <body>
  	  <%--判断是否是从订单明细过来的数据，如果是则显示进度 --%>
  	  <c:if test="${!empty requestScope.order}" var="boo">
  	  	 <p>选择/输入送货地址->订单明细--><font color="red" style="font:bold;">选择/添加收货地址</font>->确认订单->网银付款或到货付款->查收货物</p>
  	  </c:if>
  	  <c:if test="${!boo}">
  	  	<p>以下是你的收货地址列表：</p>
  	  </c:if>
  	  <table id="table">
  			<tr class="head">
  				<td style="width:60%;">
  					收货人姓名/地址
  				</td>
  				<td>
  					电话
  				</td>
  				<td>
  					邮编
  				</td>
  				<td style="width:15%;">
  					默认地址
  				</td>
  			</tr>
  			<c:forEach items="${addrs}" var="addr">
 				 	<tr>
 				 		<td>
 				 			${addr.name}
 				 		</td>
 				 		<td>
 				 			${addr.phone}
 				 		</td>
 				 		<td>
							${addr.zip} 				 			
 				 		</td>
 				 		<td>
 				 			<input type="radio" <c:if test="${addr.dft==1}">checked='checked'</c:if> name="dft" onclick="_chgDft(this,'${addr.id}');" value='${book.dft}'/>
 				 			<button class="OperBtn" style="width:40px;" onclick="_del('${addr.id}');">删除</button>
 				 		</td>
 				 	</tr>
  			</c:forEach>
  			<tr style="background:#E0E0E0;">
  				<td colspan="4" style="text-align:right;">
  					<button class="OperBtn" style="width:120px;" onclick="_toOrder();">下一步->订单页面</button>	
  					<button class="OperBtn" onclick="_add();">增加</button>
  				</td>
  			</tr>
  		</table>
  		<form name="f1" action="${pageContext.request.contextPath}/order/order?action=toOrder" method="post">
  			<div style="display:none;">
  				<input type="text" name="consignee" id="consignee"/>
  			</div>
  		</form>
  </body>
  <script type="text/javascript">
  		//跳转到添加页面
  	  function _add(){
  		  var url = path+"/jsp/front/address/add.jsp";
  		  window.open(url,"_blank","width=410px;height=300px;");
  	  }
  	  //设置为默认收货地址
  	  function _chgDft(obj,id){
  		 if(obj.checked==true && obj.value==1){//如果本来就是选中，则不做任何工作
  			 return;
  		 }
  		 var url = path+"/address/address?action=changeToDefault&id="+id;
  		 window.location.href=url;
  	  }
  	  //删除一个地址
  	  function _del(id){
  		 var url = path+"/address/address?action=delAddress&id="+id;
  		 window.location.href=url;
  	  }
  	  //确定订单
  	  function _toOrder(){
  		var dfts = document.getElementsByName("dft");
  		var dft = null;
		for(var i=0,len=dfts.length;i<len;i++){
			 if(dfts[i].checked==true){
				 dft=dfts[i];
				 break;
			 }
		}
		if(dft){
			var consignee = "";
			var tr = dft.parentNode;
			if(tr.tagName!='TR'){
				tr = tr.parentNode;				
			}
			consignee=tr.cells[0].innerHTML+","+tr.cells[1].innerHTML+","+tr.cells[2].innerHTML;
			document.getElementById("consignee").value=consignee;
			document.forms['f1'].submit();
		}else{
			alert('请选择一个收货地址');
		}
  	  }
  </script>
</html>
