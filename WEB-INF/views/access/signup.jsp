<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="ru">
<jsp:include page="../elements/head.jsp"></jsp:include>
<body>
	<jsp:include page="../elements/nav.jsp"></jsp:include><br>
	<div class="container">
		<div class="row">
			<div class="col-lg-4">
				<c:url var="signup" value="/signup" />

				<form:form modelAttribute="userAttribute" method="POST"
					action="${signup}" role="form">
					<fieldset>
						<legend>
							<spring:message code="label.user.create" />
						</legend>
						<c:choose>
						    <c:when test="${status=='signup.invalid.username.duplicate'}">
						       <div class="errorblock">
									<spring:message code="label.user.user_duplicate" />
								</div><br>
						    </c:when>
						    <c:when test="${status=='signup.invalid.password.notmatching'}">
						        <div class="errorblock">
									<spring:message code="label.user.password_nomatching" />
								</div><br>
						    </c:when>
							<c:when test="${status=='signup.invalid.email.duplicate'}">
						       <div class="errorblock">
									<spring:message code="label.user.email_duplicate" />
								</div><br>
						    </c:when>
						</c:choose>
						<div class="form-group">
							<form:label path="username" class="control-label">
								<spring:message code="label.user.username" />:</form:label>
							<form:input path="username" class="form-control"
								placeholder="" />
						</div>
						<div class="form-group">
							<form:label path="email" class="control-label">
								<spring:message code="label.user.email" />:</form:label>
							<form:input path="email" class="form-control"
								placeholder="" />
						</div>
						<div class="form-group">
							<form:label path="password" class="control-label">
								<spring:message code="label.user.password" />:</form:label>
							<form:password path="password" class="form-control"
								placeholder="" />
						</div>
						<div class="form-group">
							<form:label path="repassword" class="control-label">
							<spring:message code="label.user.enter_repassword" />:</form:label>
							<form:password path="repassword" class="form-control"
								placeholder="" />
						</div>

						<button type="submit" class="btn btn-primary">
							<spring:message code="label.user.create" />
						</button>
					</fieldset>
				</form:form>
				<br>
				<c:url var="login" value="/login" />
				<p>
					<a href="${login}"><spring:message code="label.user.have_account_login" /></a>
				</p>
			</div>
		</div>
		<!-- /row -->

		<hr>
		<jsp:include page="../elements/footer.jsp"></jsp:include>

	</div>
	<!-- /.container -->
	<jsp:include page="../elements/scripts.jsp"></jsp:include>
</body>
</html>