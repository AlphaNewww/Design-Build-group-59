package testWeb.dao.impl;

import testWeb.dao.GetDataDAO;
import testWeb.dao.RegisterDAO;
import testWeb.db.DBConnect;
import testWeb.db.DataDBConnect;
import testWeb.vo.Data;
import testWeb.vo.Robot;
import testWeb.vo.UserInfo;

import java.sql.*;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;


public class GetDataDAOImpl implements GetDataDAO {

    public GetDataDAOImpl() {
    }

    public List getDataByRobotId(int robotId)
            throws Exception
    {
        String sql = "select * from car;";
        PreparedStatement pstmt = null;
        DataDBConnect dbc = null;
        List<Data> dataList = new ArrayList();
        try
        {
            dbc = new DataDBConnect();
            pstmt = dbc.getConnection().prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Data data = new Data();
                data.setId(rs.getInt("id"));
                data.setTime(rs.getDouble("time"));
                data.setFront_distance(rs.getDouble("front_distance"));
                data.setLeft_distance(rs.getDouble("left_distance"));
                data.setRight_distance(rs.getDouble("right_distance"));
                dataList.add(data);
            }
            pstmt.close();
            dbc.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return dataList;
    }

}
