package com.chinasofti.controller;

import com.chinasofti.bean.User;
import com.chinasofti.service.UserService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    //查询所有用户
    @RequestMapping("/search")
    @ResponseBody
    public PageInfo<User> search(@RequestParam(defaultValue = "1") int pageNum,
                                 @RequestParam(defaultValue = "10") int pageSize){
        return userService.findList(pageNum, pageSize);
    }

    //查询单个用户
    @RequestMapping("/detail")
    @ResponseBody
    public User search(int id){
        return userService.findById(id);
    }

    //用户注册
    @RequestMapping("/register")
    @ResponseBody
    public Map registerUser(User user){
        return userService.registerUser(user);
    }

    //用户注销
    @RequestMapping("/logoff")
    @ResponseBody
    public Map logoffUser(int id){
        return userService.logOffUser(id);
    }

    //用户封禁
    @RequestMapping("/setState0/{ID}")
    @ResponseBody
    public Map setUserState0(@PathVariable("ID") int id){
        return userService.updateState0(id);
    }

    //用户解封
    @RequestMapping("/setState1")
    @ResponseBody
    public Map setUserState1(int ID){
        return userService.updateState1(ID);
    }

    @InitBinder
    //全局的属性编辑器 具体看https://www.cnblogs.com/lvbinbin2yujie/p/10459303.html
    public void initBinder(WebDataBinder binder){
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
    }



}
