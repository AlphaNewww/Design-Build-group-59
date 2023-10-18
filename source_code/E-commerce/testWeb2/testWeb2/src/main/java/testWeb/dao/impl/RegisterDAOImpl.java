package testWeb.dao.impl;

import testWeb.dao.RegisterDAO;
import testWeb.vo.UserInfo;
import testWeb.db.DBConnect;

import java.sql.*;

public class RegisterDAOImpl implements RegisterDAO {

    public RegisterDAOImpl() {
    }

    public int addUserInfo(UserInfo userinfo) throws Exception {
        DBConnect dbc;
        String selectSQL = "SELECT * FROM userinfo WHERE username=?";
        String insertUserInfoSQL = "INSERT INTO userinfo (username, password) VALUES (?, ?)";
        String insertUserProfileSQL = "INSERT INTO userprofile (id) VALUES (?)";

        try {
            dbc = new DBConnect();
            Connection connection = dbc.getConnection();
            PreparedStatement selectStatement = connection.prepareStatement(selectSQL);
            PreparedStatement insertUserInfoStatement = connection.prepareStatement(insertUserInfoSQL, Statement.RETURN_GENERATED_KEYS);
            PreparedStatement insertUserProfileStatement = connection.prepareStatement(insertUserProfileSQL);

            selectStatement.setString(1, userinfo.getUsername());
            ResultSet rs = selectStatement.executeQuery();

            if (!rs.next()) { // 用户名不存在
                insertUserInfoStatement.setString(1, userinfo.getUsername());
                insertUserInfoStatement.setString(2, userinfo.getPassword());
                int affectedRows = insertUserInfoStatement.executeUpdate();

                if (affectedRows > 0) {
                    // 获取刚插入的用户的ID
                    ResultSet generatedKeys = insertUserInfoStatement.getGeneratedKeys();
                    if (generatedKeys.next()) {
                        int id = generatedKeys.getInt(1);

                        // 插入用户配置信息
                        insertUserProfileStatement.setInt(1, id);
                        insertUserProfileStatement.executeUpdate();

                        return 1; // 注册成功
                    }
                }
            }

            return 0; // 用户名已存在，注册失败
        } catch (SQLException e) {
            e.printStackTrace(); // 这里应该使用日志记录
            throw new Exception("注册失败"); // 抛出自定义异常或返回错误码
        }
    }
}
