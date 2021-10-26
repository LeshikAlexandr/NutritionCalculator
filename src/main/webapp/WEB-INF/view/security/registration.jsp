<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=WINDOWS-1251" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!doctype html>
<html lang="en">
<head>
    <title>Registration page</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sign-in/">


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">


</head>
<body class="text-center">

<c:import url="../header.jsp"/>

<main class="form-signin mt-4">
    <div class="row">
        <div class="col-2 offset-5">
            <form:form action="registration" modelAttribute="customer" method="post">
                <h1 class="h3 mb-3 fw-normal"><spring:message code="registration"/></h1>

                <div class="form-floating">
                    <input type="text" class="form-control" name='login' id="floatingInput" placeholder="Login">
                    <label for="floatingInput"><spring:message code="login"/></label>
                </div>
                <div class="form-floating">
                    <input type="password" class="form-control" name='password' id="floatingPassword"
                           placeholder="Password">
                    <label for="floatingPassword"><spring:message code="password"/></label>
                </div>
                <button class="w-100 btn btn-lg btn-primary" type="submit"><spring:message code="registration"/></button>
            </form:form>
        </div>
    </div>
</main>
</body>
</html>