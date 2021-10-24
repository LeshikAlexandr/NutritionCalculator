<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=WINDOWS-1251" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>

<body>

<form:form action="/posts/new" enctype="multipart/form-data" modelAttribute="post" method="post">

    Заголовок <form:input path="title"/>
    <form:errors path="title"/>
    Текст <form:input path="text"/>
    <form:errors path="text"/>
    <br><br>
    Фото поста <input type="file" name="file"/>
    <br><br>
    <input type="submit" value="Опубликовать пост">
</form:form>

</body>

</html>