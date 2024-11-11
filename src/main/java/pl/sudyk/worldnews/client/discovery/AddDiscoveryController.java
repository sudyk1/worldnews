package pl.sudyk.worldnews.client.discovery;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.HttpMethodConstraint;
import jakarta.servlet.annotation.ServletSecurity;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pl.sudyk.worldnews.domain.api.CategoryName;
import pl.sudyk.worldnews.domain.api.CategoryService;
import pl.sudyk.worldnews.domain.api.DiscoverySaveRequest;
import pl.sudyk.worldnews.domain.api.DiscoveryService;

import java.io.IOException;
import java.util.List;

@WebServlet("/discovery/add")
@ServletSecurity(
        httpMethodConstraints = {
                @HttpMethodConstraint(value = "GET", rolesAllowed = "USER"),
                @HttpMethodConstraint(value = "POST", rolesAllowed = "USER")
        }
)
public class AddDiscoveryController extends HttpServlet {
    private final CategoryService categoryService = new CategoryService();
    private final DiscoveryService discoveryService = new DiscoveryService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<CategoryName> categories = categoryService.findAllCategoryNames();
        req.setAttribute("categories", categories);
        req.getRequestDispatcher("/WEB-INF/views/add-discovery.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DiscoverySaveRequest saveRequest = createSaveRequest(req);
        discoveryService.add(saveRequest);
        resp.sendRedirect(req.getContextPath() + "/");
    }

    private DiscoverySaveRequest createSaveRequest(HttpServletRequest req) {
        String loggedUsername = req.getUserPrincipal().getName();
        return new DiscoverySaveRequest(
                req.getParameter("title"),
                req.getParameter("url"),
                req.getParameter("description"),
                Integer.valueOf(req.getParameter("categoryId")),
                loggedUsername
        );
    }
}
