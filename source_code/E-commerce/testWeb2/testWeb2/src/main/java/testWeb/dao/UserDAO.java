
package testWeb.dao;

import testWeb.vo.User;
import testWeb.vo.UserInfo;

public interface UserDAO
{

    public abstract int queryByUserInfo(UserInfo userinfo)
        throws Exception;

    public abstract User getUserInfoByUsername(String s)
        throws Exception;

    public abstract User changeUserByUsername(User user)
        throws Exception;
}
