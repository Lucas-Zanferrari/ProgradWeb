<%--
  Created by IntelliJ IDEA.
  User: lucaszanferrari
  Date: 7/28/16
  Time: 1:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
</head>
<body>
    <jsp:include page="admin/cabecalho.jsp"/>
    <h2>Login do Sistema Prograd Web</h2>
    <p style="color: red">${requestScope.mensagem}</p>
    <form role="form" action="login" method="post">
        <label for="usuario">Usuário: </label>
        <input type="text" id="usuario" name="usuario" placeholder="Digite o usuário">
        <br />
        <label for="senha">Senha: </label>
        <input type="password" id="senha" name="senha" placeholder="Digite a senha">
        <br />
        <br />
        <button type="submit">Entrar</button>
    </form>

    <br />
    <br />
    <a href="${pageContext.request.contextPath}/cadastroUsuario">Não é cadastrado? Cadastre-se aqui</a>
    <jsp:include page="admin/rodape.jsp"/>

</body>
</html>
