<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	response.setHeader("pragma", "no-cache");
	response.setHeader("Cache-control",
			"no-cache, no-store, must-revalidate");
	response.setHeader("Expires", "0");
%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="ru">
<meta charset="utf-8">
<jsp:include page="elements/head.jsp"></jsp:include>
<body>
	<jsp:include page="elements/nav.jsp"></jsp:include>

	<div class="container">
		<div class="row">
			<div class="col-lg-9">
				<div class="row">
					<div class="col-lg-9">
						<h1>
							  <h1><spring:message code="label.about" /></h1>
						</h1>
						<p class="lead" style="font-size: 17px;">Добро пожаловать на сервис вопросов и ответов по веб-программированию.</p>
						<p class="lead" style="font-size: 17px;">Поскольку наука и техника стремительно развиваются, а наша профессия движется в первых рядах, 
						нужно все время изучать новое. И зачастую, когда сталкиваешься 
						с чем-нибудь незнакомым, хорошо спросить знающего человека, который подскажет, где смотреть и что искать.</p>
						<p class="lead" style="font-size: 17px;">Сервис расчитан на людей которые только начинают изучение веб-программирования, а также людей, 
						имеющие за плечями 
						огромный опыт в веб-разработке. Здесь по существу спрашивают и отвечают на широкий круг 
						вопросов по самым разным темам: js и jquery, Python и Ruby, php и ajax.</p>
					</div>

				</div>
				<br>

			</div>
		</div>

		<hr>
		<jsp:include page="elements/footer.jsp"></jsp:include>

	</div>
	<!-- /.container -->
	<jsp:include page="elements/scripts.jsp"></jsp:include>
</body>
</html>