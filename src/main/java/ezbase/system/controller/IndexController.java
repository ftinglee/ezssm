package ezbase.system.controller;

import ezbase.core.ResponseMap;
import ezbase.core.manager.SessionManager;
import ezbase.core.utils.EncryptUtil;
import ezbase.system.model.User;
import ezbase.system.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class IndexController{

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/home")
    public String index(Model model){
        return "redirect:/system";
    }

    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String toLogin(){
        boolean passChecked = (SessionManager.getSession().getAttribute(SessionManager.USER)!=null);
        return passChecked ? "redirect:/home" : "login";
    }

    @RequestMapping(value = "/logout",method = RequestMethod.GET)
    public String logout(){
        SessionManager.getSession().invalidate();
        return "login";
    }

    @ResponseBody
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public ResponseMap login(User formUser){
        if(formUser.getUsername() != null && formUser.getPassword() != null) {
            User user = userService.getByUsername(formUser.getUsername());
            //用户不存在或者用户没有指定角色
            if(user == null || user.getRoles().size()<1){
                return ResponseMap.create().state(0).msg("用户不存在");
            }else if(user.getPassword().equals(EncryptUtil.encrypt(formUser.getPassword() + user.getSalt()))){
                SessionManager.addUserSession(user);
                return ResponseMap.create().state(1).msg("登陆成功");
            }else {
                return ResponseMap.create().state(0).msg("密码错误");
            }
        }else {
            return ResponseMap.create().state(0).msg("用户名或密码不能为空");
        }
    }
}
