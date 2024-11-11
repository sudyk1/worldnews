<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pl">
    <head>
        <meta charset="UTF-8">
        <title>WorldNews</title>
        <%@ include file="../segments/stylesheets.jspf" %>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/add-button.css">
    </head>
    <body>
        <div class="container">
            <%@include file="../segments/header.jspf" %>
            <aside class="categories">
                <ul>
                    <c:forEach var="category" items="${requestScope.categories}">
                        <li><a href="${pageContext.request.contextPath.concat('/category?id=').concat(category.id)}">${category.name}</a></li>
                    </c:forEach>
                </ul>
            </aside>
            <main>
                <%@ include file="../segments/discovery-list.jspf" %>
            </main>
            <%@ include file="../segments/footer.jspf" %>
        </div>
    </body>
</html>
