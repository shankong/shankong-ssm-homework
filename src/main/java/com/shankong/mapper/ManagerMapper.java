package com.shankong.mapper;

import com.shankong.pojo.Manager;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ManagerMapper {
    public Manager findByNameAndPwd(Manager manager);

    //List<Manager> findAllManager();

    List<Manager> findByPage(@Param("offset") int offset, @Param("limit") int limit);

    int count();

    int deleteById(Integer id);

    int softDeleteById(Integer id);

    int updateManager(Manager manager);

    Manager findById(Integer id);

    void toAddManager(Manager manager);
}
