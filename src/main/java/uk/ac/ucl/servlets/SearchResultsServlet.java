package uk.ac.ucl.servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uk.ac.ucl.model.Model;
import uk.ac.ucl.model.ModelFactory;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@WebServlet("/searchResults")
public class SearchResultsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Model model = ModelFactory.getModel();

        String query = request.getParameter("query").toLowerCase(); // gets user search val
        List<Map<String, String>> notes = model.getAllNotes(); // then gets all current notes

        // Filter notes based on name or description containing the search query
        List<Map<String, String>> filteredNotes = notes.stream()
                .filter(note -> note.get("name").toLowerCase().contains(query) || note.get("desc").toLowerCase().contains(query) || note.get("label").toLowerCase().contains(query))
                .collect(Collectors.toList());

        request.setAttribute("searchResults", filteredNotes);

        ServletContext context = getServletContext();
        RequestDispatcher dispatch = context.getRequestDispatcher("/searchResults.jsp");
        dispatch.forward(request, response);
    }
}
