<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Projeto Prograd Web</title>
</head>
<body>
    <jsp:include page="cabecalho.jsp"/>
    <h2>${requestScope.mensagem}</h2>
    <p><a href="${pageContext.request.contextPath}/admin/busca">Busca de Alunos</a></p>
    <p><a href="${pageContext.request.contextPath}/admin/insere">Inserir Aluno</a></p>
    <p><a href="${pageContext.request.contextPath}/admin/altera">Alterar Aluno</a></p>
    <p><a href="${pageContext.request.contextPath}/admin/remove">Remover Aluno</a></p>
    <a href="${pageContext.request.contextPath}/logout">Logout</a>
    <jsp:include page="rodape.jsp"/>
</body>
</html>