package pl.sudyk.worldnews.client.home;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pl.sudyk.worldnews.domain.api.DiscoveryBasicInfo;
import pl.sudyk.worldnews.domain.api.DiscoveryService;

import java.io.IOException;
import java.util.List;

@WebServlet("")
public class HomeController extends HttpServlet {
    private DiscoveryService discoveryService = new DiscoveryService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<DiscoveryBasicInfo> discoveries = discoveryService.findAll();
        req.setAttribute("discoveries", discoveries);
        req.getRequestDispatcher("/index.jsp").forward(req, resp);
    }
}
