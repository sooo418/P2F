<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Strata by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/fullcal/lib/cupertino/jquery-ui.min.css' />
<link href='${pageContext.request.contextPath}/fullcal/fullcalendar.css'
	rel='stylesheet' />
<link
	href='${pageContext.request.contextPath}/fullcal/fullcalendar.print.css'
	rel='stylesheet' media='print' />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
	
</script>
<script type="text/javascript">
	function Logout() {
		f1.action = "/logout.do"
		f1.submit();
	}
	function al() {
		alert("로그인 해주세요");
	}
</script>
</head>
<body class="is-preload">
	<c:if test="${empty login}">
		<!-- Header -->
		<header id="header" style="padding: 96px 48px 48px 48px;">
			<jsp:include page="loginMenu.jsp" />
		</header>
	</c:if>
	<c:if test="${!empty login }">
		<header id="header">
			<jsp:include page="todoMenu.jsp" />
		</header>
	</c:if>

	<!-- Main -->
	<div id="main">
		<section id="one">
			<%-- <input type="hidden" name="${user.id}"> --%>
			<a href="index.do" class="button small1" style="margin-right: 20px">전체
				일기</a>
			<c:if test="${empty login}">

				<a href="#" onclick="al();" class="button small1">내 일기</a>
			</c:if>
			<c:if test="${!empty login}">
				<a href="mylist.do?id=${user.id}" class="button small1">내 일기</a>
			</c:if>

			<c:if test="${empty login}">
				<div style="float: right">
					<a href="#" onclick="al();" class="button primary small">글 쓰기</a> <a
						href="#" onclick="al();" class="button primary small"
						style="margin-left: 20px;">발자취</a>
				</div>
			</c:if>
			<c:if test="${!empty login}">
				<div style="float: right">
					<a href="./board/add.do" class="button primary small">글 쓰기</a> <a
						href="./board/footprint.do?id=${user.id}"
						class="button primary small" style="margin-left: 20px;">발자취</a>
				</div>
			</c:if>
		</section>

		<!-- Two -->
		<section id="two">
			<br>
			<h2>NEWSPEED</h2>
			<div class="row">
				<c:forEach var="board" items="${boards}">
					<article class="col-6 col-12-xsmall work-item" style="width: 100%">
						<!-- boardid넘기기 -->
						<a
							href="${pageContext.request.contextPath}/images/projectimg/${board.img}"
							class="image fit thumb"><img
							src="${pageContext.request.contextPath}/images/projectimg/${board.img}"
							alt="" /></a>
						<h3>작성자: ${board.id}</h3>
						<div style="float: right">
							<a
								href="${pageContext.request.contextPath}/board/view.do?bseq=${board.bseq}">
								+ </a>
						</div>
						<h3>날짜: ${board.regdate}</h3>
						<p>내용: ${board.bcontent}</p>
					</article>
				</c:forEach>
			</div>
			<ul class="actions">
				<li><a href="#" class="button">위로가기</a></li>
			</ul>
		</section>
	</div>
	<!-- Footer -->
	<footer id="footer">
		<div class="inner">
			<ul class="icons">
				<li><a href="#" class="icon brands fa-twitter"><span
						class="label">Twitter</span></a></li>
				<li><a href="#" class="icon brands fa-github"><span
						class="label">Github</span></a></li>
				<li><a href="#" class="icon brands fa-dribbble"><span
						class="label">Dribbble</span></a></li>
				<li><a href="#" class="icon solid fa-envelope"><span
						class="label">Email</span></a></li>
			</ul>
			<ul class="copyright">
				<li>&copy; Untitled</li>
				<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
			</ul>
		</div>
	</footer>

	<!-- Scripts -->
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.poptrox.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
	<script
		src='${pageContext.request.contextPath}/fullcal/lib/moment.min.js'></script>
	<script
		src='${pageContext.request.contextPath}/fullcal/lib/jquery.min.js'></script>
	<script
		src='${pageContext.request.contextPath}/fullcal/fullcalendar.min.js'></script>
	<script src='${pageContext.request.contextPath}/fullcal/lang-all.js'></script>
</body>
</html>