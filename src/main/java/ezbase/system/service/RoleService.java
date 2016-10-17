package ezbase.system.service;

import ezbase.system.mapper.RoleMapper;
import ezbase.system.model.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoleService {

    @Autowired
    private RoleMapper roleMapper;

    public Integer addRole(Role role){
        return roleMapper.insert(role);
    }

    public Integer delRole(String id) {
        return roleMapper.deleteById(id);
    }
}
