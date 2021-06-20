package com.chinasofti.service;

import com.chinasofti.bean.Banner;
import com.chinasofti.bean.Film;
import com.chinasofti.dao.BannerMapper;
import com.chinasofti.dao.FilmMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BannerService {
    @Autowired
    private BannerMapper bannerMapper;

    @Autowired
    private FilmMapper filmMapper;

    public PageInfo<Banner> search(int pageNum, int pageSize, String name) {
        PageHelper.startPage(pageNum, pageSize);
        name = "%" + name + "%";
        List<Banner> list = bannerMapper.findListLikeFilm(name);
        for (int i = 0; i < list.size(); i++) {
            int id = list.get(i).getID();
            Film film = filmMapper.findById(id);
            String filmName = film.getFilmName();
            list.get(i).setFilmName(filmName);
            list.get(i).setBrief(film.getBrief());
        }
        return new PageInfo<>(list);
    }

    public Map addBanner(Banner banner) {
        Map ret = new HashMap();
        int i = bannerMapper.addBanner(banner);
        int id = banner.getID();

        filmMapper.updateBannerState(id, 1);
        if (i > 0) {

            ret.put("status", "1");
            ret.put("msg", "添加轮播图成功");
        } else {
            ret.put("status", "0");
            ret.put("msg", "添加轮播图失败");
        }


        return ret;
    }

    /**
     * 删除轮播图的方法
     */

    public int deleteBanner(int id) {
        int n = bannerMapper.deleteBanner(id);
        filmMapper.updateBannerState(id, 0);
        if (n > 0) {
            return 1;
        } else {
            return 0;
        }
    }
}
