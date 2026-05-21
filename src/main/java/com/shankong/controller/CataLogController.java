package com.shankong.controller;

import com.shankong.pojo.CataLog;
import com.shankong.service.CataLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class CataLogController {
    @Autowired
    private CataLogService cataLogService;

    //分页查询
    @RequestMapping("/catalog/findAllCatalog")
    public String findAllCatalog(@RequestParam(defaultValue = "1") int page, Model model) {
        int pageSize = 5;
        List<CataLog> list = cataLogService.findByPage(page, pageSize);
        int totalCount = cataLogService.count();
        int totalPages = (totalCount + pageSize - 1) / pageSize;
        model.addAttribute("catalogList", list);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("totalCount", totalCount);
        return "catalog_list";
    }

    //软删除
    @GetMapping("/catalog/deleteCatalog")
    public String deleteCatalog(Integer id) {
        cataLogService.softDeleteCatalog(id);
        return "redirect:/catalog/findAllCatalog";
    }

    //批量软删除
    @PostMapping("/catalog")
    public String batchDelete(String type, @RequestParam("catalogId") List<Integer> ids) {
        if ("delByIds".equals(type) && ids != null) {
            for (Integer id : ids) {
                cataLogService.softDeleteCatalog(id);
            }
        }
        return "redirect:/catalog/findAllCatalog";
    }

    //按ID查询
    @GetMapping("/catalog/findById")
    public String findById(Integer id, Model model) {
        CataLog catalog = cataLogService.findById(id);
        model.addAttribute("catalog", catalog);
        return "catalog_update";
    }
}
