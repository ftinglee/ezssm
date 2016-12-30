package ezbase.system.mapper;

import ezbase.system.model.Role;
import ezbase.system.model.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface UserMapper extends IMapper<User> {

    User getByUsername(String username);

    Integer deleteUserRoles(String userId);

    Integer configRoles(@Param("userId") String userId,@Param("roles") List<String> roles);

    Integer getUserCount(Map param);

    List<User> listUser(Map param);

    Integer checkUserExit(String username);
}
