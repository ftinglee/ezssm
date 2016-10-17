package ezbase.system.service;

import ezbase.system.mapper.MenuMapper;
import ezbase.system.model.Menu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MenuService {

    @Autowired
    private MenuMapper menuMapper;

    public Integer addMenu(Menu menu){
        return menuMapper.insert(menu);
    }

    public Integer delMenu(String id) {
        return menuMapper.deleteById(id);
    }
}
