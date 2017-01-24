<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<head>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <meta name="description" content="">
   <meta name="author" content="">
   <title><spring:message code="label.title" /></title>
   <link href="<c:url value='/css/bootstrap.css'/>" rel="stylesheet">
   <link href="<c:url value='/css/blog-post.css'/>" rel="stylesheet">
   <link href="<c:url value='/css/bootstrap-wysihtml5.css'/>" rel="stylesheet">
   <style>
   .full-width-image {
	background:url('<c:url value='/resources/bg2.jpg' />');
}
   </style>
</head>