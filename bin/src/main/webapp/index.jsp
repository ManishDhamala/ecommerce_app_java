<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"  href="styles/global.css">
    <link rel="stylesheet" href="/styles/global.css">
    <link rel="stylesheet" href="/styles/css/carousel.styles.css">
    <link rel="stylesheet" href="/styles/css/header.styles.css">

    <title>Gadget.</title>
</head>
<body>
<%--header--%>
<jsp:include page="pages/header.jsp"/>
<%--header end--%>
<%--carousel--%>
<jsp:include page="pages/carousel.jsp"/>
<%--carousel end--%>
<%--featuredProduct--%>
<jsp:include page="pages/featuredProduct.jsp"/>
<%--featuredProduct end --%>
<%--mostsellingProduct--%>
<jsp:include page="pages/mostSellingProduct.jsp"/>
<%--mostsellingproductend--%>
<%--footer--%>
<jsp:include page="pages/footer.jsp"/>
<%--footer end--%>
<script defer src ="script/myscript.js"></script>
</body>
</html>