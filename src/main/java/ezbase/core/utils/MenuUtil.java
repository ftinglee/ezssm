package ezbase.core.utils;

import ezbase.system.model.Menu;
import ezbase.system.model.Role;

import java.util.ArrayList;
import java.util.List;


public class MenuUtil {

    public static List<Menu> combineMenus(List<Role> roles){
        List<Menu> menus = new ArrayList<>();
        for(int i=0,len=roles.size();i<len;i++){
            if(i==0){
                menus = roles.get(0).getMenus();
            }else{
                //菜单去重
                menus.removeAll(roles.get(i).getMenus());
                menus.addAll(roles.get(i).getMenus());
            }
        }
        return generalMenus(menus);
    }

    public static List<Menu> generalMenus(List<Menu> menus){

        //菜单去重,注意contains,需要重写menu的equals hashcode方法
        List<Menu> list= new ArrayList<Menu>();
        for(Menu menu : menus){
            if(!list.contains(menu)){
                list.add(menu);
            }
        }
        List<Menu> result= new ArrayList<Menu>();

        for(Menu parent : list){
            if("0".equals(parent.getParentId()) && !result.contains(parent)){
                result.add(parent);
            }
            for(Menu child: list){
                if(!parent.equals(child) && parent.getId().equals(child.getParentId())){
                    parent.getChildren().add(child);
                }
            }
        }

        return result;
    }

    public static void serializeMenus(List<Menu> list,String parentId,List<Menu> result){
        for(Menu Menu : list){
            if(parentId.equals(Menu.getParentId())){
                result.add(Menu);
                serializeMenus(list, Menu.getId(), Menu.getChildren());
            }
        }
    }
}
