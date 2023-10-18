
package testWeb.dao;

import testWeb.vo.UserInfo;

public interface RegisterDAO
{

    public abstract int addUserInfo(UserInfo userinfo)
        throws Exception;
}
