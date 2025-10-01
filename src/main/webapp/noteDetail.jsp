<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
  <title>Note Details</title>
  <link rel="stylesheet" href="./styles.css">
  <style>
    p {
      word-wrap: break-word;
      white-space: normal;
      max-width: 100%;
      line-height: 1.5;
    }
  </style>
</head>
<body>
<div>
  <h1>Note Details</h1>

  <%
    Map<String, String> note = (Map<String, String>) request.getAttribute("noteDetail");
    if (note != null) {
      String label = note.get("label") != null ? note.get("label").replace(",", " | ") : "Other";
      String name = note.get("name") != null ? note.get("name") : "Untitled";
      String desc = note.get("desc") != null ? note.get("desc") : "No description available.";
      String img = note.get("img") != null ? note.get("img") : "";
      String url = note.get("url") != null ? note.get("url") : "#";
  %>

  <h2><%= name %></h2>
  <h3>Under: <%= label %></h3>
  <p><%= desc %></p>

  <% if (!img.isEmpty()) { %>
  <img src="<%= img %>" alt="Image for <%= name %>" width="300">
  <br>
  <% } %>

  <% if (!url.equals("#")) { %>
  <a href="<%= url %>" target="_blank"><%= url %></a>
  <br><br>
  <% } %>

  <a class="btn" href="notesList.html">Back to Notes List</a>
  <a class="btn" href="deleteNote?name=<%= name %>" onclick="return confirm('Delete this note?');">Delete</a>
  <a class="btn" href="editNote?name=<%= name %>">Edit</a>

  <%
  } else {
  %>
  <p>Note not found!</p>
  <a class="btn" href="notesList.html">View All Notes</a>
  <%
    }
  %>

</div>
</body>
</html>
