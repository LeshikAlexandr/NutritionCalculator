<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=WINDOWS-1251" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <title>Page Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>

        .icon_de {
            float: left;
            margin: 0;
        }

        * {
            box-sizing: border-box;
        }

        /* Style the body */
        body {
            font-family: Arial, Helvetica, sans-serif;
            margin: 0;
        }

        /* Increase the font size of the heading */
        .header h1 {
            font-size: 40px;
        }


        /* Style the navigation bar links */
        .nnavbar a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 20px;
            text-decoration: none;
        }


        /* Right-aligned link */
        .nnavbar a.right {
            float: right;
        }

        /* Change color on hover */
        .nnavbar a:hover {
            background-color: #ddd;
            color: black;
        }

        /* Active/current link */
        .nnavbar a.active {
            background-color: #666;
            color: white;
        }

        Column container
        .row {
            display: -ms-flexbox; /* IE10 */
            display: flex;
            -ms-flex-wrap: wrap; /* IE10 */
            flex-wrap: wrap;
        }

        body {
            font-family: Arial;
            padding: 20px;
            background: #f1f1f1;
        }

        /* Create two unequal columns that floats next to each other */
        /* Left column */
        .leftcolumn {
            float: left;
            /*width: 7%;*/
        }

        /* Add a card effect for articles */
        .card {
            background-color: white;
            padding: 50px;
            margin-top: 30px;
        }

        /* Clear floats after the columns */
        .row:after {
            content: "";
            display: table;
            clear: both;
        }

        /* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other */
        @media screen and (max-width: 800px) {
            .leftcolumn, .rightcolumn {
                width: 100%;
                padding: 0;
            }
        }
    </style>

</head>
<body>

<c:import url="../header.jsp"/>

<div class="row">
    <h1>�����</h1>
    <div class="leftcolumn">
        <c:forEach var="post" items="${allFollowersPosts}">
        <div class="list-group">
            <h3>${post.customer.login}</h3>
            <h4>${post.createdDate}</h4>
            <p>${post.text}</p>
            <c:if test="${post.photo != null}">
                <div style="height:300px; align-content: center">
                    <img src="${post.photo.url}" width="350" height="350"/>
                </div>
            </c:if>
            <c:forEach var="comment" items="${post.comments}">
                <div class="card">
                        ${comment.customer.login}: ${comment.text}
                    <br>
                </div>
            </c:forEach>

            <form action="posts/newComment/${post.id}" enctype="multipart/form-data" modelAttribute="comment"
                  method="post">
                ����������� <input name="text"/>
                <form:errors path="text"/>
                <br><br>
                ���� ����������� <input type="file" name="file"/>
                <br><br>
                <input type="submit" value="��������������">
            </form>
            </c:forEach>
        </div>
    </div>
</div>
</body>
</html>