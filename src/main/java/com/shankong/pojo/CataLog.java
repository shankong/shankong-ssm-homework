package com.shankong.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CataLog {
    private String catalogId;
    private String catalogName;
    private String catalogNumber;
    private Integer catalogState;
}
