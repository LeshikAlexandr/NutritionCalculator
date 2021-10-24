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

<form:form class="pure-form pure-form-aligned" action="/customers/edit/${customer.id}" modelAttribute="customer"
           method="post">
    <fieldset>
        <div class="pure-control-group">
            <label for="height">����</label>
            <form:input path="height" id="height" placeholder="�������� ��������"/>
            <form:errors path="height"/>
        </div>
        <p></p>

        <div class="pure-control-group">
            <label for="weight">���</label>
            <form:input path="weight" id="weight" placeholder="�������� ��������"/>
            <form:errors path="weight"/>
        </div>
        <p></p>

        <div class="pure-control-group">
            <label for="age">�������</label>
            <form:input path="age" id="age" placeholder="�������� ��������"/>
            <form:errors path="age"/>
        </div>
        <p></p>

        <div>
            <p>���:</p>
            <p><input name="sex" type="radio" value="MALE"> �������</p>
            <p><input name="sex" type="radio" value="FEMALE"> �������</p>
        </div>

        <div id="centerrLayer">
            <p>����������</p>
            <p><input name="activity" type="radio" value="LOW"> ������ (������� ����� �����, ������ � �����)</p>
            <p><input name="activity" type="radio" value="MEDIUM"> ������� (1-3 ���������� � ������)</p>
            <p><input name="activity" type="radio" value="HIGH"> ������� (3 � ����� ���������� � ������)</p>
        </div>

        <div class="pure-controls">
            <button type="submit" class="pure-button pure-button-primary">������������� ������������</button>
        </div>

    </fieldset>
</form:form>
</body>
</html>