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

				<c:if test="${not empty param.error}">
					<div class="errorblock">
					<spring:message
									code="label.user.bad_login" />
					</div>
				</c:if>

				<form action="<c:url value='/j_spring_security_check' />"
					method="POST">
					<fieldset>
						<legend><spring:message code="label.user.values" /></legend>
						<div class="form-group">
							<label for="j_username" class="control-label"><spring:message
											code="label.user.username" />:</label>
							<input id="j_username" name="j_username"
								placeholder="<spring:message
											code="label.user.enter_username" />" class="form-control" type="text"
								value="" />
						</div>
						<div class="form-group">
							<label for="j_password" class="control-label"><spring:message
											code="label.user.password" />:</label>
							<input id="j_password" name="j_password"
								placeholder="<spring:message
											code="label.user.enter_password" />" class="form-control"
								type="password" value="" />
						</div>

						<button type="submit" class="btn btn-primary"><spring:message code="label.user.login" /></button>
					</fieldset>
				</form>
				<br>

				<c:url var="signup" value="/signup" />
				<p>
					<a href="${signup }"><spring:message code="label.user.dont_have_login_account" /></a>
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