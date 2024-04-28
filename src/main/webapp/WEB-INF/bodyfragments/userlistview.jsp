<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="crt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User List</title>
</head>
<body >

<div class="container" >

<h2 style="padding: 30px">User List</h2>
<%@include file="businessMessage.jsp" %>
<table class="table bg-light text-dark">
  <thead>
    <tr>
      <th scope="col">First Name</th>
      <th scope="col">Last Name</th>
      <th scope="col">Email Id</th>
      <th scope="col">Phone Number</th>   
      <th scope="col">User Type</th>   
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${list}" var="li" varStatus="u">
    <tr>     
      <td>${li.firstName}</td>
      <td>${li.lastName}</td>
      <td>${li.emailId}</td>
      <td>${li.contactNo}</td>
 	  <td>${li.userType}</td>
      <td> 
     <c:if test="${li.userType != 'Admin'}">
     
     <c:if test="${li.userType == 'seller'}">
     <c:choose>
      <c:when test="${li.status == 'Active'}">     
      <a href="${pageContext.request.contextPath}/approveSeller?id=${li.id}" class="btn btn-success">Approved</a>      
      </c:when>
      <c:otherwise>     
      <a href="${pageContext.request.contextPath}/approveSeller?id=${li.id}" class="btn btn-info">Approve</a>     
      </c:otherwise>           
      </c:choose>  
     
     </c:if>
     
     
     <c:if test="${li.userType == 'customer'}">
      <c:choose>
      <c:when test="${li.status == 'Active'}">     
      <a href="${pageContext.request.contextPath}/blockUser?id=${li.id}" class="btn btn-warning">Block</a>      
      </c:when>
      <c:otherwise>     
      <a href="${pageContext.request.contextPath}/blockUser?id=${li.id}" class="btn btn-danger">Blocked</a>     
      </c:otherwise>           
      </c:choose>  
      </c:if> 
      
        
       </c:if>
      </td>
    </tr>
   </c:forEach>
  </tbody>
</table>

</div>

</body>
</html>