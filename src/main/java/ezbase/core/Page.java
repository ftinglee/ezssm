package ezbase.core;

import java.io.Serializable;
import java.util.List;

public class Page<T> implements Serializable {

    //返回结果
    private Integer total;
    private List rows;

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public List getRows() {
        return rows;
    }

    public void setRows(List rows) {
        this.rows = rows;
    }
}
