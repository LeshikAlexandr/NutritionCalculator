<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=WINDOWS-1251" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>

<body>

<table>


    <c:forEach var="post" items="${posts}">
        <%--        <c:url var="commentButton" value="/newComment">--%>
        <%--            <c:param name="postId" value="${post.id}"/>--%>
        <%--        </c:url>--%>
        <%--            <spring:url value="/newComment" var="newComment">--%>
        <%--                <spring:param name="postId" value="${post.id}"/>--%>
        <%--            </spring:url>--%>

        <tr>
            <td>${post.text}</td>
            <td>${post.createdDate}</td>
            <td>
                <form action="newComment/${post.id}" enctype="multipart/form-data" modelAttribute="comment"
                      method="post">
                    ����������� <input name="text"/>
                    <br><br>
                    ���� ����������� <input type="file" name="file"/>
                    <br><br>
                    <input type="submit" value="��������������">
                </form>
            </td>
        </tr>
    </c:forEach>

</table>

<form action="new" enctype="multipart/form-data" modelAttribute="newPost" method="post">
    ����� <input name="text"/>
    <br><br>
    ���� ����� <input type="file" name="file"/>
    <br><br>
    <input type="submit" value="������������ ����">
</form>

<%--<form:form action="newComment" enctype="multipart/form-data" modelAttribute="comment" method="post">--%>

<%--    ����������� <form:input path=""/>--%>
<%--    <br><br>--%>
<%--    ���� ����������� <input type="file" name="file" />--%>
<%--    <br><br>--%>
<%--    <input type="submit" value="��������������">--%>
<%--</form:form>--%>

<%--<form:form action="new" enctype="multipart/form-data" modelAttribute="newPost" method="post">--%>

<%--    ����� <form:input path="text"/>--%>
<%--    <br><br>--%>
<%--    ���� ����� <input type="file" name="file" />--%>
<%--    <br><br>--%>
<%--    <input type="submit" value="������������ ����">--%>
<%--</form:form>--%>

<%--<form action="newComment" enctype="multipart/form-data" modelAttribute="comment" method="post">--%>
<%--    ����������� <input name="text"/>--%>
<%--    <br><br>--%>
<%--    ���� ����������� <input type="file" name="file"/>--%>
<%--    <br><br>--%>
<%--    <input type="submit" value="��������������">--%>
<%--</form>--%>


<%--<table>--%>

<%--    <c:forEach var="post" items="${posts}">--%>

<%--        <tr>--%>
<%--            <td>${post.text}</td>--%>
<%--            <td>${post.createdDate}</td>--%>
<%--        </tr>--%>

<%--        <form:form action="new" enctype="multipart/form-data" modelAttribute="newComment" method="post">--%>

<%--            ����������� <form:input path="text"/>--%>
<%--            <br><br>--%>
<%--            ����� � ����������� <input type="file" name="file" />--%>
<%--            <br><br>--%>
<%--            <input type="submit" value="������������ ����">--%>
<%--        </form:form>--%>


<%--    </c:forEach>--%>
<%--</table>--%>

<%--<form:form action="new" enctype="multipart/form-data" modelAttribute="newPost" method="post">--%>

<%--    ����� <form:input path="text"/>--%>
<%--    <br><br>--%>
<%--    ���� ����� <input type="file" name="file" />--%>
<%--    <br><br>--%>
<%--    <input type="submit" value="������������ ����">--%>
<%--</form:form>--%>


</body>

</html>