<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>New Note</title>
    <link rel="stylesheet" href="./styles.css">
</head>
<body>
<h1>Create a New Note</h1>

<form action="newNote" method="POST">
    <label for="name">Name:</label><br>
    <input type="text" id="name" name="name" value="Untitled" required><br><br>

    <label for="label">Tags (Seperate by comma):</label><br>
    <input type="text" id="label" name="label"><br><br>

    <label for="desc">Description:</label><br>
    <textarea id="desc" name="desc" rows="4" cols="50"></textarea><br><br>

    <label for="img">Image URL:</label><br>
    <input type="text" id="img" name="img"><br><br>

    <label for="url">Link URL:</label><br>
    <input type="text" id="url" name="url"><br><br>

    <button type="submit" class="btn">Save Note</button>
</form>
<br>

<a href="notesList.html" class="btn">Cancel</a>
</body>
</html>
