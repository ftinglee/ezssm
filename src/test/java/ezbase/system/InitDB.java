package ezbase.system;

import ezbase.BaseTest;
import ezbase.core.utils.EncryptUtil;
import ezbase.core.utils.UuidUtil;
import ezbase.system.model.Menu;
import ezbase.system.model.Role;
import ezbase.system.model.User;
import ezbase.system.service.MenuService;
import ezbase.system.service.RoleService;
import ezbase.system.service.UserService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Arrays;

/**
 * Created by leezhao on 16/11/14.
 */
public class InitDB  extends BaseTest {

    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;
    @Autowired
    private MenuService menuService;

    @Test
    public void testInitUser() {
        User user = new User();
        user.setId(UuidUtil.generateId());
        user.setUsername("ftinglee");
        user.setName("Lee");
        user.setSalt(UuidUtil.generateSalt());
        user.setPassword(EncryptUtil.encrypt("ftinglee" + user.getSalt()));
        user.setLoginFlag("0");
        user.setDelFlag("0");
        userService.addUser(user);

        Role role = new Role();
        role.setId(UuidUtil.generateId());
        role.setName("系统管理员");
        role.setDelFlag("0");
        roleService.addRole(role);

        Menu menu = new Menu();
        menu.setId(UuidUtil.generateId());
        menu.setName("系统管理");
        menu.setParentId("0");
        menu.setDelFlag("0");
        menuService.addMenu(menu);

        Menu menu1 = new Menu();
        menu1.setId(UuidUtil.generateId());
        menu1.setName("用户管理");
        menu1.setParentId(menu.getId());
        menu1.setDelFlag("0");
        menuService.addMenu(menu1);

        Menu menu2 = new Menu();
        menu2.setId(UuidUtil.generateId());
        menu2.setName("角色管理");
        menu2.setParentId(menu.getId());
        menu2.setDelFlag("0");
        menuService.addMenu(menu2);

        userService.configRoles(user.getId(), Arrays.asList(role.getId()));

        roleService.configMenus(role.getId(), Arrays.asList(menu.getId(),menu1.getId(),menu2.getId()));

    }
}
