package com.shankong.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CataLog {
    private Integer catalogId;
    private String catalogName;
    private String catalogNumber;
    private Integer catalogState;
    private Integer sortOrder;
}
