package uk.ac.ucl.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uk.ac.ucl.model.Model;
import uk.ac.ucl.model.ModelFactory;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/newNote")
public class NewNoteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Model model = ModelFactory.getModel();

        // Fetching data from form
        String name = request.getParameter("name");
        String label = request.getParameter("label");
        String desc = request.getParameter("desc");
        String img = request.getParameter("img");
        String url = request.getParameter("url");

        // Making new key-val entries in map
        Map<String, String> newNote = new HashMap<>();
        newNote.put("name", name);
        newNote.put("label", label);
        newNote.put("desc", desc);
        newNote.put("img", img);
        newNote.put("url", url);

        model.addNote(newNote);

        // page should be updaetd
        response.sendRedirect("notesList.html");
    }
}
