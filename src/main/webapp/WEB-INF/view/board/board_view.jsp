<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<!--
	Strata by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
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
	

<script>

	function boardList() {
		f.action = "../index.do"
		f.submit();
	}
	function boardModify() {
		f.action = "./modify.do";
		f.submit();
	}
	function boardRemove() {
		if (confirm("정말 삭제하시겠습니까?")) {
			f.action = "./remove.do";
			f.submit();
		}
	}
</script>

</head>
<body class="is-preload">
	<header id="header">
		<jsp:include page="../todoMenu.jsp" />
	</header>
	<!-- Main -->
	<div id="main">

		<!-- One -->

		<section id="one">
			<div style="float: right">
				<a href="./add.do" class="button primary small">글 쓰기</a> <a href="#"
					class="button primary small">발자취</a>
			</div>
		</section>
		<!-- Two -->
		<section id="two">
			<br>
			<h2>상세보기</h2>
			<div class="row">
				<article class="col-6 col-12-xsmall work-item" style="width: 100%;">

					<!-- boardid넘기기 -->

					<a
						href="${pageContext.request.contextPath}/images/projectimg/${board.img}"
						class="image fit thumb"><img
						src="${pageContext.request.contextPath}/images/projectimg/${board.img}"
						alt="" /></a>
					<h3>작성자: ${board.id}</h3>


					<form method="post" action="" name="f">
						<input type="hidden" name="bseq" value="${board.bseq}">
						<!-- bseq넘기기 -->

						<div style="float: right">

							<input type="button" value="목록 " onClick="boardList()"> <input
								type="button" value="수정 " onClick="boardModify()"> <input
								type="button" value="삭제 " onClick="boardRemove()">

						</div>
					</form>
					<h3>날짜: ${board.regdate}</h3>

					<p>내용: ${board.bcontent}</p>

				</article>

			</div>

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