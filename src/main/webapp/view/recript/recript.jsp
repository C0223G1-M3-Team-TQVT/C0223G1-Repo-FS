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
    <table>
        <tr>
            <th>Hóa đơn</th>
            <th>Delete</th>
        </tr>
        <c:forEach items="${user}" var="user">
            <tr>
                <td>
                    <table>
                        <tr>
                            <th>STT</th>
                            <th>Tên khách hàng</th>
                            <th>Tên loại bánh</th>
                            <th>Số lượng</th>
                            <th>Tổng tiền</th>

                        </tr>
                        <c:forEach items="" var="" varStatus="loop">
                            <tr>
                                <td><c:out value="${loop.count}"/></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </c:forEach>
                    </table>
                </td>
                <td><a type="submit" href="/bakery?action=delete"></a></td>
            </tr>

        </c:forEach>
    </table>
</table>
</body>
</html>
