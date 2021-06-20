package com.chinasofti.controller;

import com.chinasofti.bean.Film;
import com.chinasofti.service.FilmService;
import com.github.pagehelper.PageInfo;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/film")
public class FilmController {
    public static final String PATH = "D://image/";

    @Autowired
    private FilmService filmService;

    @InitBinder
    //全局的属性编辑器 具体看https://www.cnblogs.com/lvbinbin2yujie/p/10459303.html
    public void initBinder(WebDataBinder binder) {

        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");

        binder.registerCustomEditor(Date.class, new CustomDateEditor(format, true));

    }


    @RequestMapping("/search")
    @ResponseBody
    public PageInfo<Film> search(@RequestParam(defaultValue = "1") int pageNum,
                                 @RequestParam(defaultValue = "5") int pageSize) {
        return filmService.searchFilm(pageNum, pageSize);
    }

    @RequestMapping("/searchFilmDesc")
    @ResponseBody
    public List<Film> searchFilmDesc() {
        return filmService.searchFilmDesc();
    }

    @RequestMapping("/searchHotMovies")
    @ResponseBody
    public List<Film> searchHotMovies() {
        return filmService.searchHotMovies();
    }

    @RequestMapping("/searchById")
    @ResponseBody
    public Film searchById(int id) {
        return filmService.findById(id);
    }

    @RequestMapping("/searchByType")
    @ResponseBody
    public PageInfo<Film> searchByType(@RequestParam(defaultValue = "1") int pageNum,
                                       @RequestParam(defaultValue = "23") int pageSize,
                                       String type) {
        return filmService.searchFilmByType(type, pageNum, pageSize);
    }

    @RequestMapping("/add")
    @ResponseBody
    public Map addFilm(Film film) {
        return filmService.addFilm(film);
    }

    @RequestMapping("/update")
    @ResponseBody
    public String update(Film film) {
        return filmService.update(film);
    }

    @RequestMapping("/updateBanner")
    @ResponseBody
    public String updateBanner(int filmId, int bannerState) {
        return filmService.updateBanner(filmId, bannerState);
    }

    @RequestMapping("/delete")
    @ResponseBody
    public int delete(int id) {
        return filmService.delete(id);
    }


    /**
     * 实现文件上传
     *
     * @param cmf
     * @param session
     * @return
     */
    @PostMapping("/upload")
    @ResponseBody
    public Map uploadFile(@RequestParam("file") CommonsMultipartFile cmf,
                          HttpSession session) {
        // 1获得上传的文件内容
        byte[] bytes = cmf.getBytes();
        // 2获得upload的绝对路径
        String path = session.getServletContext().getRealPath("/upload");
        // 3在服务器的upload目录下创建File对象
        String oname = cmf.getOriginalFilename(); // 上传文件的原始名字
//        String uuid = UUID.randomUUID().toString();
        String filename = PATH + System.currentTimeMillis() + ".jpg";
        File file = new File(filename);
        System.out.println(filename);
        // 4将上传的文件拷贝到指定的目录
        try {

            FileUtils.writeByteArrayToFile(file, bytes);
        } catch (IOException e) {
            e.printStackTrace();
        }
        Map ret = new HashMap<>();
        ret.put("isok", 1);
        ret.put("path", filename.substring(filename.lastIndexOf("/") + 1));
        return ret;
    }

    /***
     * 实现文件下载
     * ***/
    @RequestMapping("/download")
    public void download(HttpServletRequest req, HttpServletResponse resp, String url) throws IOException {
//        int beginIndex = req.getRequestURI().lastIndexOf("/");//最后一个 / 的位置
//        String filename = req.getRequestURI().substring(beginIndex + 1);
        InputStream is = new FileInputStream(PATH + url);

        resp.setContentType("image/jpeg");
        OutputStream os = resp.getOutputStream();
        byte[] buf = new byte[10240];//临时缓冲区，用于实现文件拷贝
        int n;
        while ((n = is.read(buf)) != -1) {// 循环结束时，完成拷贝
            os.write(buf, 0, n);
            os.flush();
        }
        os.close();
        is.close();
    }

}
