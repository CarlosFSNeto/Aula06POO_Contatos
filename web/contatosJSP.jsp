<%-- 
    Document   : contatosJSP
    Created on : 16/04/2018, 21:26:40
    Author     : a
    URL github : https://github.com/CarlosFSNeto/Aula06POO_Contatos.git
--%>

<%@page import="br.com.fatecpg.bd.Bd"%>
<%@page import="br.com.fatecpg.bd.Contato"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if(request.getParameter("add") != null)
    {
        Contato c = new Contato();
        c.setNome(request.getParameter("nome"));
        c.setTelefone(request.getParameter("telefone"));
        c.setEmail(request.getParameter("email"));
        Bd.getContatosList().add(c);
        //A linha abaixo evita que a página reenvie os parâmetros quando o usuário atualiza a página.
        response.sendRedirect(request.getRequestURI()); 
    }
    
    if (request.getParameter("del") != null)
    {
        Bd.getContatosList().remove(Integer.parseInt(request.getParameter("i")));
        response.sendRedirect(request.getRequestURI());
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>WebApp - Contatos</title>
    </head>
    <body>
        <h1>OO WebApp</h1>
        <h2>Contatos</h2>
        <fieldset>
            <legend>Incluir Contato</legend>
            <form>
                Nome: <input type="text" name="nome"/><br/>
                Telefone: <input type="text" name="telefone"/><br/>
                Email: <input type="text" name="email"/><br/>
                <br/><input type="submit" name="add" value="Adicionar"/>
            </form>
        </fieldset>
        <hr/>
        <table border="1">
            <tr><th>Índice</th><th>Nome</th><th>Telefone</th><th>Email</th><th>-</th></tr>
            <%for(int i=0;i<Bd.getContatosList().size();i++){%>
            <tr>
                <td><%=i%></td>
                <td><%=Bd.getContatosList().get(i).getNome() %></td>
                <td><%=Bd.getContatosList().get(i).getTelefone() %></td>
                <td><%=Bd.getContatosList().get(i).getEmail() %></td>
                <td>
                    <form>
                        <input type="hidden" name="i" value="<%=i%>"/>
                        <input type="submit" name="del" value="Excluir"/>
                    </form>
                </td>
            </tr>
            <%}%>
        </table>
    </body>
</html>
