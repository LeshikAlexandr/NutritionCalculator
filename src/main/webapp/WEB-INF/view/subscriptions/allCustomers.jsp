<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=WINDOWS-1251" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All customers</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <style>
        body {
            margin-top: 20px;
            background: #FAFAFA;
        }

        /*==================================================
          Nearby People CSS
          ==================================================*/

        .people-nearby .google-maps {
            background: #f8f8f8;
            border-radius: 4px;
            border: 1px solid #f1f2f2;
            padding: 20px;
            margin-bottom: 20px;
        }

        .people-nearby .google-maps .map {
            height: 300px;
            width: 100%;
            border: none;
        }

        .people-nearby .nearby-user {
            padding: 20px 0;
            border-top: 1px solid #f1f2f2;
            border-bottom: 1px solid #f1f2f2;
            margin-bottom: 20px;
        }

        img.profile-photo-lg {
            height: 80px;
            width: 80px;
            border-radius: 50%;
        }
    </style>
</head>
<body>

<c:import url="../header.jsp"/>

<div class="container">
    <div class="row">
        <div class="col-md-8">
            <div class="people-nearby">
                <div class="nearby-user">
                    <c:set var="n" value="${customer.login}"/>
                    <c:forEach var="someCustomer" items="${customers}">

                        <c:set var="t" value="${someCustomer.login}"/>
                        <c:if test="${!(t eq n)}">
                            <div class="row">
                                <div class="col-md-3 col-sm-2">
                                    <img src="${(someCustomer.photo != null && someCustomer.photo.url != null) ? someCustomer.photo.url : "/images/default/avatar7.png"}"
                                         alt="user"
                                         class="profile-photo-lg">
                                </div>
                                <div class="col-md-3 col-sm-7">
                                    <h5><a href="/customers/${someCustomer.login}/posts" class="profile-link">${someCustomer.login}</a></h5>
                                </div>
                                <div class="col-md-3 col-sm-3">
                                    <c:if test="${customer.usernames.contains(someCustomer.login)}">
                                        <form action="/subscriptions/delete_subscriber/${someCustomer.id}" method="post">
                                            <button class="btn btn-secondary pull-right"><spring:message
                                                    code="unsubscribe"/></button>
                                        </form>
                                    </c:if>
                                    <c:if test="${!(customer.usernames.contains(someCustomer.login))}">
                                        <form action="/subscriptions/add_subscriber/${someCustomer.id}" method="post">
                                            <button class="btn btn-primary pull-right"><spring:message
                                                    code="subscribe"/></button>
                                        </form>
                                    </c:if>
                                </div>
                            </div>
                        </c:if>

                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>