<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=WINDOWS-1251" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <title>New post</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>

<body>

<c:import url="../header.jsp"/>

<form:form class="pure-form pure-form-aligned" cssStyle="margin-top: 20px; margin-left: 10px" action="/posts/new"
           enctype="multipart/form-data" modelAttribute="post" method="post">

    <fieldset>
        <div class="pure-control-group">
            <label for="name">Заголовок </label>
            <form:input path="title" id="name"/>
            <form:errors path="title"/>
        </div>
        <br>
        <div class="pure-control-group">
            <label for="name">Текст </label>
            <form:textarea path="text"/>
            <form:errors path="text"/>
        </div>
        Фото поста <input type="file" name="file"/>
        <br><br>
        <input type="submit" value="Опубликовать пост">
    </fieldset>
</form:form>

</body>
</html>