<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ru">
<jsp:include page="elements/head.jsp"></jsp:include>
<body>
	<jsp:include page="elements/nav.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				<div class="row">
					<div class="col-lg-9">
						<h1>
							<spring:message code="label.result_search" />
						</h1>
					</div>
				</div>


				<c:if test="${!empty questions}">
					<c:forEach items="${questions}" var="question">
						<hr>
						<h2>
							<span class="glyphicon glyphicon-comment">${fn:length(question.getAnswers())}</span>

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
										<a href="<c:url value='/question_like?qid=${question.id}' />"
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

							<a href="<c:url value='/questions/${question.id}' />"> <c:out
									value="${question.title}" />
							</a>
						</h2>

						<p>${question.description}</p>
						<div class="muted pull-right">
							<span class="glyphicon glyphicon-time"></span> &nbsp;
							<fmt:formatDate type="both" dateStyle="long" timeStyle="short"
								value="${question.created_at}" pattern="d MMMM yyyy, HH:mm" />
							<br /> <span class="glyphicon glyphicon-user"></span> &nbsp;
							<c:out value="${question.getUser().username}" />
						</div>
						<p class="clearfix"></p>

						<a class="btn btn-default"
							href="<c:url value='/questions/${question.id}#answer' />"> <spring:message
								code="label.goToAnswers" />
						</a>
					</c:forEach>
				</c:if>


			</div>
		</div>

		<hr>

		<jsp:include page="elements/footer.jsp"></jsp:include>

	</div>
	<!-- /.container -->
	<jsp:include page="elements/scripts.jsp"></jsp:include>
</body>
</html>