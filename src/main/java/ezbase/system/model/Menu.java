package ezbase.system.model;

import java.io.Serializable;

/**
 * <p>菜单实体</p>
 * @date 16/10/14
 * @version 1.0
 **/
public class Menu implements Serializable {

    private String id;
    private String name;
    private String parentId;
    private Integer Sort;
    private String href;
    private String remarks;
    private String useableFlag;
    private String delFlag;

    private Menu parent;

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

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    public Integer getSort() {
        return Sort;
    }

    public void setSort(Integer sort) {
        Sort = sort;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getUseableFlag() {
        return useableFlag;
    }

    public void setUseableFlag(String useableFlag) {
        this.useableFlag = useableFlag;
    }

    public String getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag;
    }

    public Menu getParent() {
        return parent;
    }

    public void setParent(Menu parent) {
        this.parent = parent;
    }
}
