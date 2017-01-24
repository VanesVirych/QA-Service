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
						<h1>
							<spring:message code="label.user.my_answers_likes" />
						</h1>
					</div>
				</div>
				<br>
				<c:if test="${!empty answerLikes}">
					<c:forEach items="${answerLikes}" var="answer">
						<div class="row">
							<div class="col-lg-12">
								<sec:authorize
									access="hasRole('Admin') or '${authUsername}'=='${answer.getAnswer().getUser().getUsername()}'">
									<a
										href="<c:url value='/questions/${answer.getAnswer().getQuestion().id}/delete?id=${answer.getAnswer().id}' />"
										class="pull-right" role="button"><span
										class="glyphicon glyphicon-remove"></span></a>
									<a
										href="<c:url value='/questions/${answer.getAnswer().getQuestion().id}/edit?id=${answer.getAnswer().id}' />"
										class="pull-right" role="button"><span
										class="glyphicon glyphicon-pencil"></span></a>
								</sec:authorize>
								<i> <span class="glyphicon glyphicon-user"></span> <c:out
										value="${answer.getAnswer().getUser().username }" /></i> <br>
								<a
									href="<c:url value='/questions/${answer.getAnswer().getQuestion().id}#${answer.getAnswer().id}'/>">
									<c:out value="${answer.getAnswer().getQuestion().title}" />
								</a>

								<p>
									<c:out value="${answer.getAnswer().description}" />
								</p>
								<i> <span class="glyphicon glyphicon-time"></span> <fmt:formatDate
										type="both" dateStyle="long" timeStyle="short"
										value="${answer.getAnswer().created_at}"
										pattern="d MMMM yyyy, HH:mm" /></i>
								<div class="pull-right">
									<sec:authorize access="isAuthenticated()">
										<c:set var="count" value="0" scope="page" />
										<c:forEach items="${authUserAnswerLikes}" var="aLike">
											<c:if
												test="${answer.getAnswer().id == aLike.getAnswer().id }">
												<a
													href="<c:url value='/answer_like?aid=${answer.getAnswer().id}' />"
													class="link dislike glyphicon glyphicon-heart">${fn:length(answer.getAnswer().getAnswerLikes())}</a>
												<c:set var="count" value="${count + 1}" scope="page" />
											</c:if>
										</c:forEach>
										<c:if test="${count==0 }">
											<a
												href="<c:url value='/answer_like?aid=${answer.getAnswer().id}' />"
												class="link like glyphicon glyphicon-heart">${fn:length(answer.getAnswer().getAnswerLikes())}</a>
										</c:if>
									</sec:authorize>
								</div>
								<br>
								<br>
								<br>
							</div>
						</div>
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