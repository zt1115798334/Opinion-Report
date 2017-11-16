package com.opinion.mysql.service;

import com.opinion.mysql.entity.ReportArticle;
import com.opinion.mysql.entity.SysUser;
import org.springframework.data.domain.Page;

import java.time.LocalDateTime;

/**
 * @author zhangtong
 * Created by on 2017/11/13
 */
public interface ReportArticleService {

    /**
     * 保存 --上报文章信息
     *
     * @param reportArticle
     * @return
     */
    ReportArticle save(ReportArticle reportArticle);

    /**
     * 根据id查询上报文章信息
     *
     * @param id id
     * @return
     */
    ReportArticle findOneById(Long id);

    /**
     * 根据创建人查询上报文章集合
     *
     * @param reportArticle
     * @return
     */
    Page<ReportArticle> findPageByCreateUser(ReportArticle reportArticle);

    /**
     * 对上报文章进行审核
     *
     * @param id          id
     * @param adoptDate   审核时间
     * @param adoptUserId 审核人id
     * @param adoptState  审核状态
     * @return
     */
    ReportArticle examineAndVerify(Long id, LocalDateTime adoptDate, Long adoptUserId, String adoptState, String adoptOpinion);


    /**
     * 根据创建人查询上报文章集合
     *
     * @param reportArticle
     * @return
     */
    Page<ReportArticle> findPageByInChild(ReportArticle reportArticle);

}
