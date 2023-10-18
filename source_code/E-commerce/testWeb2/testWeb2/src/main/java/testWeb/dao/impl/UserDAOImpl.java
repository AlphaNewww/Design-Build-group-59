
package testWeb.dao.impl;

import java.io.PrintStream;
import java.sql.*;
import testWeb.dao.UserDAO;
import testWeb.db.DBConnect;
import testWeb.vo.User;
import testWeb.vo.UserInfo;

public class UserDAOImpl
    implements UserDAO
{

    public UserDAOImpl()
    {
    }

    @Override
    public int queryByUserInfo(UserInfo userinfo) throws Exception {
        // TODO Auto-generated method stub
        int flag = 0;
        String sql = "select * from userinfo where username=?";
        PreparedStatement pstmt = null;
        DBConnect dbc = null;

        try {
            dbc = new DBConnect();
            pstmt = dbc.getConnection().prepareStatement(sql);
            pstmt.setString(1, userinfo.getUsername());

            ResultSet rs = pstmt.executeQuery();
            while(rs.next()) {
                if(rs.getString("password").equals(userinfo.getPassword())) {
                    flag = 1;
                }
            }
            rs.close();
            pstmt.close();
        }catch(SQLException e) {
            System.out.println(e.getMessage());
        }finally {
            dbc.close();
        }
        return flag;
    }

    public User getUserInfoByUsername(String username)
        throws Exception
    {
        String sql = "select id from userinfo where username=?";
        DBConnect dbc = null;
        User user = new User();
        user.setUsername(username);
        PreparedStatement pstmt = null;
        try
        {
            dbc = new DBConnect();
            pstmt = dbc.getConnection().prepareStatement(sql);
            pstmt.setString(1, username);
            int id = 0;
            ResultSet rs;
            for(rs = pstmt.executeQuery(); rs.next();)
                id = rs.getInt("id");

            sql = "select * from userprofile where id=?";
            rs.close();
            pstmt.close();
            pstmt = dbc.getConnection().prepareStatement(sql);
            pstmt.setInt(1, id);
            String imgpath;
            for(rs = pstmt.executeQuery(); rs.next(); user.setImgpath(imgpath))
            {
                String email = rs.getString("email");
                String tel = rs.getString("tel");
                imgpath = rs.getString("imgpath");
                user.setEmail(email);
                user.setTel(tel);
            }

            rs.close();
            pstmt.close();
        }catch(SQLException e) {
            System.out.println(e.getMessage());
        }finally {
            dbc.close();
        }
        return user;
    }

    public User changeUserByUsername(User user)
        throws Exception
    {
        String sql = "select id from userinfo where username=?";
        PreparedStatement pstmt = null;
        DBConnect dbc = null;
        try
        {
            dbc = new DBConnect();
            pstmt = dbc.getConnection().prepareStatement(sql);
            pstmt.setString(1, user.getUsername());
            int id = 0;
            ResultSet rs;
            for(rs = pstmt.executeQuery(); rs.next();)
                id = rs.getInt("id");

            rs.close();
            pstmt.close();
            if(user.getPassword() != null && user.getPassword().length() != 0)
            {
                sql = "update userinfo set password=? where id=?";
                pstmt = dbc.getConnection().prepareStatement(sql);
                pstmt.setString(1, user.getPassword());
                pstmt.setInt(2, id);
                pstmt.executeUpdate();
                pstmt.close();
            }
            if(user.getEmail() != null && user.getEmail().length() != 0)
            {
                sql = "update userprofile set email=? where id=?";
                pstmt = dbc.getConnection().prepareStatement(sql);
                pstmt.setString(1, user.getEmail());
                pstmt.setInt(2, id);
                pstmt.executeUpdate();
                pstmt.close();
            }
            if(user.getTel() != null && user.getTel().length() != 0)
            {
                sql = "update userprofile set tel=? where id=?";
                pstmt = dbc.getConnection().prepareStatement(sql);
                pstmt.setString(1, user.getTel());
                pstmt.setInt(2, id);
                pstmt.executeUpdate();
                pstmt.close();
            }
        }
        catch(SQLException e)
        {
            System.out.println(e.getMessage());
        }
        return user;
    }
}
