package ezbase.system.controller;

import ezbase.core.Page;
import ezbase.core.ResponseMap;
import ezbase.core.manager.SessionManager;
import ezbase.core.utils.EncryptUtil;
import ezbase.system.model.User;
import ezbase.system.service.RoleService;
import ezbase.system.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;
import java.util.Map;

@Controller
@RequestMapping(value = "/user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private RoleService roleService;

    @RequestMapping
    public String index(Model model){
        model.addAttribute("currentPage","/user");
        return "user";
    }

    @RequestMapping(value = "/e/{username}")
    public String edit(@PathVariable("username") String username,Model model){
        model.addAttribute("currentPage","/user");
        model.addAttribute("user",userService.getByUsername(username));
        model.addAttribute("roles",roleService.listPage(null).getRows());
        return "user/edit";
    }
    @RequestMapping(value = "/a")
    public String add(Model model){
        model.addAttribute("currentPage","/user");
        model.addAttribute("roles",roleService.listPage(null).getRows());
        return "user/add";
    }

    @RequestMapping(value = "/list")
    @ResponseBody
    public Page list(Map param){
        return userService.listPage(param);
    }

    @RequestMapping(value = "/add")
    @ResponseBody
    public ResponseMap add(User user,String roleIds){
        if(userService.addUser(user,Arrays.asList(roleIds.split(",")))>0){
            return ResponseMap.create().state(1).msg("创建成功");
        }else {
            return ResponseMap.create().state(0).msg("创建失败");
        }
    }

    @RequestMapping(value = "/update")
    @ResponseBody
    public ResponseMap update(User user,String roleIds){
        if((roleIds != null && userService.updateUser(user, Arrays.asList(roleIds.split(",")))>0)
                || (roleIds == null && userService.update(user)>0)){
            //更新session
            SessionManager.updateSessionAttribute(SessionManager.USER,userService.getById(user.getId()));
            return ResponseMap.create().state(1).msg("更新成功");
        }else {
            return ResponseMap.create().state(0).msg("更新失败");
        }
    }

    @RequestMapping(value = "/delete")
    @ResponseBody
    public ResponseMap delete(String id){
        if(userService.deleteById(id)>0){
            return ResponseMap.create().state(1).msg("删除成功");
        }else {
            return ResponseMap.create().state(0).msg("删除失败");
        }
    }

    @RequestMapping(value = "/check")
    @ResponseBody
    public Boolean check(String username){
        return userService.checkUserExit(username)>0 ? false : true;
    }

    @RequestMapping(value = "/password")
    @ResponseBody
    public ResponseMap delete(String old_pass,String new_pass){
        User user = (User) SessionManager.getSession().getAttribute(SessionManager.USER);
        if(user.getPassword().equals(EncryptUtil.encrypt(old_pass + user.getSalt())) == false){
            return ResponseMap.create().state(0).msg("原密码错误");
        }
        User tempUser = new User();
        tempUser.setId(user.getId());
        tempUser.setPassword(EncryptUtil.encrypt(new_pass + user.getSalt()));
        if(userService.update(tempUser)>0){
            return ResponseMap.create().state(1).msg("修改成功");
        }else {
            return ResponseMap.create().state(0).msg("修改失败");
        }
    }

}
