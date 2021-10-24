<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=WINDOWS-1251" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <style>

        .icon_de {
            float: left;
            margin: 0;
        }

        .inputButton {
            position: relative;
            display: block;
            margin: 30px auto 30px;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            -ms-border-radius: 5px;
            border-radius: 2px;
            color: white;
            background-color: #333;
            border: none;
            -webkit-box-shadow: 0 5px 0 #769f96;
            -moz-box-shadow: 0 5px 0 #082f27;
            float: right
        }

        .header {
            padding: 80px;
            text-align: center;
            background: #1abc9c;
            color: white;
        }

        table {
            width: 750px;
            border-collapse: collapse;
            margin: 50px auto;
        }

        th {
            background: #082f27;
            color: white;
            font-weight: bold;
        }

        td, th {
            padding: 10px;
            border: 2px solid #ccc;
            text-align: left;
            font-size: 18px;
        }

        .labels tr td {
            background-color: #0d6958;
            font-weight: bold;
            color: #fff;
        }

        .label tr td label {
            display: block;
        }


        [data-toggle="toggle"] {
            display: none;
        }

        /* Style the navigation bar links */
        .nnavbar a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 20px;
            text-decoration: none;
        }


        /* Right-aligned link */
        .nnavbar a.right {
            float: right;
        }

        /* Change color on hover */
        .nnavbar a:hover {
            background-color: #ddd;
            color: black;
        }

        /* Active/current link */
        .nnavbar a.active {
            background-color: #666;
            color: white;
        }

        Column container
        .row {
            display: -ms-flexbox; /* IE10 */
            display: flex;
            -ms-flex-wrap: wrap; /* IE10 */
            flex-wrap: wrap;
        }
    </style>
    <script>
        $(document).ready(function () {
            $('[data-toggle="toggle"]').change(function () {
                $(this).parents().next('.hide').toggle();
            });
        });
    </script>
</head>
<body>

<c:import url="../header.jsp"/>

<table>
    <thead>
    <tr>
        <th><p>Имя продукта</p></th>
        <th><p>Калории на 100г</p></th>
        <th><p>Калории на порцию</p></th>
        <th><p>Белки</p></th>
        <th><p>Жиры</p></th>
        <th><p>Углеводы</p></th>
    </tr>
    </thead>
    <tbody>
    <tbody class="labels">
    <tr>
        <td colspan="6">
            <label><p>Завтрак</p></label>
            <div>
                <form action="/add" method="get">
                    <button name="eating" value="BREAKFAST" class="btn btn-outline-light">Добавить продукт</button>
                </form>
            </div>
        </td>
    </tr>
    </tbody>
    <tbody class="hide">
    <tr>
        <c:forEach var="product" items="${dailyMenu.breakfast}">
            <br>
            <td><span></span>${product.name}</td>
            <td><span></span>${product.nominalCalories}</td>
            <td><span></span>${product.factualCalories}</td>
            <td><span></span>${product.factualProtein}</td>
            <td><span></span>${product.factualFat}</td>
            <td><span></span>${product.factualCarbohydrates}</td>
            <td><span></span>
                <div class="center">
                    <div class="center">
                        <form action="/delete/${dailyMenu.id}/${product.id}" method="post">
                            <button name="eating" value="BREAKFAST" class="btn btn-outline-light">Удалить продукт</button>
                        </form>
                    </div>
                </div>
            </td>

        </c:forEach>
    </tr>
    </tbody>
    <tbody class="labels">
    <tr>
    <tr>
        <td colspan="6">
            <label><p>Обед</p></label>
            <div>
                <form action="/add" method="get">
                    <button name="eating" value="DINNER" class="btn btn-outline-light">Добавить продукт</button>
                </form>
            </div>
        </td>
    </tr>
    </tr>
    </tbody>
    <tr>
        <c:forEach var="product" items="${dailyMenu.dinner}">
            <br>
            <td><span></span>${product.name}</td>
            <td><span></span>${product.nominalCalories}</td>
            <td><span></span>${product.factualCalories}</td>
            <td><span></span>${product.factualProtein}</td>
            <td><span></span>${product.factualFat}</td>
            <td><span></span>${product.factualCarbohydrates}</td>
            <td><span></span>
                <div class="center">
                    <div class="center">
                        <form action="/delete/${dailyMenu.id}/${product.id}" method="post">
                            <button name="eating" value="DINNER" class="btn btn-outline-light">Удалить продукт</button>
                        </form>
                    </div>
                </div>
            </td>
        </c:forEach>
    </tr>
    <tbody class="labels">
    <tr>
        <td colspan="6">
            <label><p>Ужин</p></label>
            <div>
                <form action="/add" method="get">
                    <button name="eating" value="SUPPER" class="btn btn-outline-light">Добавить продукт</button>
                </form>
            </div>
        </td>
    </tr>
    </tbody>
    <tr>
        <c:forEach var="product" items="${dailyMenu.supper}">
            <br>
            <<td><span></span>${product.name}</td>
            <td><span></span>${product.nominalCalories}</td>
            <td><span></span>${product.factualCalories}</td>
            <td><span></span>${product.factualProtein}</td>
            <td><span></span>${product.factualFat}</td>
            <td><span></span>${product.factualCarbohydrates}</td>
            <td><span></span>
                <div class="center">
                    <form action="/delete/${dailyMenu.id}/${product.id}" method="post">
                        <button name="eating" value="SUPPER" class="btn btn-outline-light">Удалить продукт</button>
                    </form>
                </div>
            </td>
        </c:forEach>
    </tr>
    </tbody>
    <tbody class="labels">
    <tr>
        <td colspan="6">
            <label><p>Итого за день</p></label>
        </td>
    </tr>
    </tbody>
    <td></td>
    <td>
    <td><span></span>${dailyMenu.generalCalories}</td>
    </td>
    <td><span></span>${dailyMenu.generalProteins}</td>
    <td><span></span>${dailyMenu.generalFats}</td>
    <td><span></span>${dailyMenu.generalCarbohydrates}</td>
</table>

<div>
    <form action="/" method="get">
        <input class="inputButton" type="submit" value="Назад"/>
    </form>
</div>
</body>
</html>