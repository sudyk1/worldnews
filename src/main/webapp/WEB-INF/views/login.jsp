<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Login - WorldNews</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <%@ include file="../segments/stylesheets.jspf"%>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/forms.css">
    <body>
        <div class="container">
            <%@ include file="../segments/header.jspf"%>>

            <form action="j_security_check" method="post" class="user-form">
                <h2 class="user-form-title">Sign up to WorldNews</h2>
                <input name="j_username" placeholder="Username" required>
                <input name="j_password" placeholder="password" type="password" required>
                <button class="user-form-button">Login</button>
                <p>Don't have account? <a href="${pageContext.request.contextPath}/signup">Register</a></p>
            </form>

            <%@ include file="../segments/footer.jspf"%>>
        </div>
    </body>
</html>