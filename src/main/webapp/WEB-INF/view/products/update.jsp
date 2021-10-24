<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=WINDOWS-1251" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>New product</title>
    <link rel="stylesheet" href="https://unpkg.com/purecss@2.0.3/build/pure-min.css" crossorigin="anonymous">
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
    </style>
</head>
<body>

<c:import url="../header.jsp"/>

<form:form class="pure-form pure-form-aligned" action="/products/update/${product.id}" modelAttribute="product"
           method="post">
    <fieldset>
        <div class="pure-control-group">
            <label for="name">�������� ��������: </label>
            <form:input path="name" id="name" placeholder="�������� ��������"/>
            <form:errors path="name"/>
        </div>
        <p></p>
        <div class="pure-control-group">
            <label for="nominalCalories">������������</label>
            <form:input path="nominalCalories" id="nominalCalories" placeholder="������������"/>
            <form:errors path="nominalCalories"/>
        </div>
        <p></p>

        <div class="pure-control-group">
            <label for="protein">�����</label>
            <form:input path="protein" id="protein" placeholder="�����"/>
            <form:errors path="protein"/>
        </div>
        <p></p>

        <div class="pure-control-group">
            <label for="fat">����</label>
            <form:input path="fat" id="fat" placeholder="����"/>
            <form:errors path="fat"/>
        </div>
        <p></p>

        <div class="pure-control-group">
            <label for="carbohydrates">�������� </label>
            <form:input path="carbohydrates" id="carbohydrates" placeholder="��������"/>
            <form:errors path="carbohydrates"/>
        </div>
        <p></p>

        <div class="pure-controls">
            <button type="submit" class="pure-button pure-button-primary">������������� �������</button>
        </div>

    </fieldset>
</form:form>
</body>
</html>