package ezbase.system.service;

import ezbase.core.Page;
import ezbase.system.mapper.IMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by leezhao on 16/12/28.
 */
public abstract class BaseService<T,M extends IMapper> {

    @Autowired
    public M mapper;

    public T getById(String id){
        return (T) mapper.getById(id);
    }

    public int insert(T record){
        return mapper.insert(record);
    }

    public int update(T record){
        return mapper.update(record);
    }

    public int deleteById(String id){
        return mapper.deleteById(id);
    }

    public Page<T> listPage(Map param){
        Integer count = mapper.countByParam(param);
        List<T> list = mapper.listByParam(param);
        Page<T> page = new Page();
        page.setTotal(count);
        page.setRows(list);
        return page;
    }
}
