<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>汉服购物网站</title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<style>
#item img {
	width: 30px;
}
</style>
</head>
<body>
	<!-- 无itemsPage且没有操作失败,进入时，重新请求getUsersPagesServlet -->
	<c:if test="${empty ordersPage}">
		<script>
			window.location.href = '${pageContext.request.contextPath}/servlet/getHistoryOrdersPageServlet';
		</script>
	</c:if>

	<!-- 网页头部 -->
	<jsp:include page="/jspfragments/header.jsp" />

	<!-- 网页正文 -->
	<br />

	<div class="container">
		<div class="row">
			<!-- 左侧菜单栏 -->
			<div class="col-md-2">
				<div class="panel panel-default">
					<div class="panel-heading">
						<ul class="nav nav-pills nav-stacked">
							<li class="disabled"><a href="#"><font size="3"
									style="font-weight: bold;"><span
										class="glyphicon glyphicon-th-large"></span>管理中心</font></a></li>
						</ul>
					</div>
					<div class="panel-body">
						<ul class="nav nav-pills nav-stacked">
							<li><a
								href="${pageContext.request.contextPath}/pages/admin/manage-users.jsp">
									<span class="glyphicon glyphicon-user"></span> 管理用户
							</a></li>
							<li><a
								href="${pageContext.request.contextPath}/pages/admin/manage-items.jsp"><span
									class="glyphicon glyphicon glyphicon-leaf"></span> 管理商品</a></li>
							<li class="nav-divider"></li>
							<li class="active"><a
								href="${pageContext.request.contextPath}/pages/admin/history-orders.jsp">
									<span class="glyphicon glyphicon-list-alt"></span> 历史订单
							</a></li>
						</ul>
					</div>
				</div>
			</div>
			<!-- 右侧主体 -->
			<div class="col-md-10">
				<!-- 上半部分 -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<font size="3"> <span class="glyphicon glyphicon-list-alt"></span>
							历史订单
						</font>
					</div>
				</div>
				<!-- 下半部分 -->
				<div class="panel panel-default">
					<div class="panel-heading" style="height: 55px">
						<div class="pull-left">
							<font size="4" style="line-height: 35px"><strong>历史订单</strong></font>
						</div>
						<div class="pull-right">

							<!-- 刷新按钮 -->
							<button class="btn btn-success"
								onclick="window.location.href='${ordersPage.url }&currentPage=${ordersPage.currentPage}'">
								<span class="glyphicon glyphicon-refresh"></span>刷&nbsp;新
							</button>
						</div>
					</div>
					<div class="panel-body">
						<!--搜索栏-->
						<center>
							<form class="navbar-form "
								action="${pageContext.request.contextPath}/servlet/getHistoryOrdersPageServlet"
								role="search" method="get">
								<div class="form-group">
									<div class="btn-group  pull-left" data-toggle="buttons">
										<label class="btn btn-default active"> <input
											name="status" value="account" type="radio" checked>用户名
										</label> <label class="btn btn-default"> <input name="status"
											value="orderId" type="radio"> 订单号
										</label>
									</div>
									<input name="keyword" type="text" class="form-control"
										placeholder="Search">
								</div>
								<button type="submit" class="btn btn-primary">搜索</button>
							</form>
						</center>
						<br />
						<!-- 表格 -->
						<table class="table table-striped" style="text-align: center">
							<tr>
								<td>订单编号</td>
								<td>用户</td>
								<td>总计</td>
								<td>创建时间</td>
								<td>查看详情</td>
							</tr>
							<c:forEach var="order" items="${requestScope.ordersPage.list}">
								<tr>
									<td>${order.orderId}</td>
									<td>${order.account}</td>
									<td>${order.orderTotal}</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${order.createdTime}"/></td>
									<!-- 查看详情 -->
									<td><form action="${pageContext.request.contextPath}/servlet/getOrderDetailServlet" method="post">
											<input type="hidden" name="orderId" value="${order.orderId}" />
											<button class="btn btn-info" type="submit">
												<span class="glyphicon glyphicon-zoom-in"></span>
											</button>
										</form></td>
								</tr>
							</c:forEach>
						</table>
						<center>第${ordersPage.currentPage}页/共${ordersPage.totalPage}页</center>
						<nav>
						<ul class="pager">
							<c:if test="${ordersPage.currentPage>1 }">
								<li class="previous"><a
									href="${ordersPage.url}&currentPage=1">首页</a></li>
								<li class="previous"><a
									href="${ordersPage.url}&currentPage=${ordersPage.currentPage-1}">上一页</a></li>
							</c:if>
							<c:if test="${ordersPage.currentPage<ordersPage.totalPage}">
								<li class="next"><a
									href="${ordersPage.url }&currentPage=${ordersPage.totalPage}">尾页</a></li>
								<li class="next"><a
									href="${ordersPage.url }&currentPage=${ordersPage.currentPage+1}">下一页</a></li>
							</c:if>
						</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- 订单详情弹框 -->
	<div id="order-detail" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-title">
					<h1 class="text-center">订单详情</h1>
				</div>
				<!-- 主体 -->
				<div class="modal-body" id="item">
					<table class="table table-striped" style="text-align: center">
						<tr>
							<td>商品</td>
							<td>商品名</td>
							<td>类型</td>
							<td>数量</td>
							<td>单价</td>
							<td>小计</td>
						</tr>

						<c:forEach var="item" items="${requestScope.list}">
							<tr>
								<td><img
									src="${pageContext.request.contextPath}${item.imageUrl}"></td>
								<td>${item.name}</td>
								<td>${item.type}</td>
								<td>${item.number}</td>
								<td>${item.price}</td>
								<td>${item.number*item.price}</td>
						</c:forEach>
					</table>

					<center><font size="4"><strong>总价：${total}&nbsp;&nbsp;&nbsp;&nbsp;</strong></font><br/><br/>
							
						<button class="btn btn-primary" data-dismiss="modal">关&nbsp;&nbsp;闭</button>
					</center>
				</div>
			</div>
		</div>
	</div>

	<!-- 获取订单详情后提示 -->
	<c:if test="${not empty list}">
		<script>
			$('#order-detail').modal("show");
		</script>
	</c:if>

</body>
</html>