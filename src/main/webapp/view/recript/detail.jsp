<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/5/2023
  Time: 2:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table border="1">
    <tr>
        <th>Tên khách hàng</th>
        <th>Tên loại bánh</th>

        <th>Số lượng</th>
        <th>Tổng sản phẩm</th>
    </tr>
    <c:forEach items="${receiptList}" var="detailReceipts" varStatus="loop">
        <c:if test="${id==detailReceipts.receipt.id}">
            <tr>
                <td><c:out value="${detailReceipts.receipt.customer.name}"/></td>
                <td><c:out value="${detailReceipts.cake.name}"/></td>
                <td><c:out value="${detailReceipts.amount}"/></td>
                <td ><c:out value="${detailReceipts.cake.price*detailReceipts.amount}"/></td>
            </tr>
        </c:if>
    </c:forEach>
</table>
</body>
</html>
