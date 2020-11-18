package cn.dpocket.crm.vo;

import java.util.List;

/**
 * ClassName:PaginationVO
 * Package:cn.dpocket.crm.vo
 * Description:
 * Date:2020/11/17 16:25
 * Author: anson
 */
public class PaginationVO<T> {
    private int total;
    private List<T> dataList;

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public List<T> getDataList() {
        return dataList;
    }

    public void setDataList(List<T> dataList) {
        this.dataList = dataList;
    }
}
