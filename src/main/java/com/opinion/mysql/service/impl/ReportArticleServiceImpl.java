package com.opinion.mysql.service.impl;

import com.opinion.mysql.entity.ReportArticle;
import com.opinion.mysql.repository.ReportArticleRepository;
import com.opinion.mysql.service.ReportArticleService;
import com.opinion.utils.PageUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.time.LocalDateTime;

/**
 * @author zhangtong
 * Created by on 2017/11/13
 */
@Service
public class ReportArticleServiceImpl implements ReportArticleService {

    @Autowired
    private ReportArticleRepository reportArticleRepository;

    @Override
    public ReportArticle save(ReportArticle reportArticle) {
        return reportArticleRepository.save(reportArticle);
    }

    @Override
    public ReportArticle findOneById(Long id) {
        return reportArticleRepository.findOne(id);
    }

    @Override
    public Page<ReportArticle> findPageByCreateUser(ReportArticle reportArticle) {

        Specification<ReportArticle> specification = new Specification<ReportArticle>() {
            @Override
            public Predicate toPredicate(Root<ReportArticle> root, CriteriaQuery<?> query, CriteriaBuilder builder) {
                if (StringUtils.isNotEmpty(reportArticle.getCreatedUser())) {
                    query.where(builder.and(builder.equal(root.get("createdUser").as(String.class), reportArticle.getCreatedUser())));
                }
                return null;
            }
        };
        Pageable pageable = PageUtils.buildPageRequest(reportArticle.getPageNum(),
                reportArticle.getPageSize(),
                reportArticle.getSortParam(),
                reportArticle.getSortParam());
        Page<ReportArticle> result = reportArticleRepository.findAll(specification, pageable);
        return result;
    }

    @Override
    public ReportArticle examineAndVerify(Long id, LocalDateTime adoptDate, String adoptUser, String adoptState) {
        ReportArticle reportArticle = reportArticleRepository.findOne(id);
        if (reportArticle != null) {
            reportArticle.setAdoptDate(adoptDate);
            reportArticle.setAdoptUser(adoptUser);
            reportArticle.setAdoptState(adoptState);
            reportArticle = reportArticleRepository.save(reportArticle);
        }
        return reportArticle;
    }
}
