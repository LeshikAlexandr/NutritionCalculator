<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=WINDOWS-1251" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        .header {
            padding: 80px;
            text-align: center;
            background: #1abc9c;
            color: white;
        }

        .icon_de {
            float: left;
            margin: 0;
        }

        .navbar {
            overflow: hidden;
            background-color: #333;
            position: sticky;
            position: -webkit-sticky;
            top: 0;
        }

        .navbar a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 20px;
            text-decoration: none;
        }


        .navbar a.right {
            float: right;
        }

        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }

        /* Active/current link */
        .navbar a.active {
            background-color: #666;
            color: white;
        }

        .cont {
            text-align: center;
            margin-top: 100px;
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

<div class="navbar">
    <br>
    <br>
</div>

<div class="cont">
    <form action="/products/search" method="get">
        <input type="text" name="name" placeholder="Введите название продукта" style=" width: 300px"/>
        <input type="hidden" value="${eating}" name="eating"/>
        <input type="submit" value="Поиск"/>
    </form>
</div>
<br>

<div class="cont">
    <c:if test="${product != null}">
        <form:form action="/daily-menus/${dailyMenu.id}/products" method="post" modelAttribute="product">

            <form:hidden path="id"/>

            Name:<form:input path="name"/><br>
            Nominal calories:<form:input path="nominalCalories"/><br>
            Protein:<form:input path="protein"/><br>
            Fat:<form:input path="fat"/><br>
            Carbohydrates:<form:input path="carbohydrates"/><br>
            Weight:<form:input path="weight"/><br>
            <input type="hidden" value="${eating}" name="eating" id="eating">
            <button class="submit-button" type="submit">+</button>
        </form:form>
    </c:if>

</div>
</body>
</html>

<%--<div class ="cont" th:each="product: ${products}">
    <form th:method="post" th:object="${product}"  th:action="@{/daily-menus/{id}/products (id=${dailyMenu.id})}" >
        <input type="hidden" th:value="*{id}" name="id"> </input>
        <input th:value="*{name}" name="name" readonly="readonly"> </input>
        <input th:value="*{nominalCalories}" name="calories" readonly="readonly"> </input>
        <input th:value="*{protein}" name="protein" readonly="readonly"> </input>
        <input th:value="*{fat}" name="fat" readonly="readonly"> </input>
        <input th:value="*{carbonhydrates}" name="carbonhydrates" readonly="readonly"> </input>
        <input th:value="*{weight}" name="weight" required="required"> </input>
        <input type="hidden" th:value="${eating}" name="eating" id="eating"> </input>
        <button class="submit-button" type="submit">+</button>
    </form>
</div>--%>