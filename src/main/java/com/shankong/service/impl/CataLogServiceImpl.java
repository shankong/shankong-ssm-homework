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

    @Override
    public void updateCatalog(CataLog catalog) {
        cataLogMapper.updateCatalog(catalog);
    }

    @Override
    public void moveUp(Integer catalogId) {
        CataLog catalog = cataLogMapper.findById(catalogId);
        Integer currentOrder = catalog.getSortOrder();
        if (currentOrder == null) return;

        CataLog previous = cataLogMapper.selectPrevious(currentOrder);
        if (previous == null) return;

        int tempOrder = -1;
        cataLogMapper.updateSortOrder(catalogId, tempOrder);
        cataLogMapper.updateSortOrder(previous.getCatalogId(), currentOrder);
        cataLogMapper.updateSortOrder(catalogId, previous.getSortOrder());
    }

    @Override
    public void moveDown(Integer catalogId) {
        CataLog catalog = cataLogMapper.findById(catalogId);
        Integer currentOrder = catalog.getSortOrder();
        if (currentOrder == null) return;

        CataLog next = cataLogMapper.selectNext(currentOrder);
        if (next == null) return;

        int tempOrder = -1;
        cataLogMapper.updateSortOrder(catalogId, tempOrder);
        cataLogMapper.updateSortOrder(next.getCatalogId(), currentOrder);
        cataLogMapper.updateSortOrder(catalogId, next.getSortOrder());
    }
}
