package com.chinasofti.bean;

import com.google.gson.annotations.JsonAdapter;

import java.util.Date;

public class Film {
    private int ID;
    private String filmName; // 电影名称
    private String director;// 导演
    private String screenwriter;// 编剧
    private String actor;// 演员
    private String type;// 类型
    private String country;// 发行国家
    private String language;// 语言
    @JsonAdapter(DateAdapter.class)
    private Date releaseDate;// 发行日期
    private int filmLength;// 影片时长
    private String image;// 封面
    private String link;// 购票链接
    private String movie;// 视频地址
    private String brief;// 简介
    private Date inTime;// 录入系统时间
    private String state;// 当前状态
    private int bannerState;//0 -> 1
    private float avg; //评分


    public int getBannerState() {
        return bannerState;
    }

    public void setBannerState(int bannerState) {
        this.bannerState = bannerState;
    }

    public Film() {
    }

    public Film(int ID, String filmName, String director, String screenwriter, String actor,
                String type, String country, String language, Date releaseDate, int filmLength,
                String image, String link, String movie, String brief, Date inTime, String state) {
        this.ID = ID;
        this.filmName = filmName;
        this.director = director;
        this.screenwriter = screenwriter;
        this.actor = actor;
        this.type = type;
        this.country = country;
        this.language = language;
        this.releaseDate = releaseDate;
        this.filmLength = filmLength;
        this.image = image;
        this.link = link;
        this.movie = movie;
        this.brief = brief;
        this.inTime = inTime;
        this.state = state;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getFilmName() {
        return filmName;
    }

    public void setFilmName(String filmName) {
        this.filmName = filmName;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public String getScreenwriter() {
        return screenwriter;
    }

    public void setScreenwriter(String screenwriter) {
        this.screenwriter = screenwriter;
    }

    public String getActor() {
        return actor;
    }

    public void setActor(String actor) {
        this.actor = actor;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    public int getFilmLength() {
        return filmLength;
    }

    public void setFilmLength(int filmLength) {
        this.filmLength = filmLength;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getMovie() {
        return movie;
    }

    public void setMovie(String movie) {
        this.movie = movie;
    }

    public String getBrief() {
        return brief;
    }

    public void setBrief(String brief) {
        this.brief = brief;
    }

    public Date getInTime() {
        return inTime;
    }

    public void setInTime(Date inTime) {
        this.inTime = inTime;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "Film{" +
                "id=" + ID +
                ", filmName='" + filmName + '\'' +
                ", director='" + director + '\'' +
                ", screenwriter='" + screenwriter + '\'' +
                ", actor='" + actor + '\'' +
                ", type='" + type + '\'' +
                ", country='" + country + '\'' +
                ", language='" + language + '\'' +
                ", releaseDate=" + releaseDate +
                ", filmLength=" + filmLength +
                ", image='" + image + '\'' +
                ", link='" + link + '\'' +
                ", movie='" + movie + '\'' +
                ", brief='" + brief + '\'' +
                ", in_time=" + inTime +
                ", state='" + state + '\'' +
                '}';
    }
}
