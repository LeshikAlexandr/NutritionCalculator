    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page contentType="text/html;charset=WINDOWS-1251" language="java" %>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update product</title>
    <link rel="stylesheet" href="https://unpkg.com/purecss@2.0.3/build/pure-min.css"  crossorigin="anonymous">
    <style>
        .header {
            padding: 80px;
            text-align: center;
            background: #1abc9c;
            color: white;
        }
        .navbar {
            overflow: hidden;
            background-color: #333;
            position: sticky;
            position: -webkit-sticky;
            top: 0;
        }
        .center{
            /*align-content: center;*/
            /*position: relative;*/
            margin: 0;
            background: white;
            position: absolute;
            top: 50%;
            left: 50%;
            margin-right: -50%;
            transform: translate(-50%, -50%)

        }
        .inputButton {
            position: relative;
            width: 85%;
            height: 50px;
            display: block;
            margin: 30px auto 30px;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            -ms-border-radius: 5px;
            border-radius: 5px;
            color: white;
            background-color: #0d6958;
            border: none;
            -webkit-box-shadow: 0 5px 0 #769f96;
            -moz-box-shadow: 0 5px 0 #082f27;
        }

    </style>
</head>
<body>

<c:import url="../header.jsp"/>

<div class="center">
    <form:form class="pure-form pure-form-aligned" action="/products/new"  modelAttribute="product" method="post">
        <fieldset>
            <div class="pure-control-group">
                <label for="name">Название продукта: </label>
                <form:input path="name" id="name" placeholder="Название продукта"/>
                <form:errors path="name"/>
            </div>
            <p></p>
            <div class="pure-control-group">
                <label for="nominalCalories">Калорийность</label>
                <form:input path="nominalCalories" id="nominalCalories" placeholder="Калорийность"/>
                <form:errors path="nominalCalories"/>
            </div>
            <p></p>

            <div class="pure-control-group">
                <label for="protein">Белки</label>
                <form:input path="protein" id="protein" placeholder="Белки"/>
                <form:errors path="protein"/>
            </div>
            <p></p>

            <div class="pure-control-group">
                <label for="fat">Жиры</label>
                <form:input path="fat" id="fat" placeholder="Жиры"/>
                <form:errors path="fat"/>
            </div>
            <p></p>

            <div class="pure-control-group">
                <label for="carbohydrates">Углеводы </label>
                <form:input path="carbohydrates" id="carbohydrates" placeholder="Углеводы"/>
                <form:errors path="carbohydrates"/>
            </div>
            <p></p>

            <div class="pure-controls">
                <button type="submit" class="pure-button pure-button-primary">Добавить продукт</button>
            </div>
        </fieldset>
    </form:form>
</div>
</body>
</html>