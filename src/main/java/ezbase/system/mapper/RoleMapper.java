package ezbase.system.mapper;

import ezbase.system.model.Menu;
import ezbase.system.model.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoleMapper extends IMapper<Role>{

    Role getRolesByUserId(String userId);

    Integer deleteRoleMenus(String roleId);

    Integer configMenus(@Param("roleId") String roleId,@Param("menus") List<Menu> menus);

}
