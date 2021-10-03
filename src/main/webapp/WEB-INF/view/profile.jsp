<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=WINDOWS-1251" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<body>
<table>
    <c:forEach var="post" items="${posts}">
        <tr>
            <td>${post.text}</td>
            <td>${post.createdDate}</td>

            <c:forEach var="comment" items="${post.comments}">
                ${comment.text}
            </c:forEach>
        </tr>
</table>
        <br>
        <form action="posts/newComment/${post.id}" enctype="multipart/form-data" modelAttribute="comment" method="post">
            ����������� <input name="text"/>
            <br><br>
            ���� ����������� <input type="file" name="file"/>
            <br><br>
            <input type="submit" value="��������������">
        </form>
        <br>
    </c:forEach>

    <br>
<button onclick="window.location.href='/posts/new'">Click me</button>
</body>
</html>