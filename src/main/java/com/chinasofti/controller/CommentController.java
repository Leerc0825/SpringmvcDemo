package com.chinasofti.controller;

import com.chinasofti.bean.Comment;
import com.chinasofti.service.CommentService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    private CommentService commentService;

    @RequestMapping("/search")
    @ResponseBody
    public PageInfo<Comment> search(
            @RequestParam(defaultValue = "") String username,
            @RequestParam(defaultValue = "") String filmName,
            @RequestParam(defaultValue = "1") int pageNum,
            @RequestParam(defaultValue = "10") int pageSize) {
//        username = "%"+username+"%";
//        filmName = "%"+filmName+"%";
        return commentService.searchComment(username, filmName, pageNum, pageSize);
    }

    @RequestMapping("/searchById")
    @ResponseBody
    public Comment search(int id) {
        return commentService.searchComment(id);
    }

    /**
     * 根据电影id查评分
     *
     * @param filmId
     * @return
     */
    @RequestMapping("/searchScore")
    @ResponseBody
    public Map searchScoreByFilmID(int filmId) {
        return commentService.searchScoreByFilmId(filmId);
    }

    /**
     * 查询热门评论
     *
     * @return
     */
    @RequestMapping("/searchHotComment")
    @ResponseBody
    public List<Comment> searchHotComment() {
        return commentService.searchHotComment();
    }

    // 查询最新评论
    @RequestMapping("/searchLatestComment")
    @ResponseBody
    public List<Comment> searchLatestComment() {
        return commentService.searchLatestComments();
    }

    @RequestMapping("/searchByFimId")
    @ResponseBody
    public PageInfo<Comment> searchByFilmId(@RequestParam(defaultValue = "1") int pageNum,
                                            @RequestParam(defaultValue = "5") int pageSize,
                                            int filmId) {
        return commentService.searchCommentByFilmId(filmId, pageNum, pageSize);
    }

    @RequestMapping("/addComment")
    @ResponseBody
    public Map addComment(int userId, int filmId, String content, int score) {
        return commentService.addComment(userId, filmId, content, score);
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Map delete(int id) {
        return commentService.deleteComment(id);
    }


}
