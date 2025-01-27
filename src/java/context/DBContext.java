package context;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBContext {
       public Connection conn = null;
    public PreparedStatement ps;
    public ResultSet rs;

    public DBContext(String url, String user, String pass) {
        try {
            // call Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            //connect
            conn = DriverManager.getConnection(url, user, pass);
            System.out.println("connected");
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println("Can't connect to database");
        }
    }

    public ResultSet getData(String sql) {
        ResultSet rs = null;
        Statement state;
        try {
            state = conn.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            rs = state.executeQuery(sql);
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return rs;
    }

    public DBContext() {
        //Don't forget to change the password
        this("jdbc:mysql://localhost:3306/mydb",
                "root", "123456");

    }

    public static void main(String[] args) {
        DBContext dbConnect = new DBContext();
        Connection connect = dbConnect.conn;
    }
}
