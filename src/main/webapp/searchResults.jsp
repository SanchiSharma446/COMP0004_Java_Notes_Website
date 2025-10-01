<%@ page import="java.util.List, java.util.Map, java.util.HashMap, java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head><link rel="stylesheet" href="./styles.css"></head>
<body>
<div>
  <a class="btn" href="newnote.html">Add a new note</a>
  <h2>Search Results:</h2>

  <%
    List<Map<String, String>> notes = (List<Map<String, String>>) request.getAttribute("searchResults");

    if (notes != null && !notes.isEmpty()) {

      // groups note via the labels they have
      Map<String, List<Map<String, String>>> groupedNotes = new HashMap<>();

      for (Map<String, String> note : notes) {
        String labels = note.get("label");

        if (labels == null || labels.isEmpty()) {
          labels = "Other"; // if no label exists, gives "Other" as label
        }

        String[] labelArray = labels.split(",");

        for (String label : labelArray) {
          label = label.trim();

          groupedNotes.putIfAbsent(label, new ArrayList<>());
          groupedNotes.get(label).add(note);
        }
      }

      // Display notes grouped by label
      for (Map.Entry<String, List<Map<String, String>>> entry : groupedNotes.entrySet()) {
        String label = entry.getKey();
        List<Map<String, String>> labelNotes = entry.getValue();
  %>

  <h3><%= label %></h3>
  <ul>
    <%
      for (Map<String, String> note : labelNotes) {
        String name = note.get("name");
        String desc = note.get("desc");

        // Handle long descriptions by shortening them
        String preview = desc.length() > 90 ? desc.substring(0, 90) + "..." : desc;
    %>

    <li class="note">
      <h4><%= name %></h4>
      <p><%= preview %></p>
      <a href="noteDetail.html?name=<%= name %>">
        <button>Read More</button>
      </a>
      <br>
      <a href="deleteNote?name=<%= name %>" onclick="return confirm('Delete this note?');">Delete</a>
    </li>
    <hr>

    <%
      }
    %>
  </ul>

  <%
    }
  } else {
  %>
  <p>No results found for your search.</p>
  <a class="btn" href="notesList.html">View All Notes</a>
  <% } %>

  <a class="btn" href="notesList.html">View All Notes</a>
</div>
</body>
</html>
