package context;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {

          private final String url = "jdbc:mysql://localhost:3306/world";
          private final String user = "root";
          private final String password = "123456";

          public Connection getConnection() throws SQLException {
                    return DriverManager.getConnection(url, user, password);
          }
}
