
<%@ page import="jakarta.servlet.http.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String artist = request.getParameter("artist");
    String firstName = null;
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie c : cookies) {
            if ("firstName".equals(c.getName())) {
                firstName = c.getValue();
            }
        }
    }
    if (firstName == null) {
        response.sendRedirect("register.jsp?artist=" + artist);
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Murach's Java Servlets and JSP</title>
    <link rel="stylesheet" href="styles/main.css">
</head>
<body>
<h2><%= artist %> - Songs</h2>
<table>
    <tr><th>Song</th><th>Play</th></tr>
    <% if ("Hòa Minzy".equals(artist)) { %>
    <tr>
        <td>Thư chưa gửi anh</td>
        <td><audio controls><source src="music/TCGAHMZ.mp3" type="audio/mpeg"></audio></td>
    </tr>
    <tr>
        <td>Hãy để con lo</td>
        <td><audio controls><source src="music/HDCLHMZ.mp3" type="audio/mpeg"></audio></td>
    </tr>

    <% } else if ("Khởi My".equals(artist)) { %>
    <tr>
        <td>Khóc đêm</td>
        <td><audio controls><source src="music/KDKM.mp3" type="audio/mpeg"></audio></td>
    </tr>
    <tr>
        <td>Lâu rồi</td>
        <td><audio controls><source src="music/LRKM.mp3" type="audio/mpeg"></audio></td>
    </tr>

    <% } %>


</table>

<form action="cookies.jsp" method="post">
    <input type="submit" value="View Cookies">
</form>
<form action="index.jsp" method="get">
    <input type="submit" value="View Albums">
</form>
</body>
</html>
