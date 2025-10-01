<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
  <title>Edit Note</title>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/styles.css">
</head>
<body>
<h1>Edit Note</h1>

<%
  // Retrieve all teh note details from the request
  Map<String, String> note = (Map<String, String>) request.getAttribute("note");

  if (note != null) {
    String oldName = note.get("name");
    String name = note.get("name");
    String label = note.get("label");
    String desc = note.get("desc");
    String img = note.get("img");
    String url = note.get("url");
%>

<form action="saveNote" method="POST">
  <%-- Change hidden input name to oldName so there is no conflict --%>
  <%--@declare id="name"--%><%--@declare id="desc"--%><%--@declare id="label"--%><%--@declare id="img"--%><%--@declare id="url"--%><input type="hidden" name="oldName" value="<%=oldName%>">  <!-- Hidden field for old name -->

  <label for="name">Name:</label><br>
    <label>
      <input type="text" name="name" value="<%=name%>">
    </label><br><br>

  <label for="label">Tags (Seperate by comma):</label><br>
  <input type="text" name="label" value="<%=label%>"><br><br>

  <label for="desc">Description:</label><br>
  <textarea name="desc" rows="4" cols="50"><%=desc%></textarea><br><br>

  <label for="img">Image URL:</label><br>
  <input type="text" name="img" value="<%=img%>"><br><br>

  <label for="url">URL:</label><br>
  <input type="text" name="url" value="<%=url%>"><br><br>

  <input type="submit" value="Save Changes" class="btn">
</form>


<%
} else {
%>
<p>Error! Note not found!</p>
<%
  }
%>

<br>
<a href="notesList.html" class="btn">Back to Notes List</a>
</body>
</html>
