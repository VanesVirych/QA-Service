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
							<spring:message code="label.user.my_profile" />
						</h1>
					</div>
				</div>
				<br>
				<p><spring:message code="label.user.username" />: ${user.username }</p>
				<p><spring:message code="label.user.email" />: ${user.email }</p>
				<p><spring:message code="label.user.created_at" />: ${user.created_at }</p>
			</div>

		</div>

		<hr>

		<jsp:include page="../elements/footer.jsp"></jsp:include>

	</div>
	<!-- /.container -->
	<jsp:include page="../elements/scripts.jsp"></jsp:include>
</body>
</html>