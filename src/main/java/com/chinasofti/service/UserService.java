package com.chinasofti.service;

import com.chinasofti.bean.User;
import com.chinasofti.dao.UserMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;

    //查询用户列表
    public PageInfo<User> findList(int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<User> userList = userMapper.findList();
        return new PageInfo<>(userList);
    }

    //查询单个用户
    public User findById(int id) {
        return userMapper.findById(id);
    }

    //注册用户
    public Map registerUser(User user){
        Map ret = new HashMap();
        if (userMapper.save(user) > 0){
            ret.put("status", "1");
            ret.put("msg", "注册成功！");
        }else {
            ret.put("status", "0");
            ret.put("msg", "注册失败！");
        }
        return ret;
    }

    //用户注销
    public Map logOffUser(int id){
        Map ret = new HashMap();
        if (userMapper.delete(id) > 0){
            ret.put("status", "1");
            ret.put("msg", "注销成功！");
        }else {
            ret.put("status", "0");
            ret.put("msg", "注销失败！");
        }
        return ret;
    }

    //修改信息
    public Map updateUser(User user){
        Map ret = new HashMap();
        if (userMapper.updateUser(user) > 0){
            ret.put("status", "1");
            ret.put("msg", "修改成功！");
        }else {
            ret.put("status", "0");
            ret.put("msg", "修改失败！");
        }
        return ret;
    }

    //用户封禁
    public Map updateState0(int id){
        Map ret = new HashMap();
        if (userMapper.updateState0(id) > 0){
            ret.put("status", "1");
            ret.put("msg", "封禁成功！");
        }else {
            ret.put("status", "0");
            ret.put("msg", "封禁失败！");
        }
        return ret;
    }

    //用户解封
    public Map updateState1(int id){
        Map ret = new HashMap();
        if (userMapper.updateState1(id) > 0){
            ret.put("status", "1");
            ret.put("msg", "解封成功！");
        }else {
            ret.put("status", "0");
            ret.put("msg", "解封失败！");
        }
        return ret;
    }
}
