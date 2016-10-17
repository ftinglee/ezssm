package ezbase.system;

import com.alibaba.fastjson.JSON;
import ezbase.BaseTest;
import ezbase.core.utils.UuidUtil;
import ezbase.system.model.Role;
import ezbase.system.model.User;
import ezbase.system.service.RoleService;
import ezbase.system.service.UserService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;

public class RoleTest extends BaseTest {

    @Autowired
    private RoleService roleService;

    @Test
    public void testAddRole() {
        Role role = new Role();
        role.setId(UuidUtil.generateId());
        role.setName("menu1");
        role.setDelFlag("0");
        roleService.addRole(role);
    }

}
