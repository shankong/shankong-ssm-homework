package com.shankong.service.impl;

import com.shankong.mapper.ManagerMapper;
import com.shankong.pojo.Manager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Collections;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    private ManagerMapper managerMapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        System.out.println(username);
        Manager manager = managerMapper.findByManagerName(username);
        System.out.println(manager);
        if (manager == null) {
            throw new UsernameNotFoundException("账号或者密码错误 ");
        }
        return new User(
                manager.getManagerName(),
                manager.getManagerPwd(),
                "1".equals(manager.getManagerState()),
                true, true, true,
                Collections.emptyList()
        );
    }
}
