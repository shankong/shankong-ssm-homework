package com.shankong.controller;

import com.shankong.pojo.Manager;
import com.shankong.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ManagerController {
    @Autowired
    private ManagerService managerService;

    @GetMapping("/login")
    public String toLogin() {
        return "login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
    @PostMapping("/login")
    public String login(Manager manager, Model model, HttpSession session) {
        if(managerService.login(manager)){
            session.setAttribute("loginManager", manager);
            return "index";
        }else{
            model.addAttribute("error", "用户名或密码错误，请重新输入！");
            return "login";
        }
    }

    //分页查询
    @RequestMapping("/manager/findAllManager")
    public String findAllManager(@RequestParam(defaultValue = "1") int page, Model model) {
        int pageSize = 10;
        List<Manager> list = managerService.findByPage(page, pageSize);
        int totalCount = managerService.count();
        int totalPages = (totalCount + pageSize - 1) / pageSize;
        model.addAttribute("managerList", list);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("totalCount", totalCount);
        return "manager_list";
    }

    //数据库真删除
    @GetMapping("/manager/deleteManager")
    public String deleteManager(Integer id, @RequestParam(defaultValue = "1") int page) {
        managerService.deleteManager(id);
        return "redirect:/manager/findAllManager?page=" + page;
    }

    //更改状态码假删除,state=2为删除
    @GetMapping("/manager/updateManagerState")
    public String updateManagerState(Integer id, @RequestParam(defaultValue = "1") int page) {
        managerService.softDeleteManager(id);
        return "redirect:/manager/findAllManager?page=" + page;
    }

    //批量软删除
    @PostMapping("/manager")
    public String batchDelete(String type, @RequestParam("managerId") List<Integer> ids,
                              @RequestParam(defaultValue = "1") int page) {
        if ("delByIds".equals(type) && ids != null) {
            for (Integer id : ids) {
                managerService.softDeleteManager(id);
            }
        }
        return "redirect:/manager/findAllManager?page=" + page;
    }

    @GetMapping("/manager/findById")
    public String findById(Integer id, Model model, @RequestParam(defaultValue = "1") int page) {
        Manager manager = managerService.findById(id);
        model.addAttribute("manager", manager);
        model.addAttribute("page", page);
        return "manager_update";
    }

    @PostMapping("/manager/updateManager")
    public String updateManager(Manager manager, @RequestParam(defaultValue = "1") int page) {
        managerService.updateManager(manager);
        return "redirect:/manager/findAllManager?page=" + page;
    }

    @GetMapping("/manager/toAddManager")
    public String toAddManager() {
        return "manager_addManager";
    }

    @PostMapping("/manager/toAddManager")
    public String addManager(Manager manager, @RequestParam(defaultValue = "1") int page) {
        managerService.toAddManager(manager);
        return "redirect:/manager/findAllManager" + page;
    }

}
