<%--
  Created by IntelliJ IDEA.
  User: lucaszanferrari
  Date: 7/28/16
  Time: 1:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cadastro de Usuários</title>
    <script type="text/javascript">
        function verificaIgualdadeDeSenhas(){
            var senha1 = document.getElementById("senha1").value;
            var senha2 = document.getElementById("senha2").value;
            if(senha1 == senha2){
                return true;
            }
            else {
                document.getElementById("msg").innerText = "As senhas não são iguais.";
                return false;
            }

        }
    </script>
</head>
<body>
    <jsp:include page="admin/cabecalho.jsp"/>
    <h2>Cadastro de Usuário</h2>
    <p id="msg" style="color: red">${requestScope.mensagem}</p>
    <form action="/cadastrarUsuario" method="post" onsubmit="return verificaIgualdadeDeSenhas()">
        <label for="usuario">Usuário: </label>
        <input type="text" id="usuario" name="usuario" placeholder="Digite o usuário">
        <br />
        <label for="senha1">Senha: </label>
        <input type="password" id="senha1" name="senha1" placeholder="Digite a senha">
        <br />
        <label for="senha2">Confirmação: </label>
        <input type="password" id="senha2" name="senha2" placeholder="Confirme a senha">
        <br />
        <br />
        <button type="submit">Cadastrar</button>
    </form>
    <jsp:include page="admin/rodape.jsp"/>

</body>
</html>
