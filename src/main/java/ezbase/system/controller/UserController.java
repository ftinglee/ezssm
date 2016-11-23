package ezbase.system.controller;

import ezbase.core.manager.SessionManager;
import ezbase.core.utils.EncryptUtil;
import ezbase.system.model.User;
import ezbase.system.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/page")
    public String index(Model model){
        model.addAttribute("currentPage","/user/page");
        model.addAttribute("user",SessionManager.getSessionAttribute(SessionManager.USER));
        model.addAttribute("menus",SessionManager.getSessionAttribute(SessionManager.MENUS));
        return "user";
    }

}
