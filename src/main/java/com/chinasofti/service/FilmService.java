package com.chinasofti.service;

import com.chinasofti.bean.Banner;
import com.chinasofti.bean.Film;
import com.chinasofti.dao.FilmMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class FilmService {
    @Autowired
    private FilmMapper filmMapper;

    //分页查找影片列表
    public PageInfo<Film> searchFilm(int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize); //开始分页
        List<Film> FilmList = filmMapper.findList();
        return new PageInfo<>(FilmList);
    }

    //分页按照类型查找影片列表
    public PageInfo<Film> searchFilmByType(String type, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize); //开始分页
        type = "%" + type + "%";
        List<Film> FilmList = filmMapper.findByType(type);
        return new PageInfo<>(FilmList);
    }

    //查找热门影片(按评论数量排序)
    public List<Film> searchHotMovies() {
        return filmMapper.findHotMovies();
    }

    //按照上映日期查询影片方法
    public List<Film> searchFilmDesc() {
        return filmMapper.findListDesc();
    }

    /**
     * 添加影片信息的方法
     */
    public Map addFilm(Film film) {
        int n = filmMapper.save(film);
        Map ret = new HashMap();
        if (n > 0) {
            ret.put("status", "1");
            ret.put("msg", "添加影片成功");
        } else {
            ret.put("status", "0");
            ret.put("msg", "添加影片失败");
        }
        return ret;
    }

    /**
     * 根据ID查找影片的方法
     */
    public Film findById(int id) {
        return filmMapper.findById(id);
    }

    /**
     * 更新影片资源链接的方法
     */
    public String update(Film film) {
        int n = filmMapper.update(film);
        if (n > 0) {
            return "true";
        } else {
            return "false";
        }
    }

    /**
     * 更新影片轮播图的方法
     */
    public String updateBanner(int filmId, int bannerState) {
        int n = filmMapper.updateBannerState(filmId, bannerState);
        if (n > 0) {
            return "true";
        } else {
            return "false";
        }
    }

    /**
     * 删除影片的方法
     */

    public int delete(int id) {
        int n = filmMapper.delete(id);
        if (n > 0) {
            return 1;
        } else {
            return 0;
        }
    }
}
