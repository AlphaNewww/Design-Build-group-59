
package testWeb.dao.impl;

import java.sql.*;
import java.util.*;
import testWeb.dao.RobotDao;
import testWeb.db.DBConnect;
import testWeb.vo.Robot;

public class RobotDaoImpl
    implements RobotDao
{

    public RobotDaoImpl()
    {
    }

    public List getRobotsByUsername(String username)
        throws Exception
    {
        String sql = "select id from userinfo where username=?";
        PreparedStatement pstmt = null;
        DBConnect dbc = null;
        List robots = new ArrayList();
        try
        {
            dbc = new DBConnect();
            pstmt = dbc.getConnection().prepareStatement(sql);
            pstmt.setString(1, username);
            int userid = 0;
            ResultSet rs;
            for(rs = pstmt.executeQuery(); rs.next();)
                userid = rs.getInt("id");

            rs.close();
            pstmt.close();
            List robotids = new ArrayList();
            sql = "select * from user_robot where userid=?";
            pstmt = dbc.getConnection().prepareStatement(sql);
            pstmt.setInt(1, userid);
            for(rs = pstmt.executeQuery(); rs.next(); robotids.add(Integer.valueOf(rs.getInt("robotid"))));
            Robot robot;
            for(Iterator iterator = robotids.iterator(); iterator.hasNext(); robots.add(robot))
            {
                int robotid = ((Integer)iterator.next()).intValue();
                robot = getRobotByRobotId(robotid);
            }

        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return robots;
    }

    public Robot getRobotByRobotId(int robotid)
        throws Exception
    {
        String sql = "select * from robot where id=?";
        PreparedStatement pstmt = null;
        DBConnect dbc = null;
        Robot robot = new Robot();
        try
        {
            dbc = new DBConnect();
            pstmt = dbc.getConnection().prepareStatement(sql);
            pstmt.setInt(1, robotid);
            ResultSet rs;
            for(rs = pstmt.executeQuery(); rs.next(); robot.setSize(rs.getString("size")))
            {
                robot.setId(robotid);
                robot.setName(rs.getString("name"));
                robot.setImgpath(rs.getString("imgpath"));
                robot.setModel(rs.getString("model"));
                robot.setColor(rs.getString("color"));
            }

            rs.close();
            pstmt.close();
            sql = "select * from robotrecord where id=?";
            pstmt = dbc.getConnection().prepareStatement(sql);
            pstmt.setInt(1, robotid);
            for(rs = pstmt.executeQuery(); rs.next(); robot.setSpeed(rs.getFloat("speed")))
            {
                robot.setAvgtime(rs.getFloat("avgtime"));
                robot.setScore(rs.getFloat("score"));
                robot.setPath(rs.getString("path"));
            }

            rs.close();
            pstmt.close();
            sql = "select * from robotphoto where robotid=?";
            pstmt = dbc.getConnection().prepareStatement(sql);
            pstmt.setInt(1, robotid);
            List photos = new ArrayList();
            String photopath;
            for(rs = pstmt.executeQuery(); rs.next(); photos.add(photopath))
                photopath = rs.getString("photopath");

            robot.setPhotos(photos);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return robot;
    }

    public Robot saveRobotByRobotId(int robotid, String model, String color, String size, String imgpath)
        throws Exception
    {
        String sql = "update robot set model=?, color=?, size=? where id=?";
        PreparedStatement pstmt = null;
        DBConnect dbc = null;
        Robot robot = new Robot();
        try
        {
            dbc = new DBConnect();
            pstmt = dbc.getConnection().prepareStatement(sql);
            pstmt.setString(1, model);
            pstmt.setString(2, color);
            pstmt.setString(3, size);
            pstmt.setInt(4, robotid);
            pstmt.executeUpdate();
            if(imgpath != null && imgpath.length() > 0)
            {
                sql = "update robot set imgpath=? where id=?";
                pstmt = dbc.getConnection().prepareStatement(sql);
                pstmt.setString(1, imgpath);
                pstmt.setInt(2, robotid);
                pstmt.executeUpdate();
            }
            robot = getRobotByRobotId(robotid);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return robot;
    }
}
