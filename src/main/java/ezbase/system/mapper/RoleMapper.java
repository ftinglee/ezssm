package ezbase.system.mapper;

import ezbase.system.model.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface RoleMapper extends IMapper<Role>{

    Role getRolesByUserId(String userId);

    Integer deleteRoleMenus(String roleId);

    Integer configMenus(@Param("roleId") String roleId,@Param("menus") List<String> menus);

    Integer getRoleCount(Map param);

    List<Role> listRole(Map param);

    Integer checkRoleExit(String name);
}
