package ezbase.system.controller;

import ezbase.core.Page;
import ezbase.core.ResponseMap;
import ezbase.system.model.Role;
import ezbase.system.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller
@RequestMapping(value = "/role")
public class RoleController {

    @Autowired
    private RoleService roleService;

    @RequestMapping
    public String index(Model model){
        model.addAttribute("currentPage","/role");
        return "role";
    }
    @RequestMapping(value = "/e/{id}")
    public String edit(@PathVariable("id") String id,Model model){
        model.addAttribute("currentPage","/role");
        model.addAttribute("role",roleService.getById(id));
        return "role/edit";
    }
    @RequestMapping(value = "/a")
    public String add(Model model){
        model.addAttribute("currentPage","/role");
        return "role/add";
    }

    @RequestMapping(value = "/list")
    @ResponseBody
    public Page list(Map param){
        return roleService.listPage(param);
    }

    @RequestMapping(value = "/add")
    @ResponseBody
    public ResponseMap add(Role role){
        if(roleService.addRole(role)>0){
            return ResponseMap.create().state(1).msg("创建成功");
        }else {
            return ResponseMap.create().state(0).msg("创建失败");
        }
    }

    @RequestMapping(value = "/update")
    @ResponseBody
    public ResponseMap update(Role role){
        if(roleService.update(role)>0){
            return ResponseMap.create().state(1).msg("更新成功");
        }else {
            return ResponseMap.create().state(0).msg("更新失败");
        }
    }

    @RequestMapping(value = "/delete")
    @ResponseBody
    public ResponseMap delete(String id){
        if(roleService.deleteById(id)>0){
            return ResponseMap.create().state(1).msg("删除成功");
        }else {
            return ResponseMap.create().state(0).msg("删除失败");
        }
    }

    @RequestMapping(value = "/check")
    @ResponseBody
    public Boolean check(String name){
        return roleService.checkRoleExit(name)>0 ? false : true;
    }
}
