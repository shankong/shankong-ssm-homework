package com.shankong.service.impl;

import com.shankong.mapper.CataLogMapper;
import com.shankong.pojo.CataLog;
import com.shankong.service.CataLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CataLogServiceImpl implements CataLogService {
    @Autowired
    private CataLogMapper cataLogMapper;

    @Override
    public List<CataLog> findByPage(int page, int pageSize) {
        int offset = (page - 1) * pageSize;
        return cataLogMapper.findByPage(offset, pageSize);
    }

    @Override
    public int count() {
        return cataLogMapper.count();
    }

    @Override
    public CataLog findById(Integer id) {
        return cataLogMapper.findById(id);
    }

    @Override
    public void softDeleteCatalog(Integer id) {
        cataLogMapper.softDeleteById(id);
    }
}
