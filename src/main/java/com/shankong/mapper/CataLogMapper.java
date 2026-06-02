package com.shankong.mapper;

import com.shankong.pojo.CataLog;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CataLogMapper {
    List<CataLog> findByPage(@Param("offset") int offset, @Param("limit") int pageSize);

    int count();

    CataLog findById(@Param("id") Integer id);

    int softDeleteById(@Param("id") Integer id);

    int batchSoftDelete(@Param("ids") List<Integer> ids);

    int updateCatalog(CataLog catalog);

    CataLog selectPrevious(@Param("sortOrder") Integer sortOrder);

    CataLog selectNext(@Param("sortOrder") Integer sortOrder);

    int updateSortOrder(@Param("catalogId") Integer catalogId, @Param("sortOrder") Integer sortOrder);

    void addCatalog(CataLog catalog);
}
