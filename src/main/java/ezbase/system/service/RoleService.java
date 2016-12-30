package ezbase.system.service;

import ezbase.core.utils.UuidUtil;
import ezbase.system.mapper.RoleMapper;
import ezbase.system.model.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class RoleService extends BaseService<Role,RoleMapper>{

    public Integer addRole(Role role){
        role.setId(UuidUtil.generateId());
        return mapper.insert(role);
    }

    @Transactional
    public Integer configMenus(String roleId,List<String> menus){
        mapper.deleteRoleMenus(roleId);
        return mapper.configMenus(roleId, menus);
    }

    public Integer checkRoleExit(String name) {
        return mapper.checkRoleExit(name);
    }
}
