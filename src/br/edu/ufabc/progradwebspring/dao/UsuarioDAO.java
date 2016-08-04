package br.edu.ufabc.progradwebspring.dao;

import java.sql.Connection;

import br.edu.ufabc.progradwebspring.jdbc.ConexaoBD;
import br.edu.ufabc.progradwebspring.model.Usuario;
import br.edu.ufabc.progradwebspring.crypt.BCrypt;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by lucaszanferrari on 7/28/16.
 */
public class UsuarioDAO {
    private Connection connection;

    public UsuarioDAO() {
        this.connection = new ConexaoBD().getConnection();
    }

    public UsuarioDAO(Connection connection) {
        this.connection = connection;
    }

    // cadastra um usuario
    public void cadastra(Usuario usuario) {
        String sql = "insert into usuarios (usuario, senha) values (?,?)";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            // criptografa a senha
            // salt: eh um texto gerado randomicamente que eh concatenado a senha antes de criptografa-la
            String senha = BCrypt.hashpw(usuario.getSenha(), BCrypt.gensalt());
            stmt.setString(1, usuario.getUsuario());
            stmt.setString(2, senha);
            stmt.execute();
            stmt.close();
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    // verifica se o usuario tem permissao de acesso
    public boolean checaPermissao(Usuario usuario) {
        boolean temPermissao = false;
        // obtem o Usuario cadastrado
        Usuario usuarioCad = getUsuario(usuario.getUsuario());
        if (usuario != null && usuarioCad != null) {
        // checa se a senha inserida eh igual a senha armazenada no BD
            temPermissao = BCrypt.checkpw(usuario.getSenha(), usuarioCad.getSenha());
        }
        return temPermissao;
    }

    // verifica se o usuario ja esta cadastrado no BD
    public boolean estaCadastrado(String usuario) {
        PreparedStatement stmt;
        String sql = "select * from usuarios where usuario = ?";
        try {
            stmt = connection.prepareStatement(sql);
            stmt.setString(1, usuario);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return true;
            }
            rs.close();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }

    // pega um Usuario do BD
    public Usuario getUsuario(String login) {
        Usuario usuario = null;
        PreparedStatement stmt;
        String sql = "select * from usuarios where usuario = ?";
        try {
            stmt = connection.prepareStatement(sql);
            stmt.setString(1, login);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                usuario = new Usuario();
                usuario.setUsuario(rs.getString("usuario"));
                usuario.setSenha(rs.getString("senha"));
            }
            rs.close();
            stmt.close();
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return usuario;
    }
}