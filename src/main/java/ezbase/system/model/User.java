/**
 * Created by LeeZhao on 16/10/14.
 **/
package ezbase.system.model;

import java.io.Serializable;

/**
 * <p>${功能描述}</p>
 * @author LeeZhao
 * @date 16/10/14
 * @version 1.0
 **/
public class User implements Serializable {

    private String id;
    private String name;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
