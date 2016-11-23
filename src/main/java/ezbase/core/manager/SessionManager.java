package ezbase.core.manager;

import ezbase.system.model.Menu;
import ezbase.system.model.User;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

public abstract class SessionManager {

    public static final String USER = "user";

    public static final String MENUS = "menus";


    public static HttpServletRequest getRequest(){
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        return request;
    }

    public static HttpServletResponse getResponse(){
        HttpServletResponse response = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getResponse();
        return response;
    }

    public static HttpSession getSession(){
        return getRequest().getSession();
    }


    public static Object getSessionAttribute(String key){
        return getSession().getAttribute(key);
    }

    public static void updateSessionAttribute(String key,Object o){
        if(getSession().getAttribute(key) != null){
            getSession().setAttribute(key,o);
        }
    }

    public static void addUserSession(User user){

        getSession().setAttribute(USER, user);

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
        getSession().setAttribute(MENUS, result);

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
