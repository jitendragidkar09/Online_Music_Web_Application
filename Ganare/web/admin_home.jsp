<%-- 
    Document   : admin_home
    Created on : 16-Jan-2024, 9:32:07 am
    Author     : hp
--%>

<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        <link href="styles/admin_home.css" rel="stylesheet" type="text/css"/>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Jost&display=swap');
        </style>



    </head>
    <body>



        <div class="sidebar">

            <img src="images/web_images/logoGanare.png" alt="logo" style="width: 80%;  margin-left: 0%; padding-top: 5%; margin-bottom: 30px;">
            <p style=" font-size: 10px; margin-top: -25px;"> Where Melodies Reflect The Soul </p>

            <a class="tablinks" onclick="openFunc(event, 'welcome')" id="defaultOpen"></a>
            <a class="tablinks" onclick="openFunc(event, 'addSongs')" >Add New Songs</a>
            <a class="tablinks" onclick="openFunc(event, 'viewSongs')">View Songs</a>
            <a class="tablinks" onclick="openFunc(event, 'editSongs')">Edit Songs</a>
            <a class="tablinks" onclick="openFunc(event, 'deleteSongs')">Delete Songs</a>

            <a class="tablinks" onclick="openFunc(event, 'noName')">No Name</a>
            <a class="tablinks" onclick="openFunc(event, 'noName')">No Name</a>
            <a class="tablinks" onclick="openFunc(event, 'noName')">No Name</a>
            <a class="tablinks" onclick="openFunc(event, 'noName')">No Name</a>
            
            <%
            try {
                session = request.getSession(false);

                String name = (String) session.getAttribute("name");
                String email = (String) session.getAttribute("email");

                if (email != null) {
                    System.out.println("Welcome to Home");
                } else {
                    RequestDispatcher rd = request.getRequestDispatcher("admin_login.html");
                    rd.include(request, response);
                    out.println("<script>loginFirst();</script>");
                }
            } catch (Exception e) {

                RequestDispatcher rd = request.getRequestDispatcher("admin_login.html");
                rd.include(request, response);
                out.println("<script>loginFirst();</script>");

            }
        %>

            <div class="logout-button" >
                <form action="Admin_Logout">
                    <input type="submit" value="Logout"> 
                </form>
            </div>

        </div>


        <div id="welcome" class="tabcontent">
            <div class="content" id="contentArea">
                <h1 style=" text-align: center; margin-top: 23%;"> We're glad to have you on the admin page.<br> Manage your tasks and settings with ease. <h1>
                        </div>
                        </div>


                        <div id="addSongs" class="tabcontent">

                            <div  class="container">
                                <h2  style="text-align: center; width: 100%;">Add Song</h2>
                                <form  action="UpdateSongInfo"  method="post" >

                                    <label for="songName">Song Name</label>
                                    <input type="text" id="songName" name="songName" required>

                                    <label for="singerName">Singer Name</label>
                                    <input type="text" id="singerName" name="singerName" required>

                                    <label for="lang-select">Select Language:</label>
                                    <select name="lang" id="lang-select">
                                        <option>Select Language</option>
                                        <option value="English">English</option>
                                        <option value="Hindi">Hindi</option>
                                        <option value="Punjabi">Punjabi</option>
                                        <option value="Bhojpuri">Bhojpuri</option>
                                    </select>

                                    <label for="year">Release Year</label>
                                    <input type="number" id="year" name="year" required>

                                    <label for="albumName">Album Name</label>
                                    <input type="text" id="albumName" name="albumName" required>

                                    <button type="submit">Add Song</button>
                                </form>
                            </div>



                        </div>

                        <div id="viewSongs" class="tabcontent">

                            <%       try {
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                    Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gana_bajao", "shailesh", "");
                                    Statement smt = cn.createStatement();
                                    ResultSet rs = smt.executeQuery("select * from song");
                                    out.println("<table border='2' align='center'>");
                                    out.println("<caption><h2>Song Dekho</h2></caption>");
                                    out.println("<tr><th>SongId</th><th>Song Name</th><th>Singer Name</th><th>Language</th><th>Release Year</th><th>Album Name</th><th>Image File Name</th><th>Audio File Name</th></tr>");
                                    while (rs.next()) {
                                        String songId = rs.getString(1);
                                        String songName = rs.getString(2);
                                        String singerName = rs.getString(3);
                                        String lang = rs.getString(4);
                                        String year = rs.getString(5);
                                        String album = rs.getString(6);
                                        String imageFileName = rs.getString(7);
                                        String audioFileName = rs.getString(8);

                                        out.println("<tr>");
                                        out.println("<td>" + songId + "</td>");
                                        out.println("<td>" + songName + "</td>");
                                        out.println("<td>" + singerName + "</td>");
                                        out.println("<td>" + lang + "</td>");
                                        out.println("<td>" + year + "</td>");
                                        out.println("<td>" + album + "</td>");
                                        out.println("<td>" + imageFileName + "</td>");
                                        out.println("<td>" + audioFileName + "</td>");
                                        out.println("</tr>");
                                    }
                                    out.println("</table>");
                                    cn.close();
                                } catch (Exception e) {
                                    out.println(e.getMessage());
                                }

                            %>



                        </div>


                        <div id="editSongs" class="tabcontent">

                            <%       try {
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                    Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gana_bajao", "shailesh", "");
                                    Statement smt = cn.createStatement();
                                    ResultSet rs = smt.executeQuery("select * from song");
                                    out.println("<table border='2' align='center'>");
                                    out.println("<caption><h2>Edit Songs</h2></caption>");
                                    out.println("<tr><th>SongId</th><th>Song Name</th><th>Singer Name</th><th>Language</th><th>Release Year</th><th>Album Name</th><th>Image File Name</th><th>Audio File Name</th><th>Edit</th></tr>");
                                    while (rs.next()) {
                                        String songId = rs.getString(1);
                                        String songName = rs.getString(2);
                                        String singerName = rs.getString(3);
                                        String lang = rs.getString(4);
                                        String year = rs.getString(5);
                                        String album = rs.getString(6);
                                        String imageFileName = rs.getString(7);
                                        String audioFileName = rs.getString(8);

                                        out.println("<tr>");
                                        out.println("<td>" + songId + "</td>");
                                        out.println("<td>" + songName + "</td>");
                                        out.println("<td>" + singerName + "</td>");
                                        out.println("<td>" + lang + "</td>");
                                        out.println("<td>" + year + "</td>");
                                        out.println("<td>" + album + "</td>");
                                        out.println("<td>" + imageFileName + "</td>");
                                        out.println("<td>" + audioFileName + "</td>");
                                        out.println("<td><a href='edit_data.jsp?id=" + songId + "'><img src='images/buttons/pen.png' width='20' height='20' ></a></td>");
                                        out.println("</tr>");
                                    }
                                    out.println("</table>");
                                    cn.close();
                                } catch (Exception e) {
                                    out.println(e.getMessage());
                                }

                            %>           



                        </div>

                        <div id="deleteSongs" class="tabcontent">

                            <%       try {
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                    Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gana_bajao", "shailesh", "");
                                    Statement smt = cn.createStatement();
                                    ResultSet rs = smt.executeQuery("select * from song");
                                    out.println("<table border='2' align='center'>");
                                    out.println("<caption><h2>Delete Songs</h2></caption>");
                                    out.println("<tr><th>SongId</th><th>Song Name</th><th>Singer Name</th><th>Language</th><th>Release Year</th><th>Album Name</th><th>Image File Name</th><th>Audio File Name</th><th>Delete</th></tr>");
                                    while (rs.next()) {
                                        String songId = rs.getString(1);
                                        String songName = rs.getString(2);
                                        String singerName = rs.getString(3);
                                        String lang = rs.getString(4);
                                        String year = rs.getString(5);
                                        String album = rs.getString(6);
                                        String imageFileName = rs.getString(7);
                                        String audioFileName = rs.getString(8);

                                        out.println("<tr>");
                                        out.println("<td>" + songId + "</td>");
                                        out.println("<td>" + songName + "</td>");
                                        out.println("<td>" + singerName + "</td>");
                                        out.println("<td>" + lang + "</td>");
                                        out.println("<td>" + year + "</td>");
                                        out.println("<td>" + album + "</td>");
                                        out.println("<td>" + imageFileName + "</td>");
                                        out.println("<td>" + audioFileName + "</td>");
                                        out.println("<td><a href='Delete_Songs?id=" + songId + "'><img src='images/buttons/delete.png' width='20' height='20'></a></td>");
                                        out.println("</tr>");
                                    }
                                    out.println("</table>");
                                    cn.close();
                                } catch (Exception e) {
                                    out.println(e.getMessage());
                                }

                            %> 


                        </div>

                        <div id="noName" class="tabcontent">

                        </div>

                        <div id="noName" class="tabcontent">

                        </div>

                        <div id="noName" class="tabcontent">

                        </div>


                        <script>
                            function openFunc(evt, Feature) {
                                var i, tabcontent, tablinks;
                                tabcontent = document.getElementsByClassName("tabcontent");
                                for (i = 0; i < tabcontent.length; i++) {
                                    tabcontent[i].style.display = "none";
                                }
                                tablinks = document.getElementsByClassName("tablinks");
                                for (i = 0; i < tablinks.length; i++) {
                                    tablinks[i].className = tablinks[i].className.replace(" active", "");
                                }
                                document.getElementById(Feature).style.display = "block";
                                evt.currentTarget.className += " active";
                            }


                            document.getElementById("defaultOpen").click();
                        </script>




                        </body>
                        </html>
