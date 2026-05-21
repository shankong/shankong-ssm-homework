package com.shankong.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Manager {
    private String managerId;
    private String managerName;
    private String managerPwd;
    private String managerState;
}
