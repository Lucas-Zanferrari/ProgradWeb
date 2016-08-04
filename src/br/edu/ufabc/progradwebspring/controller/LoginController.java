package br.edu.ufabc.progradwebspring.controller;

/**
 * Created by lucaszanferrari on 7/31/16.
 */

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import br.edu.ufabc.progradwebspring.dao.UsuarioDAO;
import br.edu.ufabc.progradwebspring.model.Usuario;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {

    @RequestMapping("/")
    public String home() {
        return "login";
    }

    @RequestMapping(value = "/admin/index", method= RequestMethod.GET)
    public String index() {
        return "/admin/index";
    }

    @RequestMapping(value = "cadastroUsuario", method=RequestMethod.GET)
    public String cadastraUsuario() {
        return "cadastroUsuario";
    }


    @RequestMapping(value = "cadastrarUsuario", method=RequestMethod.POST)
    public String cadastrarUsuario(HttpServletRequest req, @RequestParam("usuario") String usuario, @RequestParam("senha1") String senha, Model model) {
        HttpSession session = req.getSession();
        if (usuario.equals("") || senha.equals("")) {
            req.setAttribute("mensagem", "Todos os campos precisam estar preenchidos");
            return "cadastroUsuario";
        }
        else {
            Usuario usuarioObj = new Usuario();
            usuarioObj.setUsuario(usuario);
            usuarioObj.setSenha(senha);
            UsuarioDAO dao = new UsuarioDAO();

            if(dao.estaCadastrado(usuario)){
                req.setAttribute("mensagem", "O usuário já está cadastrado." );
                return "login";
            }
            else {
                dao.cadastra(usuarioObj);
                model.addAttribute("mensagem", "Bem-vindo, " + usuarioObj.getUsuario() + "!");
                session.setAttribute("usuario", usuarioObj);
                return "admin/index";
            }
        }
    }

    @RequestMapping("login")
    public String login(Usuario usuario, HttpServletRequest req, Model model) {
        HttpSession session = req.getSession();
        UsuarioDAO dao = new UsuarioDAO();

        if(session.getAttribute("usuario") != null){
            usuario = (Usuario) session.getAttribute("usuario");
        }

        if (usuario == null || usuario.getUsuario() == null) {
            model.addAttribute("mensagem", "Por favor, faça login no sistema!");
        }
        else if (dao.estaCadastrado(usuario.getUsuario()) && dao.checaPermissao(usuario)) {
            model.addAttribute("mensagem", "Bem-vindo, " + usuario.getUsuario() + "!");
            session.setAttribute("usuario", usuario);
            return "admin/index";
        }
        else {
            session.setAttribute("usuario", null);
            model.addAttribute("mensagem", "Usuário ou senha incorreto(s)!");
        }

        return "login";
    }

    @RequestMapping("logout")
    public String logout(HttpSession session, Model model) {
        session.invalidate();
        model.addAttribute("mensagem", "Sessão encerrada!");
        return "login";
    }
}
