package com.shankong.service;

import com.shankong.pojo.Manager;

import java.util.List;

public interface ManagerService {
    //登录
    public boolean login(Manager manager);
    //查询所有管理员
    //public List<Manager> findAllManager();
    //分页查询管理员
    public List<Manager> findByPage(int page, int pageSize);
    //查询管理员总数
    public int count();
    //根据id删除管理员
    public void deleteManager(Integer id);
    //根据id软删除管理员(state=2)
    public void softDeleteManager(Integer id);
    //修改管理员
    public void updateManager(Manager manager);
    //根据id查询管理员
    public Manager findById(Integer id);
    //添加管理员
    public void toAddManager(Manager manager);
}
