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
        model.addAttribute("pageSize", pageSize);
        return "catalog_list";
    }

    //软删除
    @GetMapping("/catalog/deleteCatalog")
    public String deleteCatalog(Integer id, @RequestParam(defaultValue = "1") int page) {
        cataLogService.softDeleteCatalog(id);
        return "redirect:/catalog/findAllCatalog?page=" + page;
    }

    //批量软删除
    @PostMapping("/catalog")
    public String batchDelete(String type, @RequestParam("catalogId") List<Integer> ids,
                              @RequestParam(defaultValue = "1") int page) {
        if ("delByIds".equals(type) && ids != null && !ids.isEmpty()) {
            cataLogService.batchSoftDeleteCatalog(ids);
        }
        return "redirect:/catalog/findAllCatalog?page=" + page;
    }

    //按ID查询
    @GetMapping("/catalog/findById")
    public String findById(Integer id, Model model, @RequestParam(defaultValue = "1") int page) {
        CataLog catalog = cataLogService.findById(id);
        model.addAttribute("catalog", catalog);
        model.addAttribute("page", page);
        return "catalog_update";
    }

    //修改栏目
    @PostMapping("/catalog/updateCatalog")
    public String updateCatalog(CataLog catalog, @RequestParam(defaultValue = "1") int page) {
        cataLogService.updateCatalog(catalog);
        return "redirect:/catalog/findAllCatalog?page=" + page;
    }

    //上移
    @GetMapping("/catalog/moveUp")
    public String moveUp(Integer id, @RequestParam(defaultValue = "1") int page) {
        cataLogService.moveUp(id);
        return "redirect:/catalog/findAllCatalog?page=" + page;
    }

    //下移
    @GetMapping("/catalog/moveDown")
    public String moveDown(Integer id, @RequestParam(defaultValue = "1") int page) {
        cataLogService.moveDown(id);
        return "redirect:/catalog/findAllCatalog?page=" + page;
    }

    //添加栏目-页面
    @GetMapping("/catalog/addCatalog")
    public String toAddCatalog() {
        return "catalog_addCatalog";
    }

    //添加栏目
    @PostMapping("/catalog/addCatalog")
    public String addCatalog(CataLog catalog) {
        cataLogService.addCatalog(catalog);
        return "redirect:/catalog/findAllCatalog";
    }
}
