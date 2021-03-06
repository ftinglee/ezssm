package ezbase.system.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>菜单实体</p>
 * @date 16/10/14
 * @version 1.0
 **/
public class Menu implements Serializable {

    private String id;
    private String name;
    private String parentId;
    private Integer sort;
    private String icon;
    private String href;
    private String remarks;
    private String useableFlag;
    private String delFlag;

    private List<Menu> children = new ArrayList<>();

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
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
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

    public List<Menu> getChildren() {
        return children;
    }

    public void setChildren(List<Menu> children) {
        this.children = children;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof Menu) {
            Menu menu = (Menu) obj;
            return (id.equals(menu.id));
        }
        return super.equals(obj);
    }

    @Override
    public int hashCode() {
        return id.hashCode();
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }
}
