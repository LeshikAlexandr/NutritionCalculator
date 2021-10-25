<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=WINDOWS-1251" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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

<form:form class="pure-form pure-form-aligned" action="/customers/update/${customer.id}" modelAttribute="customer"
           method="post">
    <fieldset>
        <div class="pure-control-group">
            <label for="height"><spring:message code="height"/></label>
            <form:input path="height" id="height" placeholder="Название продукта"/>
            <form:errors path="height"/>
        </div>
        <p></p>

        <div class="pure-control-group">
            <label for="weight"><spring:message code="weight"/></label>
            <form:input path="weight" id="weight" placeholder="Название продукта"/>
            <form:errors path="weight"/>
        </div>
        <p></p>

        <div class="pure-control-group">
            <label for="age"><spring:message code="age"/></label>
            <form:input path="age" id="age" placeholder="Название продукта"/>
            <form:errors path="age"/>
        </div>
        <p></p>

        <div>
            <p><spring:message code="sex"/></p>
            <p><input name="sex" type="radio" value="MALE"> <spring:message code="male"/></p>
            <p><input name="sex" type="radio" value="FEMALE"> <spring:message code="female"/></p>
        </div>

        <div id="centerrLayer">
            <p><spring:message code="activity"/></p>
            <p><input name="activity" type="radio" value="LOW"> <spring:message code="activity_low"/></p>
            <p><input name="activity" type="radio" value="MEDIUM"> <spring:message code="activity_medium"/></p>
            <p><input name="activity" type="radio" value="HIGH"> <spring:message code="activity_high"/></p>
        </div>

        <div class="pure-controls">
            <button type="submit" class="pure-button pure-button-primary"><spring:message code="save"/></button>
        </div>
    </fieldset>
</form:form>
</body>
</html>