package ezbase.system.service;

import ezbase.core.utils.EncryptUtil;
import ezbase.core.utils.UuidUtil;
import ezbase.system.mapper.UserMapper;
import ezbase.system.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserService extends BaseService<User,UserMapper>{

    public User getByUsername(String username){
        return mapper.getByUsername(username);
    }

    public Integer addUser(User user){
        user.setId(UuidUtil.generateId());
        user.setSalt(UuidUtil.generateSalt());
        user.setPassword(EncryptUtil.encrypt(user.getPassword() + user.getSalt()));
        user.setDelFlag("0");
        return mapper.insert(user);
    }

    public Integer addUser(User user,List<String> roles){
        configRoles(user.getId(), roles);
        return addUser(user);
    }

    public Integer updateUser(User user,List<String> roles){
        configRoles(user.getId(), roles);
        return update(user);
    }

    @Transactional
    public Integer configRoles(String userId,List<String> roles){
        mapper.deleteUserRoles(userId);
        return mapper.configRoles(userId, roles);
    }

    public Integer checkUserExit(String username) {
        return mapper.checkUserExit(username);
    }


}
