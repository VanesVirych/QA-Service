<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="ru">
<jsp:include page="elements/head.jsp"></jsp:include>
<body>
	<jsp:include page="elements/nav.jsp"></jsp:include><br>
	<div class="container">
		<div class="row">
			<div class="col-lg-7">
				<c:choose>
					<c:when test="${questionAttribute.id==0}">
						<c:url var="saveUrl" value="/questions/add" />



						<form:form modelAttribute="questionAttribute" method="POST"
							action="${saveUrl}" role="form">
							<fieldset>
								<legend>
									<spring:message code="label.yourquestion" />
								</legend>
								<div class="form-group">
									<form:label path="title" class="control-label">
										<spring:message code="label.qtitle" />:</form:label>
									<form:input path="title" class="form-control"
										placeholder="Enter title" />
								</div>
								<div class="form-group">
									<form:label path="title" class="control-label">
										<spring:message code="label.qdescription" />:</form:label>
									<form:textarea path="description" id="descr"
										class="form-control" rows="10" />

								</div>
								<button type="submit" class="btn btn-primary">
									<spring:message code="label.addQuestion" />
								</button>
							</fieldset>
						</form:form>

					</c:when>
					<c:otherwise>

						<c:url var="saveUrl"
							value="/questions/edit?id=${questionAttribute.id}" />
						<form:form modelAttribute="questionAttribute" method="POST"
							action="${saveUrl}" role="form">
							<fieldset>
								<legend>
									<spring:message code="label.yourquestion" />
								</legend>
								<div class="form-group">
									<form:label path="title" class="control-label">
										<spring:message code="label.qtitle" />:</form:label>
									<form:input path="title" class="form-control"
										placeholder="Enter email" />
								</div>
								<div class="form-group">
									<form:label path="title" class="control-label">
										<spring:message code="label.qdescription" />:</form:label>
									<form:textarea path="description" id="descr" class="form-control" rows="10" />
								</div>
								<button type="submit" class="btn btn-primary">
									<spring:message code="label.edit" />
								</button>
							</fieldset>
						</form:form>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<!-- /row -->

		<hr>

		<jsp:include page="elements/footer.jsp"></jsp:include>

	</div>
	<!-- /.container -->
	<jsp:include page="elements/scripts.jsp"></jsp:include>
</body>
</html>



