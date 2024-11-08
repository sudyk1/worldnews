<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pl">
    <head>
        <meta charset="UTF-8">
        <title>WorldNews</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./styles/main.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
              rel="stylesheet">
        <script src="https://kit.fontawesome.com/c620762b90.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="container">
            <nav class="navbar">
                <a href="#" class="logo">
                    <i class="fa-solid fa-globe"></i>
                    WorldNews
                </a>
                <a href="#" class="login-button">Login</a>
            </nav>
            <aside class="categories">
                <ul>
                    <li><a href="#">Entertainment</a></li>
                    <li><a href="#">Politics</a></li>
                    <li><a href="#">Business</a></li>
                </ul>
            </aside>
            <main>
                <c:forEach var="discovery" items="${requestScope.discoveries}">
                    <article class="discovery">
                        <h2 class="discovery-header"><c:out value="${discovery.title}"/></h2>
                        <p class="discovery-details">Added by: Eva, ${discovery.dateAdded.format(DateTimeFormatter.ofPattern("dd.MM.yyyy HH:mm"))}</p>
                        <a href="<c:out value="${discovery.url}"/>" target="_blank" class="discovery-link"><c:out value="${discovery.url}"/></a>
                        <p>${discovery.description}</p>
                        <section class="discovery-bar">
                            <a href="#" class="discovery-link upvote">
                                <i class="fa-solid fa-thumbs-up"></i>
                            </a>
                            <p class="discovery-votes">32</p>
                            <a href="#" class="discovery-link downvote">
                                <i class="fa-solid fa-thumbs-down"></i>
                            </a>
                        </section>
                    </article>
                </c:forEach>

            </main>
            <footer>ReadStack ®, developed by sudyk</footer>
        </div>
    </body>
</html>
