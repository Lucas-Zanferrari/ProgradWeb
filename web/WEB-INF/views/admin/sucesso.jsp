<%--
  Created by IntelliJ IDEA.
  User: lucaszanferrari
  Date: 7/6/16
  Time: 1:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sucesso</title>
</head>
<body>
<jsp:include page="cabecalho.jsp"/>
<h2>Mensagem:</h2>
<p>${requestScope.mensagem}</p>
<br /><br />
<a href="${pageContext.request.contextPath}/admin/index">Voltar</a>
<jsp:include page="rodape.jsp"/>
</body>
</html>
