package pl.sudyk.worldnews.client.signup;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pl.sudyk.worldnews.domain.api.UserRegistration;
import pl.sudyk.worldnews.domain.api.UserService;

import java.io.IOException;

@WebServlet("/signup")
public class SignupController extends HttpServlet {
    private final UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/signup.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserRegistration userRegistration = getUserData(req);
        userService.register(userRegistration);
        resp.sendRedirect(req.getContextPath());
    }

    private UserRegistration getUserData(HttpServletRequest req) {
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        return new UserRegistration(username, email, password);
    }
}
