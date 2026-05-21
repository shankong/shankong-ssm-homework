package com.shankong.service.impl;

import com.shankong.mapper.ManagerMapper;
import com.shankong.pojo.Manager;
import com.shankong.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ManagerServiceImpl implements ManagerService {
    @Autowired
    private ManagerMapper managerMapper;

    @Override
    public boolean login(Manager manager) {
        Manager result = managerMapper.findByNameAndPwd(manager);
        return result != null && result.getManagerId() != null;
    }

   /* @Override
    public List<Manager> findAllManager() {
        List<Manager> managerList = managerMapper.findAllManager();
        for(Manager manager : managerList){
            manager.setManagerPwd("******");
            if(manager.getManagerState().equals("1")){
                manager.setManagerState("启用");
            }else if(manager.getManagerState().equals("0")){
                manager.setManagerState("禁用");
            }
        }
        return managerList;
    }*/

    @Override
    public List<Manager> findByPage(int page, int pageSize) {
        int offset = (page - 1) * pageSize;
        List<Manager> managerList = managerMapper.findByPage(offset, pageSize);
        for(Manager manager : managerList){
            manager.setManagerPwd("******");
            if(manager.getManagerState().equals("1")){
                manager.setManagerState("启用");
            }else if(manager.getManagerState().equals("0")){
                manager.setManagerState("禁用");
            }
        }
        return managerList;
    }

    @Override
    public int count() {
        return managerMapper.count();
    }

    @Override
    public void deleteManager(Integer id) {
        managerMapper.deleteById(id);
    }

    @Override
    public void softDeleteManager(Integer id) {
        managerMapper.softDeleteById(id);
    }

    @Override
    public void updateManager(Manager manager) {
        managerMapper.updateManager(manager);
    }

    @Override
    public Manager findById(Integer id) {
        return managerMapper.findById(id);
    }

    @Override
    public void toAddManager(Manager manager) {
        managerMapper.toAddManager(manager);
    }
}
