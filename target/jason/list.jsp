<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
	
	<!-- el 표현식 사용시 isELIgnored="false" 추가~  -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link type="text/css" rel="stylesheet" href="./css/table.css">
<H3>userinfo list</H3>

<table>
	<tr>
		<th>userid</th>
		<th>username</th>
		<th>email</th>
		<th>phone</th>
		<th>address</th>
	</tr>

	<c:forEach var="user" items="${users}">
		<tr>
			<td>${user.userid}</td>
			<td>${user.username}</td>
			<td>${user.email}</td>
			<td>${user.phone}</td>
			<td>${user.address}</td>
		</tr>
	</c:forEach>
</table>