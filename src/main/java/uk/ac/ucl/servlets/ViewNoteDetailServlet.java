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


@WebServlet("/noteDetail.html")
public class ViewNoteDetailServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get the "name" parameter from the query string
        String noteName = request.getParameter("name");

        // Retrieve all notes from the model
        Model model = ModelFactory.getModel();
        List<Map<String, String>> allNotes = model.getAllNotes();

        // Find the note by name
        Map<String, String> noteDetail = null;
        for (Map<String, String> note : allNotes) {
            if (note.get("name").equals(noteName)) {
                noteDetail = note;
                break;
            }
        }

        // If note is found, set it as a request attribute
        if (noteDetail != null) {
            request.setAttribute("noteDetail", noteDetail);
            // Forward the request to the JSP to display the note details
            RequestDispatcher dispatcher = request.getRequestDispatcher("/noteDetail.jsp");
            dispatcher.forward(request, response);
        } else {
            // If no note is found, display an error message
            response.getWriter().println("Note not found!");
        }
    }
}
