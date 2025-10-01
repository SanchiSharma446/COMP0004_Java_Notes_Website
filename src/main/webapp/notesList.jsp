<%@ page import="java.util.List, java.util.Map, java.util.HashMap, java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
  <link rel="stylesheet" href="./styles.css">
  <title>All Notes</title>
</head>
<body>
<div>

  <form action="searchResults" method="get">
    <input type="text" name="query" placeholder="Search for notes..." required>
    <button type="submit">Search</button>
  </form>

  <a class="btn" href="newnote.html">Add a New Note</a>

  <h2>Notes:</h2>

  <%
    List<Map<String, String>> notes = (List<Map<String, String>>) request.getAttribute("allNotes");

    Map<String, List<Map<String, String>>> groupedNotes = new HashMap<>();

    /* Group notes by their label (only displays note in their first label
    if it has mutliple labels to avoid duplicates. Notes can still be searched for) */
    if (notes != null) {
      for (Map<String, String> note : notes) {
        String label = note.get("label");

        // If no label is present, it'll be indexed under "Other"
        if (label == null || label.isEmpty()) {
          label = "Other";
        } else {
          String[] labels = label.split(",");
          label = labels[0].trim();
        }

        groupedNotes.putIfAbsent(label, new ArrayList<>()); // Makes groups of all the different indexes
        groupedNotes.get(label).add(note);
      }

      // Iterate over the groups and display them under their respective label
      for (Map.Entry<String, List<Map<String, String>>> entry : groupedNotes.entrySet()) {
        String label = entry.getKey();
        List<Map<String, String>> labelNotes = entry.getValue();
  %>

  <h3><%= label %></h3>
  <ul>
    <%
      // Iterate over the notes in this label group
      for (Map<String, String> note : labelNotes) {
        String name = (note.get("name") == null || note.get("name").isEmpty()) ? "Untitled" : note.get("name");
        String desc = note.get("desc");

        String preview = desc;
        if (desc.length() > 91) {
          preview = preview.substring(0, 90) + "...";
        }
    %>

    <li class="note">
      <h4><%= name %></h4>
      <p class="note-description"><%= preview %></p>
      <a href="noteDetail.html?name=<%= name %>">
        <button>Read More</button>
      </a>
      <br><br>
      <a href="deleteNote?name=<%= name %>" onclick="return confirm('Delete this note?');">Delete</a>
    </li>
    <hr>
    <br>

    <%
      }
    %>
  </ul>

  <%
      }

    } else {
  %>
  <p>No notes available.</p>
  <% } %>

</div>
</body>
</html>
