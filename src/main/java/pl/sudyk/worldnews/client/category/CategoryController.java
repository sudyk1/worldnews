package pl.sudyk.worldnews.client.category;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pl.sudyk.worldnews.domain.api.CategoryFullInfo;
import pl.sudyk.worldnews.domain.api.CategoryService;
import pl.sudyk.worldnews.domain.api.DiscoveryBasicInfo;
import pl.sudyk.worldnews.domain.api.DiscoveryService;

import java.io.IOException;
import java.util.List;

@WebServlet("/category")
public class CategoryController extends HttpServlet {
    private final CategoryService categoryService = new CategoryService();
    private final DiscoveryService discoveryService = new DiscoveryService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int categoryId = Integer.parseInt(req.getParameter("id"));
        CategoryFullInfo category = categoryService.findById(categoryId)
                .orElseThrow();
        req.setAttribute("category", category);
        List<DiscoveryBasicInfo> discoveries = discoveryService.findAllByCategory(categoryId);
        req.setAttribute("discoveries", discoveries);
        req.getRequestDispatcher("/WEB-INF/views/category.jsp").forward(req, resp);

    }
}
