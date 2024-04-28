<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="crt"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@page isELIgnored="false"%>


<c:url var="addSearch" value="/ctl/product/user/search" />

<br>
<div class="container"> 
<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item linkSize"><i class="fas fa-tachometer-alt"></i> <a class="link-dark" href="<c:url value="/welcome"/>">Home</a></li>
    <li class="breadcrumb-item linkSize active" aria-current="page"> <i class="fa fa-arrow-right" aria-hidden="true"></i>Product</li>
  </ol>
</nav>
</div>
<hr>
<sf:form method="post"
		action="${pageContext.request.contextPath}/ctl/product/user/search"
		modelAttribute="form">
<div class="container">
	

	<div class="row">
		<div class="col-2">
			<ul class="list-group">
				<li class="list-group-item active" aria-current="true">Category</li>
				<c:forEach items="${catList}" var="ct" varStatus="catego">
				<li class="list-group-item"><a class="link-dark"
					href="?cid=${ct.id}">${ct.name}</a></li>
				</c:forEach>
			</ul>
		</div>
		<div class="col-10">
		<div class="row">
  <div class="col-10">
   <s:bind path="name">
					<div class="col">
						<sf:input path="${status.expression}"
							class="form-control form-control-sm"
							placeholder="Search By Name" />
					</div>
				</s:bind>
  </div>
  <div class="col-2">
   <input type="submit" class="btn btn-sm btn-outline-primary"
							name="operation" value="Search"></input> or <input type="submit"
							class="btn btn-sm btn-outline-secondary" name="operation"
							value="Reset">
  </div>
</div>
<br>
			<div class="row row-cols-1 row-cols-md-5 g-4">

				<c:forEach items="${list}" var="pd" varStatus="product">
					<div class="col">
						<div class="card h-100">
							<img src="<c:url value="/ctl/product/getImage/${pd.id}" />" class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title">${pd.name}</h5>
								<p class="card-text">${pd.description}</p>
								<h6 class="card-title" style="color: orange;">${pd.price} usd</h6>
								<c:if test="${sessionScope.user !=null}">
									<a href="<c:url value="/ctl/cart?iId=${pd.id}" />"
										class="btn btn-primary btn btn-info">Add To Cart</a>
								</c:if>
								<c:if test="${sessionScope.user ==null}">
									<a href="<c:url value="/login?iId=${pd.id}" />"
										class="btn btn-primary btn btn-info">Add To Cart</a>
								</c:if>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="clearfix">
				
			<nav aria-label="Page navigation example float-end">
				<ul class="pagination justify-content-end" style="font-size: 13px">
					<li class="page-item"><input type="submit" name="operation"
								class="page-link" 	<c:if test="${form.pageNo == 1}">disabled="disabled"</c:if>
								value="Previous"></li>
								 <c:forEach var = "i" begin = "1" end = "${(listsize/10)+1}">
								 <c:if test="${i== pageNo}">
								<li class="page-item active"><a class="page-link activate" href="${addSearch}?pageNo=${i}">${i}</a></li>
								</c:if>
								<c:if test="${i != pageNo}">
								<li class="page-item"><a class="page-link" href="${addSearch}?pageNo=${i}">${i}</a></li>
								</c:if>
								</c:forEach>
					<li class="page-item"><input type="submit" name="operation"
								class="page-link" <c:if test="${total == pagenosize  || listsize < pageSize   }">disabled="disabled"</c:if>
								value="Next"></li>
				</ul>
			</nav>
			</div>
	</div>
</div>
</sf:form>