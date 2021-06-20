package com.chinasofti.dao;

import com.chinasofti.bean.Banner;
import com.chinasofti.bean.Film;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface BannerMapper {

    @Select("SELECT * FROM t_banners")
    List<Banner> findList();

    @Select("select * from t_banners where id in (select id from t_film where film_name like #{param0})")
    List<Banner> findListLikeFilm(String filmName);





//    @Select("SELECT * FROM t_banners WHERE LIKE")

    @Select("SELECT * FROM t_banners WHERE ID = #{param0}")
    Banner findById(int id);


    @Insert("INSERT INTO t_banners VALUES(#{ID},#{bannerImage})")
    int addBanner(Banner banner);

    @Delete("DELETE FROM t_banners WHERE ID = #{param0}")
    int deleteBanner(int id);

}
