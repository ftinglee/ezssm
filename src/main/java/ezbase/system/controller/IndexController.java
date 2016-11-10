/**
 * Created by LeeZhao on 16/10/11.
 **/
package ezbase.system.controller;

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

    @RequestMapping(value = "/home")
    public String index(Model model){
        model.addAttribute("msg","welcome to my home");
        return "login";
    }
}
