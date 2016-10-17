package ezbase.system.mapper;

public interface IMapper<T> {

    T getById(String id);

    Integer insert(T model);

    Integer deleteById(String id);

}
