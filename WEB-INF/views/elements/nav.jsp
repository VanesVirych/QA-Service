<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-link" href="<c:url value='/' />">
				<img src="<c:url value='/resources/logo.png'/>" alt="">
			</a>
		</div>

		<div class="collapse navbar-collapse navbar-ex1-collapse">
			<ul class="nav navbar-nav">
				<li><a href="<c:url value='/about' />"><spring:message code="label.about" /></a></li>
				<li><a href="<c:url value='/questions' />"><spring:message
							code="label.questions" /></a></li>
			</ul>
						
							<a class="btn btn-primary btn-sm" href="<c:url value='/questions/add' /> ">
					<spring:message code="label.askquestion" /></a>

				<ul class="nav navbar-nav navbar-right">
				<sec:authorize var="loggedIn" access="isAuthenticated()" />
				<c:choose>
					<c:when test="${loggedIn}">
					
						<c:set var="authUsername" value="${pageContext.request.userPrincipal.name}" scope="session"></c:set>
						<li><a href="<c:url value='/profile' />">${authUsername}</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"><b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="<c:url value='/profile/favorite' />"><spring:message
									code="label.user.favorite" /></a></li>
								<li class="divider"></li>
								<li><a href="<c:url value='/profile/questions' />"><spring:message
									code="label.user.my_questions" /></a></li>
								<li><a href="<c:url value='/profile/answers' />"><spring:message
									code="label.user.my_answers" /></a></li>
								<li class="divider"></li>
								<li><a href="<c:url value='/profile/like_questions' />"><spring:message
									code="label.user.my_questions_likes" /></a></li>
								<li><a href="<c:url value='/profile/like_answers' />"><spring:message
									code="label.user.my_answers_likes" /></a></li>
								<li class="divider"></li>
								<li><a href="<c:url value='/logout' />"><spring:message
											code="label.user.logout" /></a></li>
							</ul></li>

					</c:when>
					<c:otherwise>
					<li><a href="<c:url value='/login' />"><spring:message
									code="label.user.login" /></a></li>
					<li><a href="<c:url value='/signup' />"><spring:message
									code="label.user.signup" /></a></li>

					</c:otherwise>
				</c:choose>
			</ul>
			<form class="navbar-form navbar-right" role="search"
				action="<c:url value='/search' />">
				<div class="form-group">
					<input name="q" type="text" class="form-control input-sm" placeholder="<spring:message 
						code="label.search" />...">
				</div>
				<button type="submit" class="btn btn-sm"><spring:message code="label.search" /></button>
			</form>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container -->
</nav>