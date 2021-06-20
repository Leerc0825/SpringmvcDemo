package com.chinasofti.controller;

import com.chinasofti.bean.Banner;
import com.chinasofti.bean.Film;
import com.chinasofti.service.BannerService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/banner")
public class BannerController {
    @Autowired
    private BannerService bannerService;

    @RequestMapping("/add")
    @ResponseBody
    public Map addFilm(Banner banner) {
        return bannerService.addBanner(banner);
    }

    @RequestMapping("/search")
    @ResponseBody
    public PageInfo<Banner> search(@RequestParam(defaultValue = "1") int pageNum,
                                   @RequestParam(defaultValue = "5") int pageSize,
                                   String filmName) {
        return bannerService.search(pageNum, pageSize, filmName);
    }

    @RequestMapping("/delete")
    @ResponseBody
    public int delete(int id) {
        return bannerService.deleteBanner(id);
    }
}
