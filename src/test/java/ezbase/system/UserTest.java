package ezbase.system;

import com.alibaba.fastjson.JSON;
import ezbase.BaseTest;
import ezbase.core.utils.UuidUtil;
import ezbase.system.model.User;
import ezbase.system.service.UserService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;

import java.util.Arrays;
import java.util.List;

public class UserTest extends BaseTest {

    @Autowired
    private UserService userService;

    @Test
    public void testAddUser() {
        User user = new User();
        user.setId(UuidUtil.generateId());
        user.setUsername("ftinglee1");
        user.setPassword("ftinglee");
        user.setSalt(UuidUtil.generateSalt());
        user.setDelFlag("0");
        userService.addUser(user);
    }

    @Test
    public void testGetUser() {
        User user = userService.getByUsername("ftinglee");
        System.out.println(JSON.toJSON(user));
    }

    @Test
    public void testDelUser() {
        Assert.isTrue(userService.delUser("12") == 1);
    }

    @Test
    public void testConfigUser() {
        User user = userService.getByUsername("ftinglee");
        List<String> roles = Arrays.asList("XxM3H04zQFK6oALcWp_vAg");
        userService.configRoles(user.getId(),roles);
    }
}
