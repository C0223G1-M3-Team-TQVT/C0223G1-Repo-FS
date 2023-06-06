<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/4/2023
  Time: 12:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table>
    <table border="1">
        <tr>
            <th>STT</th>
            <th>Tên khách hàng</th>
            <th>Số điện thoại</th>
            <th>Ngày đặt hàng</th>
            <th>Tình trạng</th>
            <th>Tổng giá</th>
            <th>Chi tiết</th>
            <th>Xóa</th>
        </tr>
        <c:forEach items="${receipts}" var="receipts" varStatus="loop">
            <tr>
                <td><c:out value="${loop.count}"/></td>
                <td><c:out value="${receipts.customer.name}"/></td>
                <td><c:out value="${receipts.customer.phoneNumber}"/></td>
                <td><c:out value="${receipts.date}"/></td>
                <td> </td>
                <td><c:out value="${integerMap.get(receipts.id)}"/></td>
                <td><button><a href="/detailreceipt?action=detail&id=${receipts.id}">Chi tiết</a></button></td>
                <td><a type="submit" href="/detailreceipt?action=delete&id=${receipts.id}">delete</a></td>
            </tr>
        </c:forEach>
    </table>
</table>
</body>
</html>
