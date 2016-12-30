package ezbase.system.controller;

import ezbase.core.ResponseMap;
import ezbase.core.manager.SessionManager;
import ezbase.system.model.User;
import ezbase.system.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;

@Controller
@RequestMapping(value = "/profile")
public class ProfileController {

    @Autowired
    private UserService userService;

    @RequestMapping
    public String index(Model model){
        model.addAttribute("currentPage","/profile");
        return "profile";
    }

    @RequestMapping("/upload")
    public Object upload(@RequestParam(value="avatar_file", required=true) MultipartFile file){
        User user = (User) SessionManager.getSession().getAttribute(SessionManager.USER);
        String path = SessionManager.getSession().getServletContext().getRealPath("file/"+user.getUsername());
        //String fileName = file.getOriginalFilename();
        String prefix = ".jpg";//fileName.substring(fileName.lastIndexOf("."));
        File targetFile = new File(path, "avatar.jpg");
        if(!targetFile.exists()){
            targetFile.mkdirs();
        }
        try {
            file.transferTo(targetFile);
        } catch (Exception e) {
            e.printStackTrace();
        }
        String avatarPath = "file/"+user.getUsername()+"/avatar"+prefix;
        User tempUser = new User();
        tempUser.setId(user.getId());
        tempUser.setAvatar(avatarPath);
        int success = userService.update(tempUser);
        if(success>0){
            user.setAvatar(avatarPath);
            SessionManager.updateSessionAttribute(SessionManager.USER,user);
        }
        return ResponseMap.create().state(success).data(targetFile.getPath());
    }

}
