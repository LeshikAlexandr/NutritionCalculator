<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=WINDOWS-1251" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Food diary</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
</head>
<body>
<c:import url="../header.jsp"/>

<section>
    <div class="container">
        <div class="row" style="margin-top: 30px; margin-bottom: 10px">
            <div>
                <div class="card card-body">
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="row"><spring:message code="date"/></th>
                            <th scope="row"><spring:message code="calories"/></th>
                            <th scope="row"><spring:message code="proteins"/></th>
                            <th scope="row"><spring:message code="fats"/></th>
                            <th scope="row"><spring:message code="carbohydrates"/></th>

                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="dailyMenu" items="${foodDiary}">
                            <tr>
                                <th><a href="/food-diaries/show?id=${dailyMenu.id}"/> ${dailyMenu.createdDate}</th>
                                <th>${dailyMenu.generalCalories}</th>
                                <th>${dailyMenu.generalProteins}</th>
                                <th>${dailyMenu.generalFats}</th>
                                <th>${dailyMenu.generalCarbohydrates}</th>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <form action="/" method="get" style="margin-top: 5px">
            <button type="submit" class="btn btn-outline-dark"><spring:message code="back"/></button>
        </form>
    </div>
</section>
</body>
</body>
</html>