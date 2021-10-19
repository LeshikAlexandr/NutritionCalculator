<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=WINDOWS-1251" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All products</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <style>
        .container {
            display: -webkit-flex;
            display: flex;
            height: 100%;
        }

        h1 {
            font-size: 30px;
            color: #fff;
            text-transform: uppercase;
            font-weight: 300;
            text-align: center;
            margin-bottom: 15px;
        }

        table {
            width: 100%;
            table-layout: fixed;
        }

        .tbl-header {
            background-color: rgba(255, 255, 255, 0.3);
        }

        .tbl-content {
            height: 300px;
            overflow-x: auto;
            margin-top: 0px;
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        th {
            padding: 20px 15px;
            text-align: left;
            font-weight: 500;
            font-size: 12px;
            color: #fff;
            text-transform: uppercase;
        }

        td {
            padding: 15px;
            text-align: left;
            vertical-align: middle;
            font-weight: 300;
            font-size: 12px;
            color: #fff;
            border-bottom: solid 1px rgba(255, 255, 255, 0.1);
        }


        /* demo styles */

        @import url(https://fonts.googleapis.com/css?family=Roboto:400,500,300,700);
        body {
            background: -webkit-linear-gradient(left, #25c481, #25b7c4);
            background: linear-gradient(to right, #25c481, #25b7c4);
            font-family: 'Roboto', sans-serif;
        }

        section {
            margin: 50px;
        }


        /* follow me template */
        .made-with-love {
            margin-top: 40px;
            padding: 10px;
            clear: left;
            text-align: center;
            font-size: 10px;
            font-family: arial;
            color: #fff;
        }

        .made-with-love i {
            font-style: normal;
            color: #F50057;
            font-size: 14px;
            position: relative;
            top: 2px;
        }

        .made-with-love a {
            color: #fff;
            text-decoration: none;
        }

        .made-with-love a:hover {
            text-decoration: underline;
        }


        /* for custom scrollbar for webkit browser*/

        ::-webkit-scrollbar {
            width: 6px;
        }

        ::-webkit-scrollbar-track {
            -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
        }

        ::-webkit-scrollbar-thumb {
            -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
        }

        .add {
            float: right;
        }

        .inputButton {
            position: relative;
            width: 85%;
            height: 50px;
            display: block;
            margin: 30px auto 30px;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            -ms-border-radius: 5px;
            border-radius: 5px;
            color: white;
            background-color: #0d6958;
            border: none;
            -webkit-box-shadow: 0 5px 0 #769f96;
            -moz-box-shadow: 0 5px 0 #082f27;
        }

        .center {
            text-align: center;
        }
    </style>
</head>
<body>
<section>
    <h1>������� �������������</h1>
    <div class="tbl-header">
        <table cellpadding="0" cellspacing="0" border="0">
            <thead>
            <tr>
                <th>������������</th>
            </tr>
            </thead>
        </table>
    </div>
    <div class="tbl-content">
        <table cellpadding="0" cellspacing="0" border="0">
            <tbody>
            <c:set var="n" value="${customer.login}"/>
            <c:forEach var="someCustomer" items="${customers}">
                <form action="/followers/add_follower/${someCustomer.id}" method="post">
                    <c:set var="t" value="${someCustomer.login}"/>
                    <c:if test="${!(t eq n)}">
                        <tr>
                            <td>${someCustomer.login}</td>
                                <%--<td>
                                    <div class="center">
                                        <form:form class="pure-form pure-form-aligned" action="/products/update/${product.id}" method="get">
                                            <button type="submit" class="btn btn-outline-light">������������� �������</button>
                                        </form:form>
                                    </div>
                                </td>
                                <td>
                                    <div class="center">
                                        <form:form class="pure-form pure-form-aligned" action="/products/delete/${product.id}" method="delete">
                                            <button type="submit" class="btn btn-outline-light">������� �������</button>
                                        </form:form>
                                    </div>
                                </td>--%>
                            <td><button type="submit" class="btn btn-outline-light">�����������</button></td>
                        </tr>
                    </c:if>
                </form>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <%--    <div class="center">
            <form action="products/new" method="get">
                <button type="submit" class="btn btn-outline-light">�������� �������</button>
            </form>
        </div>
        <br>
        <div class="center">
            <form action="profile" method="get">
                <button type="submit" class="btn btn-outline-light">�����</button>
            </form>
        </div>--%>
</section>
</body>
</html>