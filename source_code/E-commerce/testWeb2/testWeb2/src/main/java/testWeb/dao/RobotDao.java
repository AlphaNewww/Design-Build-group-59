
package testWeb.dao;

import java.util.List;
import testWeb.vo.Robot;

public interface RobotDao
{

    public abstract List getRobotsByUsername(String s)
        throws Exception;

    public abstract Robot getRobotByRobotId(int i)
        throws Exception;

    public abstract Robot saveRobotByRobotId(int i, String s, String s1, String s2, String s3)
        throws Exception;
}
