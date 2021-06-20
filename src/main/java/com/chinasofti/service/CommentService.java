package com.chinasofti.service;

import com.chinasofti.bean.Comment;
import com.chinasofti.dao.CommentMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CommentService {
    @Autowired
    private CommentMapper commentMapper;

    //分页查询评论
    public PageInfo<Comment> searchComment(String username, String filmName, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);//分页
        username = "%" + username + "%";
        filmName = "%" + filmName + "%";
        List<Comment> commentList = commentMapper.findList(username, filmName);
        return new PageInfo<>(commentList);
    }

    //使用影片ID查找评论
    public PageInfo<Comment> searchCommentByFilmId(int id, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);//分页
        List<Comment> list = commentMapper.findCommentByFilmId(id);
        return new PageInfo<>(list);
    }

    //使用用户ID查找评论
    public Comment searchComment(int id) {
        return commentMapper.findById(id);
    }

    //根据点赞数查询热门评论
    public List<Comment> searchHotComment() {
        return commentMapper.findHotComment();
    }

    //查询最新评论
    public List<Comment> searchLatestComments() {
        return commentMapper.findLatestComments();
    }

    //添加评论
    public Map addComment(int userId, int filmId, String content, int score) {
        Map ret = new HashMap();
        int i = commentMapper.addComment(userId, filmId, content, score);
        if (i > 0) {
            ret.put("status", "1");
            ret.put("msg", "评论成功");
        } else {
            ret.put("status", "0");
            ret.put("msg", "评论失败");
        }
        return ret;
    }

    //根据电影id查评分
    public Map searchScoreByFilmId(int id) {
        Map ret = new HashMap();
        float i1 = 0;//1星
        float i2 = 0;//2星
        float i3 = 0;//3星
        float i4 = 0;//4星
        float i5 = 0;//五星
        float scoreSum = 0;

        List<Integer> scoreList = commentMapper.findScoreByFilmId(id);
        int commentCount = scoreList.size();
        for (int i = 0; i < scoreList.size(); i++) {
            if (scoreList.get(i) == 10 ) {
                i5++;
            } else if (scoreList.get(i) == 8 ) {
                i4++;
            } else if (scoreList.get(i) == 6 ) {
                i3++;
            } else if (scoreList.get(i) == 4 ) {
                i2++;
            } else {
                i1++;
            }
            scoreSum += scoreList.get(i);
        }
        float five = i5 / commentCount;
        float four = i4 / commentCount;
        float three = i3 / commentCount;
        float two = i2 / commentCount;
        float one = i1 / commentCount;

        float avgScore = scoreSum / commentCount;
        ret.put("comment", commentCount);
        ret.put("five", five);
        ret.put("four", four);
        ret.put("three", three);
        ret.put("two", two);
        ret.put("one", one);
        ret.put("avgScore", avgScore);
        return ret;
    }


    //根据ID删除评论
    public Map deleteComment(int id) {
        Map ret = new HashMap();
        commentMapper.deleteById(id);
        ret.put("status", "1");
        ret.put("msg", "删除成功");
        return ret;
    }


}
