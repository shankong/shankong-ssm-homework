package com.shankong.service;

import com.shankong.pojo.CataLog;

import java.util.List;

public interface CataLogService {
    //分页查询栏目
    public List<CataLog> findByPage(int page, int pageSize);
    //查询栏目总数
    public int count();
    //根据id查询栏目
    public CataLog findById(Integer id);
    //软删除栏目
    public void softDeleteCatalog(Integer id);
}
