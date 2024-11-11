<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Add new discovery - WorldNews</title>
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/add-discovery-form.css">
      <%@ include file="../segments/stylesheets.jspf"%>
    </head>
    <body>
      <div class="container">
        <%@ include file="../segments/header.jspf"%>
        <form action="${pageContext.request.contextPath}/discovery/add" method="post" class="discovery-form">
          <h2 class="discovery-form-title">Add new discovery</h2>
          <input name="title" placeholder="Title" required>
          <input name="url" placeholder="original link" required>
          <select name="categoryId">
              <c:forEach var="category" items="${requestScope.categories}">
                  <option value="${category.id}">${category.name}</option>
              </c:forEach>
          </select>
          <textarea name="description" placeholder="Description..."></textarea>
          <button class="discovery-form-button">Add</button>

        </form>
        <%@ include file="../segments/footer.jspf"%>
      </div>
    </body>
</html>