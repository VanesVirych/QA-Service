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
<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>

<!DOCTYPE html>
<html lang="ru">
<meta charset="utf-8">
<jsp:include page="elements/head.jsp"></jsp:include>
<body>
	<jsp:include page="elements/nav.jsp"></jsp:include>
<div class="full-width-image">
        <div class="logo-wrapper row">
        <div class="container col-lg-9 col-lg-offset-1">
                  <h1>Добро пожаловать на сервис вопросов и ответов для начинающих программистов!</h1>
                <p class="lead">Здесь вы можете получить ответы на интересующие вас вопросы, а также просматривать вопросы и отвечать на них.</p>
                <a class="btn btn-success" href="<c:url value='/about' />"><spring:message code="label.about_pdr" /></a>
            </div>
        </div>
    </div>

	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				<div class="row">
					<div class="col-lg-9">
						<h1>
							<spring:message code="label.questions" />
						</h1>
					</div>
				</div>
				<br>
				<c:if test="${!empty questions}">
					<c:forEach items="${questions}" var="question">
						<div class="row">
							<div class="col-lg-12">
								<i><span class="glyphicon glyphicon-user"></span>
								<c:out value="${question.getUser().username}" />
								</i>
								<sec:authorize
									access="hasRole('Admin') or '${authUsername}'=='${question.getUser().username }'">

									<a href="<c:url value='/questions/delete?id=${question.id}' />"
										class="pull-right" role="button"> <span
										class="glyphicon glyphicon-remove"></span>
									</a>
									<a href="<c:url value='/questions/edit?id=${question.id}' />"
										style="margin-right: 5px;" class="pull-right " role="button">
										<span class="glyphicon glyphicon-pencil"></span>
									</a>
									<div class="clearfix"></div>
								</sec:authorize>
								<h2>
									<a href="<c:url value='/questions/${question.id}' />"> <c:out
											value="${question.title}" />
									</a>
								</h2>

								<p>${question.description}</p>
								<i><span class="glyphicon glyphicon-time"></span>
								<fmt:formatDate type="both" dateStyle="long" timeStyle="short"
									value="${question.created_at}" pattern="d MMMM yyyy, HH:mm" />
								</i>
								<div class="pull-right">
									<a class="comment glyphicon glyphicon-comment"
										href="<c:url value='/questions/${question.id}#answer' />">${fn:length(question.getAnswers())}
									</a>
									<sec:authorize access="isAuthenticated()" var="auth">
										<c:set var="count" value="0" scope="page" />

										<c:forEach items="${authUserFavorites}" var="fav">
											<c:if test="${question.id == fav.getQuestion().id }">
												<a href="<c:url value='/favorite?qid=${question.id}' />"
													class="link unsubscribe glyphicon glyphicon-star">${fn:length(question.getFavorites())}
												</a>
												<c:set var="count" value="${count + 1}" scope="page" />
											</c:if>
										</c:forEach>
										<c:if test="${count==0 }">
											<a href="<c:url value='/favorite?qid=${question.id}' />"
												class="link subscribe glyphicon glyphicon-star">${fn:length(question.getFavorites())}
											</a>
										</c:if>
									</sec:authorize>
									<c:if test="${!auth}">
										<span class="countFav glyphicon glyphicon-star">${fn:length(question.getFavorites())}
										</span>
									</c:if>
									<sec:authorize access="isAuthenticated()" var="auth">
										<c:set var="count" value="0" scope="page" />

										<c:forEach items="${authUserQuestionLikes}" var="qLike">
											<c:if test="${question.id == qLike.getQuestion().id }">
												<a
													href="<c:url value='/question_like?qid=${question.id}' />"
													class="link dislike glyphicon glyphicon-heart">${fn:length(question.getQuestionLikes())}
												</a>
												<c:set var="count" value="${count + 1}" scope="page" />
											</c:if>
										</c:forEach>
										<c:if test="${count==0 }">
											<a href="<c:url value='/question_like?qid=${question.id}' />"
												class="link like glyphicon glyphicon-heart">${fn:length(question.getQuestionLikes())}</a>
										</c:if>
									</sec:authorize>
									<c:if test="${!auth}">
										<span class="countFav glyphicon glyphicon-heart">${fn:length(question.getQuestionLikes())}
										</span>
									</c:if>
								</div>
								<br>
								<br>
								<br>
							</div>
						</div>
					</c:forEach>
				</c:if>
			</div>

			<jsp:include page="elements/latest.jsp"></jsp:include>
		</div>

		<hr>

		<jsp:include page="elements/footer.jsp"></jsp:include>

	</div>
	<!-- /.container -->
	<jsp:include page="elements/scripts.jsp"></jsp:include>
</body>
</html>