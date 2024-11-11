package pl.sudyk.worldnews.client.vote;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.HttpMethodConstraint;
import jakarta.servlet.annotation.ServletSecurity;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pl.sudyk.worldnews.domain.api.DiscoveryVote;
import pl.sudyk.worldnews.domain.api.DiscoveryVoteService;

import java.io.IOException;

@WebServlet("/discovery/vote")
@ServletSecurity(
        httpMethodConstraints = {
                @HttpMethodConstraint(value = "GET", rolesAllowed = "USER")
        }
)
public class DiscoveryVoteController extends HttpServlet {
    private DiscoveryVoteService voteService = new DiscoveryVoteService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DiscoveryVote discoveryVote = createDiscoveryVote(req);
        voteService.addVote(discoveryVote);
        resp.sendRedirect(req.getContextPath() + "/");
    }

    private DiscoveryVote createDiscoveryVote(HttpServletRequest req) {
        Integer discoveryId = Integer.valueOf(req.getParameter("id"));
        String voteType = req.getParameter("type");
        String username = req.getUserPrincipal().getName();
        DiscoveryVote discoveryVote = new DiscoveryVote(username, discoveryId, voteType);
        return discoveryVote;
    }
}
