package com.chinasofti.controller;

import com.chinasofti.bean.Category;
import com.chinasofti.service.CategoryService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller
@RequestMapping("/category")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    @RequestMapping("/detail")
    @ResponseBody
    public Category search(int id) {
        return categoryService.findById(id);
    }


    @RequestMapping("/search")
    @ResponseBody
    public PageInfo<Category> findList(@RequestParam(defaultValue = "1") int pageNum,
                                       @RequestParam(defaultValue = "1000") int pageSize) {
        return categoryService.findList(pageNum, pageSize);
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Map delete(int id) {
        return categoryService.delete(id);
    }

    @RequestMapping("/add")
    @ResponseBody
    public Map add(Category category) {
        return categoryService.save(category);
    }

    @RequestMapping("/update")
    @ResponseBody
    public Map update(Category category) {
        return categoryService.update(category);
    }


}
