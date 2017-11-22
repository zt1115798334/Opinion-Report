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
     * @param reportArticle 上报文章
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
     * @param reportArticle 上报文章
     * @return
     */
    Page<ReportArticle> findPageByCreateUser(ReportArticle reportArticle);

    /**
     * 对上报文章进行审核
     *
     * @param reportArticle 上报文章
     * @return
     */
    boolean examineAndVerify(ReportArticle reportArticle);


    /**
     * 根据创建人查询上报文章集合
     *
     * @param reportArticle 上报文章
     * @return
     */
    Page<ReportArticle> findPageByInChild(ReportArticle reportArticle);

    /**
     * 根据创建人id时间范围查询
     *
     * @param createdUserId 创建人id
     * @param startDateTime 开始时间
     * @param endDateTime   结束时间
     * @return
     */
    List<ReportArticle> findListByCreatedUserId(Long createdUserId, LocalDateTime startDateTime, LocalDateTime endDateTime);

    /**
     * 根据创建人id集合时间范围查询
     *
     * @param createdUserId 创建人id集合
     * @param startDateTime 开始时间
     * @param endDateTime   结束时间
     * @return
     */
    List<ReportArticle> findListInCreatedUserIds(List<Long> createdUserId, LocalDateTime startDateTime, LocalDateTime endDateTime);

    /**
     * 根据id集合删除
     *
     * @param ids id集合
     * @return
     */
    boolean delByIds(List<Long> ids);

    /**
     * 根据创建人id删除
     *
     * @param createdUserId 创建人id
     * @return
     */
    boolean delByCreatedUserId(Long createdUserId);
}
