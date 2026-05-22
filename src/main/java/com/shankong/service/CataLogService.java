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
    //修改栏目
    public void updateCatalog(CataLog catalog);
    //栏目上移
    public void moveUp(Integer catalogId);
    //栏目下移
    public void moveDown(Integer catalogId);
}
