<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=WINDOWS-1251" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Page Title</title>
    <meta charset="UTF-8">
    <meta>
</head>
<body>

<c:import url="../header.jsp"/>

<div>
    <form method="POST" enctype="multipart/form-data" action="/upload">
        <table>
            <tr><td><spring:message code="file_to_upload"/></td><td><input type="file" name="file" /></td></tr>
            <tr><td></td><td><input type="submit" value=<spring:message code="upload"/> /></td></tr>
        </table>
    </form>
</div>



</body>
</html>