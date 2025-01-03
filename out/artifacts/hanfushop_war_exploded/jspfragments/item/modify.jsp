<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link
	href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/bootstrap-theme.min.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	
	
<script
	src="${pageContext.request.contextPath}/js/verify-modify-item.js"></script>
</head>
<body>

	<!-- 修改弹框 -->
	<div id="modify" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-body">
					<button class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
				</div>

				<div class="modal-title">
					<h1 class="text-center">修改商品信息</h1>
				</div>

				<!-- 表单 -->
				<div class="modal-body">
					<form action="${pageContext.request.contextPath}/servlet/modifyItemServlet?" onSubmit="return checkModifyItem()" method="post">
						<div class="form-group has-feedback" id="modify-item-itemId-div">
							<label for="modify-item-itemId">ID</label>
							<div class="input-group">
								<span class="input-group-addon"><span
									class="glyphicon glyphicon-leaf"></span></span> <input
									id="modify-item-itemId" name="itemId" class="form-control"
									readonly="readonly" type="text" value="${param.itemId}">
							</div>
						</div>
						<div class="form-group has-feedback" id="modify-item-name-div">
							<label for="modify-item-name">名称</label>
							<div class="input-group">
								<span class="input-group-addon"><span
									class="glyphicon glyphicon-leaf"></span></span> <input
									id="modify-item-name" name="name" class="form-control"
									 type="text" value="${param.name}">
							</div>
						</div>

						<!-- 下拉表单 -->
						<div class="form-group has-feedback" id="modify-item-type-div">
							<label for="modify-item-type">类型</label>
							<div class="input-group">
								<span class="input-group-addon"><span
									class="glyphicon glyphicon-tasks"></span></span> <select
									class="form-control" name="type">
									<!-- 用来造成默认选中效果 -->
									<option value="${param.type}">${param.type}(旧值)</option>
									<option value="宋制汉服">宋制汉服</option>
									<option value="唐制汉服">唐制汉服</option>
									<option value="秦汉制汉服">秦汉制汉服</option>
								</select>
							</div>
						</div>

						<div class="form-group has-feedback" id="modify-item-stock-div">
							<label for="modify-item-stock">库存数量</label>
							<div class="input-group">
								<span class="input-group-addon"><span
									class="glyphicon glyphicon-folder-close"></span></span> <input
									id="modify-item-stock" name="stock" class="form-control"
									placeholder="请输入库存数量" maxlength="10" type="text"
									value="${param.stock}">
							</div>
							<span style="color: red; display: none;" class="tips"></span> <span
								style="display: none;"
								class="glyphicon glyphicon-remove form-control-feedback"></span>
							<span style="display: none;"
								class="glyphicon glyphicon-ok form-control-feedback"></span>
						</div>


						<div class="form-group has-feedback" id="modify-item-price-div">
							<label for="modify-item-price">单价</label>
							<div class="input-group">
								<span class="input-group-addon"><span
									class="glyphicon glyphicon-usd"></span></span> <input
									id="modify-item-price" name="price" class="form-control"
									placeholder="请输入单价" maxlength="10" type="text"
									value="${param.price}">
							</div>
							<span style="color: red; display: none;" class="tips"></span> <span
								style="display: none;"
								class="glyphicon glyphicon-remove form-control-feedback"></span>
							<span style="display: none;"
								class="glyphicon glyphicon-ok form-control-feedback"></span>
						</div>

						<div class="form-group has-feedback"
							id="modify-item-description-div">
							<label for="modify-item-description">描述</label>
							<div class="input-group">
								<span class="input-group-addon"><span
									class="glyphicon glyphicon-list-alt"></span></span>
								<textarea id="modify-item-description" name="description"
									class="form-control" rows="3" type="text"
									placeholder="请输入该商品的相关描述" style="resize: none"> ${param.description}</textarea>
							</div>
						</div>

						<div class="text-right">
							<span class="text-danger">${requestScope.modifyItemError}</span>
							<button class="btn btn-primary" type="submit">提&nbsp;&nbsp;交</button>
							<button class="btn btn btn-warning orm-control" type="reset">重&nbsp;&nbsp;置</button>
							<button class="btn btn-danger" data-dismiss="modal">取&nbsp;&nbsp;消</button>
						</div>
						
					</form>
				</div>
			</div>
		</div>
	</div>


	<!-- 根据post信息弹出修改弹框 -->
	<c:if test="${not empty param.modify}">
		<script>
			$('#modify').modal("show");
		</script>
	</c:if>

</body>
</html>