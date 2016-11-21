package ezbase.core.utils;

import ezbase.system.model.Menu;
import ezbase.system.model.User;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

public class SessionUtil {

    public static final String USER = "user";

    public static final String MENUS = "menus";

    public static Object getSessionAttribute(HttpServletRequest request,String key){
        return request.getSession().getAttribute(key);
    }
    public static void updateSessionAttribute(HttpServletRequest request,String key,Object o){
        if(request.getSession().getAttribute(key) != null){
            request.getSession().setAttribute(key,o);
        }
    }

    public static void addUserSession(HttpServletRequest request,User user){

        request.getSession().setAttribute(USER, user);

        List<Menu> menus = new ArrayList<>();
        for(int i=0,len=user.getRoles().size();i<len;i++){
            if(i==0){
                menus = user.getRoles().get(0).getMenus();
            }else{
                //菜单去重
                menus.removeAll(user.getRoles().get(i).getMenus());
                menus.addAll(user.getRoles().get(i).getMenus());
            }
        }
        List<Menu> result= new ArrayList<>();

        serializeMenus(menus, "0", result);
        request.getSession().setAttribute(MENUS, result);

    }

    public static void serializeMenus(List<Menu> list,String parentId,List<Menu> result){
        for(Menu Menu : list){
            if(parentId.equals(Menu.getParentId())){
                result.add(Menu);
                serializeMenus(list, Menu.getId(), Menu.getChildren());
            }
        }
    }

    public static List<Menu> generalMenus(List<Menu> menus){

        List<Menu> result= new ArrayList<Menu>();

        for(Menu parent : menus){
            if("0".equals(parent.getParentId()) && !result.contains(parent)){
                result.add(parent);
            }
            for(Menu child: menus){
                if(!parent.equals(child) && parent.getId().equals(child.getParentId())){
                    parent.getChildren().add(child);
                }
            }
        }

        return result;
    }
}
