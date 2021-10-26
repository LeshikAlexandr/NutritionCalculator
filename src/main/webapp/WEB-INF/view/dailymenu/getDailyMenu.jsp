<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=WINDOWS-1251" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Daily menu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
</head>
<body>

<c:import url="../header.jsp"/>

<section>
    <div class="container">
        <div class="card row" style="margin-top: 30px">
            <a class="card-body text-dark " style="text-decoration: none" data-bs-toggle="collapse"
               href="#multiCollapseExample" role="button"
               aria-expanded="false" aria-controls="multiCollapseExample">
                <spring:message code="breakfast"/>
            </a>
        </div>
        <div class="row" style="margin-top: 2px; margin-bottom: 10px">
            <div class="collapse multi-collapse" id="multiCollapseExample">
                <div class="card card-body">
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="row"><spring:message code="products_name"/></th>
                            <th scope="row"><spring:message code="calories_for_100"/></th>
                            <th scope="row"><spring:message code="calories_for_serving"/></th>
                            <th scope="row"><spring:message code="proteins"/></th>
                            <th scope="row"><spring:message code="fats"/></th>
                            <th scope="row"><spring:message code="carbohydrates"/></th>
                            <th scope="row"><spring:message code="weight"/></th>
                            <th scope="row">
                                <form action="/add" method="get">
                                    <button name="eating" value="BREAKFAST" class="btn btn-outline-dark"><spring:message code="add_product"/>
                                    </button>
                                </form>
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="product" items="${dailyMenu.breakfast}">
                            <tr>
                                <th>${product.name}</th>
                                <th>${product.nominalCalories}</th>
                                <th>${product.factualCalories}</th>
                                <th>${product.factualProtein}</th>
                                <th>${product.factualFat}</th>
                                <th>${product.factualCarbohydrates}</th>
                                <th><c:forEach var="element" items="${productDailyMenuBreakfast}">
                                    <c:if test="${element.product.name eq product.name}">
                                        ${element.productWeight}
                                    </c:if>
                                </c:forEach></th>
                                <th>
                                    <form action="/delete/${dailyMenu.id}/${product.id}" method="post">
                                        <button name="eating" value="BREAKFAST" class="btn btn-outline-dark"><spring:message code="delete_product"/>
                                        </button>
                                    </form>
                                </th>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="card row" style="margin-top: 30px">
            <a class="card-body text-dark " style="text-decoration: none" data-bs-toggle="collapse"
               href="#multiCollapseExample1" role="button"
               aria-expanded="false" aria-controls="multiCollapseExample1">
                <spring:message code="dinner"/>
            </a>
        </div>
        <div class="row" style="margin-top: 2px; margin-bottom: 10px">
            <div class="collapse multi-collapse" id="multiCollapseExample1">
                <div class="card card-body">
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="row"><spring:message code="products_name"/></th>
                            <th scope="row"><spring:message code="calories_for_100"/></th>
                            <th scope="row"><spring:message code="calories_for_serving"/></th>
                            <th scope="row"><spring:message code="proteins"/></th>
                            <th scope="row"><spring:message code="fats"/></th>
                            <th scope="row"><spring:message code="carbohydrates"/></th>
                            <th scope="row"><spring:message code="weight"/></th>
                            <th scope="row">
                                <form action="/add" method="get">
                                    <button name="eating" value="DINNER" class="btn btn-outline-dark"><spring:message code="add_product"/>
                                    </button>
                                </form>
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="product" items="${dailyMenu.dinner}">
                            <tr>
                                <th>${product.name}</th>
                                <th>${product.nominalCalories}</th>
                                <th>${product.factualCalories}</th>
                                <th>${product.factualProtein}</th>
                                <th>${product.factualFat}</th>
                                <th>${product.factualCarbohydrates}</th>
                                <th><c:forEach var="element" items="${productDailyMenuDinner}">
                                    <c:if test="${element.product.name eq product.name}">
                                        ${element.productWeight}
                                    </c:if>
                                </c:forEach></th>
                                <th>
                                    <form action="/delete/${dailyMenu.id}/${product.id}" method="post">
                                        <button name="eating" value="DINNER" class="btn btn-outline-dark"><spring:message code="delete_product"/>
                                        </button>
                                    </form>
                                </th>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="card row" style="margin-top: 30px">
            <a class="card-body text-dark " style="text-decoration: none" data-bs-toggle="collapse"
               href="#multiCollapseExample2" role="button"
               aria-expanded="false" aria-controls="multiCollapseExample2">
                <spring:message code="supper"/>
            </a>
        </div>
        <div class="row" style="margin-top: 2px; margin-bottom: 10px">
            <div class="collapse multi-collapse" id="multiCollapseExample2">
                <div class="card card-body">
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="row"><spring:message code="products_name"/></th>
                            <th scope="row"><spring:message code="calories_for_100"/></th>
                            <th scope="row"><spring:message code="calories_for_serving"/></th>
                            <th scope="row"><spring:message code="proteins"/></th>
                            <th scope="row"><spring:message code="fats"/></th>
                            <th scope="row"><spring:message code="carbohydrates"/></th>
                            <th scope="row"><spring:message code="weight"/></th>
                            <th scope="row">
                                <form action="/add" method="get">
                                    <button name="eating" value="SUPPER" class="btn btn-outline-dark"><spring:message code="add_product"/>
                                    </button>
                                </form>
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="product" items="${dailyMenu.supper}">
                            <tr>
                                <th>${product.name}</th>
                                <th>${product.nominalCalories}</th>
                                <th>${product.factualCalories}</th>
                                <th>${product.factualProtein}</th>
                                <th>${product.factualFat}</th>
                                <th>${product.factualCarbohydrates}</th>
                                <th><c:forEach var="element" items="${productDailyMenuSupper}">
                                    <c:if test="${element.product.name eq product.name}">
                                        ${element.productWeight}
                                    </c:if>
                                </c:forEach></th>
                                <th>
                                    <form action="/delete/${dailyMenu.id}/${product.id}" method="post">
                                        <button name="eating" value="SUPPER" class="btn btn-outline-dark"><spring:message code="delete_product"/>
                                        </button>
                                    </form>
                                </th>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="row" style="margin-top: 2px; margin-bottom: 10px">
            <div class="card card-body">
                <table class="table table-borderless">
                    <tbody>
                    <tr>
                        <th><spring:message code="calories"/>: ${dailyMenu.generalCalories}</th>
                        <th><spring:message code="proteins"/>: ${dailyMenu.generalProteins}</th>
                        <th><spring:message code="fats"/>: ${dailyMenu.generalFats}</th>
                        <th><spring:message code="carbohydrates"/>: ${dailyMenu.generalCarbohydrates}</th>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <form action="/" method="get" style="margin-top: 5px">
            <button type="submit" class="btn btn-outline-dark"><spring:message code="back"/></button>
        </form>
    </div>
</section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>