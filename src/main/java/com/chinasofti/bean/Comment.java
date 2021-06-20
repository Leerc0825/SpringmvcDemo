package com.chinasofti.bean;


import com.google.gson.annotations.JsonAdapter;

import java.util.Date;

public class Comment {

    private int ID;
    private User user;
    private Film film;
    private String content;
    private int score;
    @JsonAdapter(DateAdapter.class)
    private Date commentTime;


    public Comment() {
    }

    public Comment(int ID, User user, Film film, String content, int score, Date commentTime) {
        this.ID = ID;
        this.user = user;
        this.film = film;
        this.content = content;
        this.score = score;
        this.commentTime = commentTime;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Film getFilm() {
        return film;
    }

    public void setFilm(Film film) {
        this.film = film;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public Date getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(Date commentTime) {
        this.commentTime = commentTime;
    }
}
