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

@WebServlet("/saveNote")
public class SaveNoteServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Model model = ModelFactory.getModel();

        // Gets new data from form + old name to locate the note to be changed
        String oldName = request.getParameter("oldName");
        String name = request.getParameter("name");
        String label = request.getParameter("label");
        String newDesc = request.getParameter("desc");
        String newImg = request.getParameter("img");
        String newUrl = request.getParameter("url");

        model.updateNote(oldName, name, label, newDesc, newImg, newUrl);

        response.sendRedirect("notesList.html");
    }
}
