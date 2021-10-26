<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=WINDOWS-1251" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Products</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
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
                            <th scope="row"><spring:message code="products_name"/></th>
                            <th scope="row"><spring:message code="calories"/></th>
                            <th scope="row"><spring:message code="proteins"/></th>
                            <th scope="row"><spring:message code="fats"/></th>
                            <th scope="row"><spring:message code="carbohydrates"/></th>
                            <th scope="row"></th>
                            <th scope="row"></th>
                            <th scope="row"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="product" items="${products}">
                            <tr>
                                <th>${product.name}</th>
                                <th>${product.nominalCalories}</th>
                                <th>${product.protein}</th>
                                <th>${product.fat}</th>
                                <th>${product.carbohydrates}</th>
                                <th>
                                    <form:form class="pure-form pure-form-aligned"
                                               action="/products/update/${product.id}" method="get">
                                        <button type="submit" class="btn btn-outline-dark"><spring:message code="edit"/>
                                        </button>
                                    </form:form></th>
                                <th>
                                    <form:form class="pure-form pure-form-aligned" action="/products/delete/${product.id}" method="delete">
                                        <button type="submit" class="btn btn-outline-dark"><spring:message code="delete_product"/></button>
                                    </form:form>
                                </th>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="center">
            <form action="products/new" method="get">
                <button type="submit" class="btn btn-outline-dark"><spring:message code="add_product"/></button>
            </form>
        </div>
        <form action="/" method="get" style="margin-top: 5px">
            <button type="submit" class="btn btn-outline-dark"><spring:message code="back"/></button>
        </form>
    </div>
</section>
</body>
</html>