<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
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
					<div class="col-lg-12">
						<h1>${question.title}</h1>
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
						</sec:authorize>
						<i class="pull-left"><span class="glyphicon glyphicon-user"></span>
							<c:out value="${question.getUser().username}" /><br> <span
							class="glyphicon glyphicon-time"></span> <fmt:formatDate
								type="both" dateStyle="long" timeStyle="short"
								value="${question.created_at}" pattern="d MMMM yyyy, HH:mm" />
						</i>
					</div>
				</div>
				<br>
				<p>${question.description}</p>
				<div class="pull-right">
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
				</div>
				<div class="clearfix"></div>
				<br>
				<a name="answer"></a>
				<spring:message code="label.countanswers" />${fn:length(answers)}
				<hr>
				
				<c:if test="${!empty answers}">
					<c:forEach items="${answers}" var="answer">
					<div style="padding-left:30px;">
					<div class="pull-right">
						<sec:authorize
							access="hasRole('Admin') or '${authUsername}'=='${answer.getUser().username }'">
							<a
								href="<c:url value='/questions/${question.id}/edit?id=${answer.id}' />"
								role="button"><span class="glyphicon glyphicon-pencil"></span></a>
							<a
								href="<c:url value='/questions/${question.id}/delete?id=${answer.id}' />"
								role="button"><span class="glyphicon glyphicon-remove"></span></a>
						</sec:authorize>
						</div>
							<i><span class="glyphicon glyphicon-user"></span> <c:out
								value="${answer.getUser().username}" />
							</i>
							<br>
							<p class="answer">
							<a name="${answer.id}"></a> ${answer.description}
							</p>
							
							
							
							<div class="pull-right">
							<sec:authorize access="isAuthenticated()">
								<c:set var="count" value="0" scope="page" />
								<c:if test="${!empty authUserAnswerLikes}">
								<c:forEach items="${authUserAnswerLikes}" var="aLike">
									<c:if test="${answer.id == aLike.getAnswer().id }">
										<a href="<c:url value='/answer_like?aid=${answer.id}' />"
											class="link dislike glyphicon glyphicon-heart">${fn:length(answer.getAnswerLikes())}</a>
										<c:set var="count" value="${count + 1}" scope="page" />
									</c:if>
								</c:forEach>
								</c:if>
								<c:if test="${count==0 }">
									<a href="<c:url value='/answer_like?aid=${answer.id}' />"
										class="link like glyphicon glyphicon-heart">${fn:length(answer.getAnswerLikes())}</a>
								</c:if>
							</sec:authorize>
							<c:if test="${!auth}">
								<span class="countFav glyphicon glyphicon-heart">${fn:length(answer.getAnswerLikes())}
								</span>
							</c:if>
						</div>
									
						<i> <span class="glyphicon glyphicon-time"></span>
							<fmt:formatDate type="both" dateStyle="long" timeStyle="short"
							value="${answer.created_at}" pattern="d MMMM yyyy, HH:mm" /> <br>
						</i>
						</div>
						<br>
					</c:forEach>
				</c:if>
				<br><br>
				<c:choose>
					<c:when test="${answerAttribute.id==0}">
						<c:url var="saveUrl" value="/questions/${question.id}/add" />
						<form:form modelAttribute="answerAttribute" method="POST"
							action="${saveUrl}" role="form">
							<fieldset>
								<legend>
									<spring:message code="label.writeanswer" />
								</legend>
								<div class="form-group">
									<form:label path="description" class="control-label">
										<spring:message code="label.adescription" />:</form:label>
									<form:textarea path="description" id="answ"
										class="form-control" rows="3" />
								</div>
								<button type="submit" class="btn btn-primary">
									<spring:message code="label.add" />
								</button>
							</fieldset>
						</form:form>
					</c:when>
					<c:otherwise>
						<c:url var="saveUrl" value="/questions/${qid}/edit" />
						<form:form modelAttribute="answerAttribute" method="POST"
							action="${saveUrl}" role="form">
							<fieldset>
								<legend>
									<spring:message code="label.writeanswer" />
								</legend>
								<div class="form-group">
									<form:input path="id" class="control-label" hidden="hidden" />
									<form:label path="description" class="control-label">
										<spring:message code="label.adescription" />:</form:label>
									<form:textarea path="description" id="answ"
										class="form-control" rows="3" />
								</div>
								<button type="submit" class="btn btn-primary">
									<spring:message code="label.edit" />
								</button>
							</fieldset>
						</form:form>
					</c:otherwise>
				</c:choose>
			</div>


			<jsp:include page="elements/latest.jsp"></jsp:include>
		</div>
		<hr>
		<jsp:include page="elements/footer.jsp"></jsp:include>
	</div>
	<!-- /.container -->
	<jsp:include page="elements/scripts.jsp"></jsp:include></body>
</html>