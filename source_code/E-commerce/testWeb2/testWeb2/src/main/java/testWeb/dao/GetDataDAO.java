
package testWeb.dao;

import testWeb.vo.Data;
import testWeb.vo.UserInfo;

import java.util.List;

public interface GetDataDAO
{

    public abstract List<Data> getDataByRobotId(int robotId)
        throws Exception;
}
