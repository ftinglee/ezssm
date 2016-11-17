package ezbase.system.service;

import ezbase.system.mapper.UserMapper;
import ezbase.system.model.Role;
import ezbase.system.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;

    public User getByUsername(String username){
        return userMapper.getByUsername(username);
    }

    public Integer addUser(User user){
        return userMapper.insert(user);
    }

    public Integer delUser(String id) {
        return userMapper.deleteById(id);
    }

    public Integer updateUser(User user){
        return userMapper.update(user);
    }
    @Transactional
    public Integer configRoles(String userId,List<String> roles){
        userMapper.deleteUserRoles(userId);
        return userMapper.configRoles(userId,roles);
    }
}
