<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Sign up - WorldNews</title>
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <%@ include file="../segments/stylesheets.jspf"%>
      <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/forms.css">
    <body>
        <div class="container">
          <%@ include file="../segments/header.jspf"%>>

          <form action="${pageContext.request.contextPath}/signup" method="post" class="user-form">
            <h2 class="user-form-title">Sign up to WorldNews</h2>
            <input name="username" placeholder="Username" required>
            <input name="email" placeholder="example@mail.com" required>
            <input name="password" placeholder="password" type="password" required>
            <button class="user-form-button">Sign Up</button>
          </form>

          <%@ include file="../segments/footer.jspf"%>>
        </div>
    </body>
</html>