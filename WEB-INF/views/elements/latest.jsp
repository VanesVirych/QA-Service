<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div class="col-lg-3 col-lg-offset-1"><br>
	<div class="well">
		<h4>
			<spring:message code="label.latest5questions" />
		</h4>
		<c:if test="${!empty limitedQuestions}">
			<c:forEach items="${limitedQuestions}" var="lquestion">
				<a href="<c:url value='/questions/${lquestion.id}' />"> <c:out
						value="${lquestion.title}" /><br>
				</a><br>
			</c:forEach>
		</c:if>
	</div>
</div>