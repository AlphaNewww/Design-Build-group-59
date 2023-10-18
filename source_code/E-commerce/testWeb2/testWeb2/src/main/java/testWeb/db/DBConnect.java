
package testWeb.db;

import java.io.PrintStream;
import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect
{
    private Connection conn;

    public DBConnect()
    {
        conn = null;
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:1919/javawebdb?useUnicode=true&allowPublicKeyRetrieval=true&useSSL=false&characterEncoding=UTF-8", "root", "2021212567");
        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
        }
    }

    public Connection getConnection()
    {
        return conn;
    }

    public void close()
    {
        try
        {
            conn.close();
        }
        catch(Exception exception) { }
    }
}
