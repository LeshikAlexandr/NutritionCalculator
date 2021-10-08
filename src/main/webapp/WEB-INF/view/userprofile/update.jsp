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
<form:form class="pure-form pure-form-aligned" action="/customers/edit/${customer.id}" modelAttribute="customer"
           method="post">
    <fieldset>
        <div class="pure-control-group">
            <label for="height">Рост</label>
            <form:input path="height" id="height" placeholder="Название продукта"/>
            <form:errors path="height"/>
        </div>
        <p></p>

        <div class="pure-control-group">
            <label for="weight">Вес</label>
            <form:input path="weight" id="weight" placeholder="Название продукта"/>
            <form:errors path="weight"/>
        </div>
        <p></p>

        <div class="pure-control-group">
            <label for="age">Возраст</label>
            <form:input path="age" id="age" placeholder="Название продукта"/>
            <form:errors path="age"/>
        </div>
        <p></p>

        <div>
            <p>Пол:</p>
            <p><input name="sex" type="radio" value="MALE"> Мужской</p>
            <p><input name="sex" type="radio" value="FEMALE"> Женский</p>
        </div>

        <div id="centerrLayer">
            <p>Активность</p>
            <p><input name="activity" type="radio" value="LOW"> Низкая (сидячий образ жизни, работа в офисе)</p>
            <p><input name="activity" type="radio" value="MEDIUM"> Средняя (1-3 тренировки в неделю)</p>
            <p><input name="activity" type="radio" value="HIGH"> Высокая (3 и более тренировок в неделю)</p>
        </div>

        <div class="pure-controls">
            <button type="submit" class="pure-button pure-button-primary">Редактировать пользователя</button>
        </div>

    </fieldset>
</form:form>
</body>
</html>