<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>upload file</title>
</head>
<body>
<h2>파일 업로드 완료</h2>
<a href="${pageContext.request.contextPath}/index.jsp">HOME</a>
<img alt="~~~" width="300px" src="${pageContext.request.contextPath}/upload/${imgname}"/>
<input type="submit" value="delete">
</body>
</html>