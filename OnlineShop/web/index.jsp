<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>汉服购物网站</title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
/*main区域居中*/
.main {
	text-align: center;
	background-color: #dca7a7;
	border-radius: 20px;
	width: 1000px;
	height: 400px;
	margin: auto;
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
}

.items {
	text-align: center;
	margin-left: auto;
	margin-right: auto;
}

.items img {
	width: 150px;
}

/*去除轮播两边阴影*/
#cl #cr {
	background-image: none;
}
</style>

</head>
<body>
	<!-- 利用forwardUrl来确定(注册之后)返回的url -->
	<%
		request.setAttribute("forwardUrl", "/index.jsp"); //map
	%>

	<!-- 网页头部 -->
	<jsp:include page="/jspfragments/header.jsp" />
	<!-- 产品展示 -->
	<div class="container items">
		<div class="row">
			<div class="col-xs-4 ">
				<a href="${pageContext.request.contextPath}/servlet/getItemServlet?itemId=1"> <img
					src="${pageContext.request.contextPath}/images/index/1-1.jpg"
					class="img-circle">
					<div class="caption">
						<div class="text-muted">
							<br />青黛
						</div>
					</div></a>
			</div>

			<div class="col-xs-4 ">
				<a href="${pageContext.request.contextPath}/servlet/getItemServlet?itemId=2"> <img
					src="${pageContext.request.contextPath}/images/index/1-2.jpg"
					class="img-circle">
					<div class="caption">
						<div class="text-muted">
							<br />长干寺齐腰
						</div>
					</div></a>
			</div>
			<div class="col-xs-4 ">
				<a href="${pageContext.request.contextPath}/servlet/getItemServlet?itemId=3"> <img
					src="${pageContext.request.contextPath}/images/index/1-3.jpg"
					class="img-circle">
					<div class="caption">
						<div class="text-muted">
							<br />长褙子齐腰
						</div>
					</div></a>
			</div>

			<div class="col-xs-4 ">
				<a href="${pageContext.request.contextPath}/servlet/getItemServlet?itemId=4"> <img
						src="${pageContext.request.contextPath}/images/index/1-4.jpg"
						class="img-circle">
					<div class="caption">
						<div class="text-muted">
							<br />交襟襦裙
						</div>
					</div></a>
			</div>

			<div class="col-xs-4 ">
				<a href="${pageContext.request.contextPath}/servlet/getItemServlet?itemId=5"> <img
						src="${pageContext.request.contextPath}/images/index/1-5.jpg"
						class="img-circle">
					<div class="caption">
						<div class="text-muted">
							<br />齐腰百褶裙
						</div>
					</div></a>
			</div>

			<div class="col-xs-4 ">
				<a href="${pageContext.request.contextPath}/servlet/getItemServlet?itemId=6"> <img
						src="${pageContext.request.contextPath}/images/index/2-1.jpg"
						class="img-circle">
					<div class="caption">
						<div class="text-muted">
							<br />大袖衫
						</div>
					</div></a>
			</div>
		</div>
	</div>

	<div
		style="margin-top: 90px;background: url(${pageContext.request.contextPath}/images/index/background.png)">
		<div class="container">
			<div style="text-align:center">
				<br /> <br /> <font size="20"><strong>汉服购物网站</strong></font>
				<br /> <font size="5"><strong>着我汉家衣裳，兴我礼仪之邦</strong></font> <br /> <br />
				<br />
			</div>
		</div>
	</div>

	<!-- 页脚 -->
	<jsp:include page="/jspfragments/footer.jsp" />
</body>
</html>