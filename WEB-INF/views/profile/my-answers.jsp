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
							<spring:message code="label.user.my_answers" />
						</h1>
					</div>
				</div>
				<br>
				<c:if test="${!empty answers}">
					<c:forEach items="${answers}" var="answer">
						<div class="row">
							<div class="col-lg-12">
								<p>
									<a href="<c:url value='/questions/${answer.getQuestion().id}/delete?id=${answer.id}' />" 
									class="pull-right" role="button"> 
									<span class="glyphicon glyphicon-remove"></span></a> 
									<a href="<c:url value='/questions/${answer.getQuestion().id}/edit?id=${answer.id}' />" 
									class="pull-right" role="button"> <span class="glyphicon glyphicon-pencil"></span></a>
										<i><span
										class="glyphicon glyphicon-user"></span>
									<c:out value="${answer.getUser().username }" /></i>
								</p>
								<a
									href="<c:url value='/questions/${answer.getQuestion().id}#${answer.id}'/>">
									<c:out value="${answer.getQuestion().title}" />
								</a>

								<p>${answer.description}</p>
								<i><span class="glyphicon glyphicon-time"></span>
								<fmt:formatDate type="both" dateStyle="long" timeStyle="short"
									value="${answer.created_at}" pattern="d MMMM yyyy, HH:mm" /></i>
								<div class="pull-right">
									<sec:authorize access="isAuthenticated()">
										<c:set var="count" value="0" scope="page" />
										<c:forEach items="${authUserAnswerLikes}" var="aLike">
											<c:if test="${answer.id == aLike.getAnswer().id }">
												<a href="<c:url value='/answer_like?aid=${answer.id}' />"
													class="link dislike glyphicon glyphicon-heart">${fn:length(answer.getAnswerLikes())}</a>
												<c:set var="count" value="${count + 1}" scope="page" />
											</c:if>
										</c:forEach>
										<c:if test="${count==0 }">
											<a href="<c:url value='/answer_like?aid=${answer.id}' />"
												class="link like glyphicon glyphicon-heart">${fn:length(answer.getAnswerLikes())}</a>
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