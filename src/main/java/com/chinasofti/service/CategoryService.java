package com.chinasofti.service;

import com.chinasofti.bean.Category;
import com.chinasofti.dao.CategoryMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CategoryService {

    @Autowired
    private CategoryMapper categoryMapper;

    public PageInfo<Category> findList(int pageNum, int pageSize){
        PageHelper.startPage(pageNum,pageSize);
        List<Category> categoryList = categoryMapper.findList();
        return new PageInfo<>(categoryList);
    }

    public Category findById(int id){
        return categoryMapper.findById(id);
    }

    public Map update(Category category){
        Map ret = new HashMap();
        if (categoryMapper.update(category) > 0){
            ret.put("status", "1");
            ret.put("msg", "更新成功");
        }else {
            ret.put("status", "0");
            ret.put("msg", "更新失败");
        }
        return ret;
    }

    public Map delete(int id){
        Map ret = new HashMap();
        if (categoryMapper.delete(id) > 0){
            ret.put("status", "1");
            ret.put("msg", "删除成功");
        }else {
            ret.put("status", "0");
            ret.put("msg", "删除失败");
        }
        return ret;
    }

    public Map save(Category category){
        Map ret = new HashMap();
        if (categoryMapper.save(category) > 0){
            ret.put("status", "1");
            ret.put("msg", "添加成功");
        }else {
            ret.put("status", "0");
            ret.put("msg", "添加失败");
        }
        return ret;
    }


}
