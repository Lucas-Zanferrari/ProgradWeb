package br.edu.ufabc.progradwebspring.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Created by lucaszanferrari on 7/28/16.
 */
public class ConexaoBD {
    // cria uma conexao com o BD

    public Connection getConnection(){
        System.out.println("Conectando ao banco de dados");
        try {
            String url = "jdbc:mysql://localhost/progweb";
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection(url, "root", "root");
        }
        catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
