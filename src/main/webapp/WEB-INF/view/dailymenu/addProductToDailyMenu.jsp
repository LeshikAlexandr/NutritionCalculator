<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=WINDOWS-1251" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add product</title>
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

<c:import url="../header.jsp"/>

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

            Name: <form:textarea rows="1" path="name" readonly="true"   /><br>
            Nominal calories <form:textarea rows="1" path="nominalCalories" readonly="true"/><br>
            Protein: <form:textarea rows="1" path="protein" readonly="true"/><br>
            Fat: <form:textarea rows="1" path="fat" readonly="true"/><br>
            Carbohydrates: <form:textarea rows="1" path="carbohydrates" readonly="true"/><br>
            Weight: <form:input path="weight"/><br>
            <form:errors path="weight"/>
            <input type="hidden" value="${eating}" name="eating" id="eating">
            <button class="submit-button" type="submit">+</button>
        </form:form>
    </c:if>

</div>
</body>
</html>