<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=WINDOWS-1251" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
    <title>Portal posts</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">

    <style>
        ul.list-listings {
            margin: 0 0 20px 0;
            padding: 0;
            list-style: none;
        }

        ul.list-listings > li {
            margin-bottom: 30px;
            border: 1px solid #e0eded;
            border-radius: 2px;
        }

        ul.list-listings .listing-image {
            width: 30%;
            display: table-cell;
        }

        ul.list-listings .listing-image img {
            border-bottom-left-radius: 2px;
        }

        ul.list-listings .listing-body {
            padding: 10px 15px;
            display: table-cell;
            vertical-align: top;
        }

        ul.list-listings .listing-body h3 {
            margin: 0;
            padding: 0;
            font-size: 18px;
            font-weight: 500;
            line-height: 25px;
        }

        ul.list-listings .listing-body p {
            margin: 5px 0;
        }

        ul.list-listings .listing-body .meta-info {
            border-top: 1px solid #e0eded;
            padding-top: 7px;
        }

        ul.list-listings .listing-body .meta-info ul {
            width: 100%;
            display: table;
            table-layout: auto;
        }

        ul.list-listings .listing-body .meta-info ul li {
            display: table-cell;
            border-right: 1px solid #e0eded;
            text-align: center;
        }

        ul.list-listings .listing-body .meta-info ul li i {
            color: #333;
            margin-right: 5px;
        }

        ul.list-listings .listing-body {
            padding: 10px 15px;
            display: table-cell;
            vertical-align: top;
        }

        .bg-base {
            background: white;
            color: black;
        }

        ul.list-listings > li.featured {
            border-color: white;
        }

        ul.list-listings > li {
            margin-bottom: 30px;
            border: 1px solid #e0eded;
            border-radius: 2px;
        }

        ul.list-listings > li:before, ul.list-listings li:after {
            content: "";
            display: table;
        }

        ul.list-listings .listing-header {
            display: block;
            clear: both;
            padding: 8px 15px;
            font-weight: 600;
            text-transform: uppercase;
        }
    </style>

</head>
<body>

<c:import url="../header.jsp"/>

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<div class="container-fluid bootstrap snippets bootdey">
    <div class="row">
        <div class="col-md-12">
            <ul class="list-listings">
                <li class="featured">
                    <div class="listing-header bg-base">
                        <c:if test="${customer == null}">
                            <spring:message code="portal_news"/>
                        </c:if>
                        <c:if test="${customer != null}">
                            ${customer.login} <spring:message code="posts"/>
                        </c:if>
                    </div>
                    <c:forEach var="post" items="${posts}">
                        <div class="listing-body">
                            <div class="listing-image">
                                <c:if test="${post.photo != null}">
                                    <img src="${post.photo.url}" class="img-responsive" alt="" width="350" height="350">
                                </c:if>
                                <c:if test="${post.photo == null}">
                                    <img src="https://via.placeholder.com/300x300/FFA07A/000000" class="img-responsive"
                                         alt="" width="350" height="350">
                                </c:if>
                            </div>
                            <h3><a href="/posts/${post.id}">${post.title}</a></h3>
                            <div class="meta-info">
                                <ul>
                                    <li><i class="fa fa-calendar"></i> <small>${post.createdDate}</small></li>
                                    <li><i class="fa fa-user"></i> <small>${post.customer.login}</small></li>
                                </ul>
                            </div>
                        </div>
                    </c:forEach>
                </li>
            </ul>
        </div>
    </div>
    <div class="center" style="margin: 10px">
        <c:if test="${customer != null}">
            <form action="/posts/new" method="get">
                <button type="submit" class="btn btn-outline-success"><p><spring:message code="add_post"/></p></button>
            </form>
        </c:if>
    </div>
</div>
</body>
</html>