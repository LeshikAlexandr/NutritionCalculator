<%@ page contentType="text/html;charset=WINDOWS-1251" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!doctype html>
<html>
<head>

    <%--    <title>Блог | Blog Template for Bootstrap (BS 4.0)</title>--%>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <style>

        .icon_de {
            float: left;
            margin: 0;
        }

        * {
            box-sizing: border-box;
        }

        .header {
            padding: 80px;
            text-align: center;
            background: #082f27;
            color: white;
        }
    </style>
</head>

<body>
<div class="header">
    <div class="text-center">
        <h1><spring:message code="app.title"/></h1>
    </div>
    <div class="icon_de">
        <p align="left"><a href="?lang=en"><img src="/images/locale/EN.jpg" width="48"
                                                height="40"></a></p>
    </div>

    <div class="icon_de">
        <p align="left"><a href="?lang=ru"><img src="/images/locale/RU.png" width="48"
                                                height="40"></a></p>
    </div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="/"><spring:message code="main_page"/></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/customers/profile"><spring:message code="profile"/></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/daily-menus"><spring:message code="food_diary"/></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/food-diaries"><spring:message code="journal"/></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/products"><spring:message code="products"/></a>
                </li>
            </ul>
            <sec:authorize access="!isAuthenticated()">
            <form class="d-flex" action="/login" method="get">
                <button class="btn btn-outline-light" type="submit"><spring:message code="authorization"/></button>
            </form>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
                <form class="d-flex" action="/logout" method="get">
                    <button class="btn btn-outline-light" type="submit"><spring:message code="logout"/></button>
                </form>
            </sec:authorize>
            <sec:authorize access="!isAuthenticated()">
            <form class="d-flex" action="/registration" method="get">
                <button class="btn btn-outline-light" type="submit"><spring:message code="registration"/></button>
            </form>
            </sec:authorize>
        </div>
    </div>
</nav>
</body>
</html>