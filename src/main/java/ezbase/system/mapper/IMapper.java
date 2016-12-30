package ezbase.system.mapper;

import java.util.List;
import java.util.Map;

public interface IMapper<T> {

    T getById(String id);

    Integer insert(T model);

    Integer deleteById(String id);

    Integer update(T model);

    Integer countByParam(Map param);

    List<T> listByParam(Map param);
}
