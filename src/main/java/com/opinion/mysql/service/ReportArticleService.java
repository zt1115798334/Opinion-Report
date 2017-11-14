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
     * 根据id查询上报文章信息
     *
     * @param id id
     * @return
     */
    ReportArticle findOneById(Long id);

    /**
     * 根据创建人查询上报文章集合
     *
     * @param createdUser 创建人
     * @return
     */
    List<ReportArticle> findListByCreatedUser(String createdUser);

    /**
     * 根据创建人查询上报文章集合
     *
     * @param createdUser 创建人
     * @return
     */
    Page<ReportArticle> findPageByCreateUser(String createdUser, int page, int size, String sortParam, String sortType);

    /**
     * 对上报文章进行审核
     * @param id id
     * @param adoptDate 审核时间
     * @param adoptUser 审核人
     * @param adoptState 审核状态
     * @return
     */
    ReportArticle examineAndVerify(Long id, LocalDateTime adoptDate, String adoptUser, String adoptState);
}
