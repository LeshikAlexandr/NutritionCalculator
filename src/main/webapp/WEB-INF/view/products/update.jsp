<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=WINDOWS-1251" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update product</title>
    <link rel="stylesheet" href="https://unpkg.com/purecss@2.0.3/build/pure-min.css" crossorigin="anonymous">
    <style>
        .center {
            margin: 0;
            background: white;
            position: absolute;
            top: 50%;
            left: 50%;
            margin-right: -50%;
            transform: translate(-50%, -50%)
        }
    </style>
</head>
<body>

<c:import url="../header.jsp"/>

<div class="center">
    <form:form class="pure-form pure-form-aligned" action="/products/update/${product.id}" modelAttribute="product"
               method="post">
        <fieldset>
            <div class="pure-control-group">
                <label for="name"><spring:message code="products_name"/>: </label>
                <form:input path="name" id="name" placeholder="�������� ��������"/>
                <form:errors path="name"/>
            </div>
            <p></p>
            <div class="pure-control-group">
                <label for="nominalCalories"><spring:message code="calories"/>: </label>
                <form:input path="nominalCalories" id="nominalCalories" placeholder="������������"/>
                <form:errors path="nominalCalories"/>
            </div>
            <p></p>

            <div class="pure-control-group">
                <label for="protein"><spring:message code="proteins"/>: </label>
                <form:input path="protein" id="protein" placeholder="�����"/>
                <form:errors path="protein"/>
            </div>
            <p></p>

            <div class="pure-control-group">
                <label for="fat"><spring:message code="fats"/>: </label>
                <form:input path="fat" id="fat" placeholder="����"/>
                <form:errors path="fat"/>
            </div>
            <p></p>

            <div class="pure-control-group">
                <label for="carbohydrates"><spring:message code="carbohydrates"/>: </label>
                <form:input path="carbohydrates" id="carbohydrates" placeholder="��������"/>
                <form:errors path="carbohydrates"/>
            </div>

            <div class="pure-controls">
                <button type="submit" class="pure-button pure-button-primary">������������� �������</button>
            </div>
        </fieldset>
    </form:form>
</div>
</body>
</html>