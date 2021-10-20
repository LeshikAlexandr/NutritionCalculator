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

        /* Header/logo Title */
        .header {
            padding: 80px;
            text-align: center;
            background: #1abc9c;
            color: white;
        }

        /* Increase the font size of the heading */
        .header h1 {
            font-size: 40px;
        }

        /* Sticky navbar - toggles between relative and fixed, depending on the scroll position. It is positioned relative until a given offset position is met in the viewport - then it "sticks" in place (like position:fixed). The sticky value is not supported in IE or Edge 15 and earlier versions. However, for these versions the navbar will inherit default position */
        .nnavbar {
            overflow: hidden;
            background-color: #333;
            position: sticky;
            position: -webkit-sticky;
            top: 0;
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


        /* Main column */
        .main {
            -ms-flex: 70%; /* IE10 */
            flex: 70%;
            background-color: white;
            padding: 20px;
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

        /* Right column */
        .rightcolumn {
            float: left;
            width: 25%;
            padding-left: 20px;
        }

        /* Fake image */
        .fakeimg {
            background-color: #aaa;
            width: 100%;
            padding: 20px;
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

        /* Footer */
        .footer {
            padding: 20px;
            text-align: center;
            background: #ddd;
            margin-top: 20px;
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

<div class="header">
    <h1>MyFit</h1>
    <p>Мотивирующая фраза</p>
    <div class="icon_de">
        <p align="left"><a th:href="@{/profile?lang=en}"><img src="/images/united_kingdom_glossy_square_icon_64.png"
                                                              width="48" height="40"></a></p>
    </div>

    <div class="icon_de">
        <p align="left"><a th:href="@{/profile?lang=ru}"><img src="/images/russia_glossy_square_icon_64.png" width="48"
                                                              height="40"></a></p>
    </div>
</div>

<div class="nnavbar">
    <a href="#" class="active">Главная страница</a>
    <a href="/customers/profile">Мой профиль</a>
    <a href="/daily-menus">Меню дня</a>
    <a href="/food-diaries">Дневник питания</a>
    <a href="/products">Продукты</a>
    <%--    <p if="${customer== null}"><a th:href="@{/registration}" class="right" th:text="#{registration}"></a></p>--%>
    <%--    <p if="${customer!= null}"  ><a th:href="@{/logout}" class="right" th:text="#{logout}"></a></p>--%>
    <a href="/login" class="right">Войти</a>
</div>

<div class="row">
    <h1>Посты</h1>
    <div>
        <div class="center">
            <form action="posts/new" method="get">
                <button type="submit" class="btn btn-outline-success"><p>Добавить пост</p></button>
            </form>
        </div>
    </div>
    <div class="leftcolumn">
        <c:forEach var="post" items="${posts}">
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
                        <img src="${comment.photo.url}" width="350" height="350"/>
                        ${comment.customer.login}: ${comment.text}
                    <br>
                </div>
            </c:forEach>

            <form action="posts/newComment/${post.id}" enctype="multipart/form-data" modelAttribute="comment"
                  method="post">
                Комментарий <input name="text"/>
                <form:errors path="text"/>
                <br><br>
                Фото комментария <input type="file" name="file"/>
                <br><br>
                <input type="submit" value="Комментировать">
            </form>
            <div class="center">
                <form:form action="/posts/delete/${post.id}" method="post">
                    <button type="submit" class="btn btn-outline-success">Удалить пост</button>
                </form:form>
            </div>
            </c:forEach>
        </div>
    </div>
    <div class="leftcolumn">
        <c:set var="n" value="${customer.login}"/>
        <c:forEach var="someCustomer" items="${customers}">
            <c:set var="t" value="${someCustomer.login}"/>
            <c:if test="${!(t eq n)}">
                <h3>${someCustomer.login}</h3>
            </c:if>
        </c:forEach>
    </div>
</div>
</body>
</html>
