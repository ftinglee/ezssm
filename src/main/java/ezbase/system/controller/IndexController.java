package ezbase.system.controller;

import ezbase.core.utils.EncryptUtil;
import ezbase.core.utils.SessionUtil;
import ezbase.system.model.User;
import ezbase.system.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class IndexController{

    @Autowired
    private UserService userService;

    @Autowired
    private HttpServletRequest request;

    @RequestMapping(value = "/home")
    public String index(Model model){
        model.addAttribute("user",SessionUtil.getSessionAttribute(request,SessionUtil.USER));
        model.addAttribute("menus",SessionUtil.getSessionAttribute(request,SessionUtil.MENUS));
        return "index";
    }

    @RequestMapping(value = "/login")
    public String login(User formUser,Model model){
        boolean passChecked = false;
        if(formUser.getUsername() != null && formUser.getPassword() != null) {
            User user = userService.getByUsername(formUser.getUsername());
            if(user == null){
                model.addAttribute("msg","用户不存在");
            }else if(user.getPassword().equals(EncryptUtil.encrypt(formUser.getPassword() + user.getSalt()))){

                SessionUtil.addUserSession(request,user);

                passChecked = true;
            }else {
                model.addAttribute("msg","密码错误");
            }
        }else {
            model.addAttribute("msg","用户名或密码不能为空");
        }
        return passChecked ? "redirect:/home" : "login";
    }
}
