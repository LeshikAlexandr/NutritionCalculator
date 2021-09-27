<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=windows-1251" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<html>
<head></head>
<body>
<h1>Registration</h1>
<form:form action="registration" modelAttribute="customer" method="post">

    Login <form:input path="login"/>
    <form:errors path="login"/>
    <br><br>
    Password <form:input type="password" path="password"/>
    <form:errors path="password"/>
    <br><br>
    <input type="submit" value="Registration">
</form:form>
</body>
</html>