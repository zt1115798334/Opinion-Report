package com.opinion.mysql.service;

import com.opinion.mysql.entity.ReportArticle;
import org.springframework.data.domain.Page;

import java.time.LocalDateTime;
import java.util.List;

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
     * 再次保存 --上报文章信息
     *
     * @param reportCode 上报编号
     * @return
     */
    ReportArticle saveAgain(String reportCode);

    /**
     * 根据id查询上报文章信息
     *
     * @param reportCode 上报编号
     * @return
     */
    ReportArticle findOneByreportCode(String reportCode);

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
     * @return
     */
    boolean examineAndVerify(ReportArticle reportArticle);


    /**
     * 根据创建人查询上报文章集合
     *
     * @param reportArticle
     * @return
     */
    Page<ReportArticle> findPageByInChild(ReportArticle reportArticle);

    List<ReportArticle> findListByCreatedUserId(Long createdUserId, LocalDateTime startDateTime, LocalDateTime endDateTime);

    List<ReportArticle> findListInCreatedUserIds(List<Long> createdUserId, LocalDateTime startDateTime, LocalDateTime endDateTime);

}
