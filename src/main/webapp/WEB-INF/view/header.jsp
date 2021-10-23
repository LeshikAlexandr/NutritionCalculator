<%@ page contentType="text/html;charset=WINDOWS-1251" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!doctype html>
<html>
<head>

    <%--    <title>Блог | Blog Template for Bootstrap (BS 4.0)</title>--%>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <style>
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
        <h1>Nutrition calculator</h1>
    </div>
    <%--<div class="icon_de">
        <p align="left"><a th:href="@{/profile?lang=en}"><img src="/images/united_kingdom_glossy_square_icon_64.png"
                                                              width="48" height="40"></a></p>
    </div>

    <div class="icon_de">
        <p align="left"><a th:href="@{/profile?lang=ru}"><img src="/images/russia_glossy_square_icon_64.png" width="48"
                                                              height="40"></a></p>
    </div>--%>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="/">Главная страница</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/customers/profile">Мой профиль</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/daily-menus">Меню дня</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/food-diaries">Дневник питания</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/products">Продукты</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/products"><spring:message code="app.nav.home"/></a>
                </li>
            </ul>
            <form class="d-flex" action="/login" method="get">
                <button class="btn btn-outline-light" type="submit">Войти</button>
            </form>
        </div>
    </div>
</nav>
</body>
</html>