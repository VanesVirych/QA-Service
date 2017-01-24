<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ru">
<jsp:include page="../elements/head.jsp"></jsp:include>
<body>
	<jsp:include page="../elements/nav.jsp"></jsp:include>

	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				<div class="row">
					<div class="col-lg-9">
						<h1><spring:message code="label.user.favorite" /></h1>
					</div>
				</div>
				<br>
				<c:if test="${!empty authUserFavorites}">
					<c:forEach items="${authUserFavorites}" var="question">
						<div class="row">
							<div class="col-lg-12">
						<span class="glyphicon glyphicon-user"></span> &nbsp;
							<c:out value="${question.getQuestion().getUser().username}" />
							
						<sec:authorize access="hasRole('Admin') or '${authUsername}'=='${question.getQuestion().getUser().username }'">
							<a href="<c:url value='/questions/delete?id=${question.id}' />"
								class="pull-right " role="button"><span class="glyphicon glyphicon-remove"></span></a>
							<a href="<c:url value='/questions/edit?id=${question.getQuestion().id}' />"
								style="margin-right: 5px;"
								class="pull-right " role="button"><span class="glyphicon glyphicon-pencil"></span></a>
						<div class="clearfix"></div>
						</sec:authorize>
						<h2>
							<a href="<c:url value='/questions/${question.getQuestion().id}' />"> <c:out
									value="${question.getQuestion().title}" />
							</a>
						</h2>

						<p>${question.getQuestion().description}</p>
							<span class="glyphicon glyphicon-time"></span> &nbsp;
							<fmt:formatDate type="both" dateStyle="long" timeStyle="short"
								value="${question.getQuestion().created_at}" pattern="d MMMM yyyy, HH:mm" />
							
						
						<div class="pull-right">
						<a class="glyphicon glyphicon-comment comment" href="<c:url value='/questions/${question.getQuestion().id}' />#answer">${fn:length(question.getQuestion().getAnswers())}
						</a>
							<sec:authorize access="isAuthenticated()" var="auth">
								<c:set var="count" value="0" scope="page" />

								<c:forEach items="${authUserFavorites}" var="fav">
									<c:if test="${question.getQuestion().id == fav.getQuestion().id }">
										<a href="<c:url value='/favorite?qid=${question.getQuestion().id}' />"
											class="link unsubscribe glyphicon glyphicon-star">${fn:length(question.getQuestion().getFavorites())}
										</a>
										<c:set var="count" value="${count + 1}" scope="page" />
									</c:if>
								</c:forEach>
								<c:if test="${count==0 }">
									<a href="<c:url value='/favorite?qid=${question.getQuestion().id}' />"
										class="link subscribe glyphicon glyphicon-star">${fn:length(question.getQuestion().getFavorites())}
									</a>
								</c:if>
							</sec:authorize>
							<c:if test="${!auth}">
								<span class="countFav glyphicon glyphicon-star">${fn:length(question.getQuestion().getFavorites())}
								</span>
							</c:if>
							<sec:authorize access="isAuthenticated()" var="auth">
								<c:set var="count" value="0" scope="page" />

								<c:forEach items="${authUserQuestionLikes}" var="qLike">
									<c:if test="${question.getQuestion().id == qLike.getQuestion().id }">
										<a href="<c:url value='/question_like?qid=${question.getQuestion().id}' />"
											class="link dislike glyphicon glyphicon-heart">${fn:length(question.getQuestion().getQuestionLikes())}
										</a>
										<c:set var="count" value="${count + 1}" scope="page" />
									</c:if>
								</c:forEach>
								<c:if test="${count==0 }">
									<a href="<c:url value='/question_like?qid=${question.getQuestion().id}' />"
										class="link like glyphicon glyphicon-heart">${fn:length(question.getQuestion().getQuestionLikes())}</a>
								</c:if>
							</sec:authorize>
							<c:if test="${!auth}">
								<span class="countFav glyphicon glyphicon-heart">${fn:length(question.getQuestion().getQuestionLikes())}
								</span>
							</c:if>
						</div><br><br><br>
						</div></div>
					</c:forEach>
				</c:if>
			</div>
		</div>
		<hr>
		<jsp:include page="../elements/footer.jsp"></jsp:include>

	</div>
	<!-- /.container -->
	<jsp:include page="../elements/scripts.jsp"></jsp:include>
</body>
</html>