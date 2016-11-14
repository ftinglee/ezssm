/**
 * Created by LeeZhao on 16/10/11.
 **/
package ezbase.system.controller;

import ezbase.core.utils.EncryptUtil;
import ezbase.system.model.User;
import ezbase.system.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * <p>初始化</p>
 * @author LeeZhao
 * @date 16/10/11
 * @version 1.0
 **/
@Controller
public class IndexController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/home")
    public String index(Model model){
        model.addAttribute("msg","welcome to my home");
        return "login";
    }

    @RequestMapping(value = "/login")
    public String login(User formUser,Model model){
        boolean passChecked = false;
        if(formUser.getUsername() != null && formUser.getPassword() != null) {
            User user = userService.getByUsername(formUser.getUsername());
            if(user == null){
                model.addAttribute("msg","用户不存在");
            }else if(formUser.getPassword().equals(EncryptUtil.encrypt(user.getPassword() + user.getSalt()))){
                model.addAttribute("user",user);
                passChecked = true;
            }else {
                model.addAttribute("msg","密码错误");
            }
        }else {
            model.addAttribute("msg","用户名或密码不能为空");
        }
        return passChecked ? "index" : "login";
    }
}
