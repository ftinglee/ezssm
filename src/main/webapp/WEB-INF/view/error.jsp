<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title></title>
</head>
<body>

<h1>错误页面</h1>
<p>程序发生了错误,请尽快联系管理员...</p>

<!--
    请求地址: ${url}
    异常类型: ${exception}
    异常信息:  ${exception.message}
      <c:forEach items="${exception.stackTrace}" var="ste">${ste}
      </c:forEach>
-->
</body>
</html>
