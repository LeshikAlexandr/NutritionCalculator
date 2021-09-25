<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head></head>
<body>
<h1>Registration</h1>
<form:form action="registration" modelAttribute="customer" method="post">

    Login <form:input path="login"/>
    <br><br>
    Password <form:input path="password"/>
    <br><br>
    <input type="submit" value="Registration">
</form:form>
</body>
</html>