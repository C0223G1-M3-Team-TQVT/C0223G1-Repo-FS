<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/3/2023
  Time: 10:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="/header.jsp"></jsp:include>
<table>
    <tr>
        <th>sdt</th>
        <th>mk</th>
    </tr>
    <c:forEach items="${user}" var="user">
        <tr>
            <th><c:out value="${user.phoneNumber}"/></th>
            <th><c:out value="${user.password}"/></th>
        </tr>
    </c:forEach>
</table>
</body>
</html>
