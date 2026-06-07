package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionBD {
    // Ajusta el usuario y contraseña según la configuración de tu MySQL local
    // Asegúrate de usar el puerto estándar 3306 (a menos que tu Workbench diga otro)
private static final String URL = "jdbc:mysql://localhost:3306/microbiz_sim?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
private static final String USER = "root";
private static final String PASSWORD = "root"; // <-- Pon aquí la contraseña que usas para entrar a MySQL Workbench

    public static Connection getConexion() {
        Connection conexion = null;
        try {
            // Registrar el Driver de MySQL (indispensable para Tomcat)
            Class.forName("com.mysql.cj.jdbc.Driver");
            conexion = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("¡Conexión exitosa a MicroBiz Sim!");
        } catch (ClassNotFoundException e) {
            System.out.println("Error: No se encontró el Driver de MySQL.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("Error al conectar a la base de datos.");
            e.printStackTrace();
        }
        return conexion;
    }
}