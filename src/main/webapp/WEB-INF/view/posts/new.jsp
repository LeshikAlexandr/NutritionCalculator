<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=WINDOWS-1251" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>

<body>

<form:form action="/posts/new" enctype="multipart/form-data" modelAttribute="post" method="post">

    ��������� <form:input path="title"/>
    <form:errors path="title"/>
    ����� <form:input path="text"/>
    <form:errors path="text"/>
    <br><br>
    ���� ����� <input type="file" name="file"/>
    <br><br>
    <input type="submit" value="������������ ����">
</form:form>

</body>

</html>