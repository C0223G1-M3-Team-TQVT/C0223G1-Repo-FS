<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 6/3/2023
  Time: 2:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table border="1" cellspacing="0">
    <%--    int id, String name, String citizenId, String phoneNumber, String address, Position position--%>
    <tr>
        <th>STT</th>
        <th>Name</th>
        <th>Can Cuoc Cong Dan</th>
        <th>SDT</th>
        <th>Dia Chi</th>
        <th>Chuc vu</th>
        <th>Sua</th>
        <th>Xoa</th>
    </tr>
    <c:forEach items="${employeeList}" var="employee">
        <tr>
            <td>
                <c:out value="${employee.id}"/>
            </td>
            <td>
                <c:out value="${employee.name}"/>
            </td>
            <td>
                <c:out value="${employee.citizenId}"/>
            </td>
            <td>
                <c:out value="${employee.phoneNumber}"/>
            </td>
            <td>
                <c:out value="${employee.address}"/>
            </td>
            <td>
                <c:out value="${employee.position.name}"/>
            </td>
            <td>
                <a href="/employee?action=update&id=${employee.id}"/>
                <button type="submit">Sua</button>
            </td>
            <td>
                <a href="/employee?action=delete&id=${employee.id}"/>
                <button type="submit">Xoa</button>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>