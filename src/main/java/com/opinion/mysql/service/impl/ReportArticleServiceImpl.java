package com.opinion.mysql.service.impl;

import com.opinion.constants.SysConst;
import com.opinion.mysql.entity.ReportArticle;
import com.opinion.mysql.entity.ReportArticleLog;
import com.opinion.mysql.repository.ReportArticleRepository;
import com.opinion.mysql.service.ReportArticleLogService;
import com.opinion.mysql.service.ReportArticleService;
import com.opinion.mysql.service.SysUserService;
import com.opinion.utils.DateUtils;
import com.opinion.utils.PageUtils;
import com.opinion.utils.SNUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/11/13
 */
@Service
public class ReportArticleServiceImpl implements ReportArticleService {


    @Autowired
    private ReportArticleRepository reportArticleRepository;

    @Autowired
    private SysUserService sysUserService;

    @Autowired
    private ReportArticleLogService reportArticleLogService;

    @Override
    public ReportArticle save(ReportArticle reportArticle) {
        LocalDate currentDate = DateUtils.currentDate();
        LocalDateTime currentDatetime = DateUtils.currentDatetime();
        Long userId = SysConst.USER_ID;
        reportArticle.setReportCode(SNUtil.create15());
        reportArticle.setReportSource(SysConst.ReportSource.ARTIFICIAL.getCode());
        reportArticle.setPublishDatetime(currentDatetime);
        reportArticle.setAdoptState(SysConst.AdoptState.REPORT.getCode());
        reportArticle.setCreatedDate(currentDate);
        reportArticle.setCreatedDatetime(currentDatetime);
        reportArticle.setCreatedUserId(userId);
        reportArticle.setModifiedDate(currentDate);
        reportArticle.setModifiedDatetime(currentDatetime);
        reportArticle.setModifiedUserId(userId);
        reportArticle = reportArticleRepository.save(reportArticle);
        saveReportArticleLog(reportArticle.getReportCode(), reportArticle.getAdoptState(), null);
        return reportArticle;
    }

    @Override
    public ReportArticle saveAgain(String reportCode) {
        ReportArticle reportArticle = reportArticleRepository.findByReportCode(reportCode);
        ReportArticle newReportArticle = null;
        if (reportArticle != null) {
            String newReportCode = SNUtil.create15();
            reportArticle.setReportCode(newReportCode);
            reportArticle.setAdoptState(SysConst.AdoptState.REPORT.getCode());
            newReportArticle = save(reportArticle);
        }
        return newReportArticle;
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
                query.where(builder.and(builder.equal(root.get("createdUserId").as(Long.class), reportArticle.getCreatedUserId())));
                if (StringUtils.isNotEmpty(reportArticle.getTitle())) {
                    query.where(builder.and(builder.like(root.get("title").as(String.class), "%" + reportArticle.getTitle() + "%")));
                }
                if (StringUtils.isEmpty(reportArticle.getAdoptState())) {
                    query.where(builder.and(builder.equal(root.get("adoptState").as(String.class), reportArticle.getAdoptState())));
                }
                if (StringUtils.isNotEmpty(reportArticle.getSourceType())) {
                    query.where(builder.and(builder.equal(root.get("sourceType").as(String.class), reportArticle.getSourceType())));
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
    public ReportArticle examineAndVerify(ReportArticle reportArticle) {
        ReportArticle result = reportArticleRepository.findByReportCode(reportArticle.getReportCode());
        if (result != null) {
            String adoptState = reportArticle.getAdoptState();
            String adoptOpinion = reportArticle.getAdoptOpinion();

            result.setAdoptDatetime(reportArticle.getAdoptDatetime());
            result.setAdoptUserId(reportArticle.getAdoptUserId());
            result.setAdoptState(adoptState);
            result.setAdoptOpinion(adoptOpinion);
            result = reportArticleRepository.save(result);
            saveReportArticleLog(result.getReportCode(), adoptState, adoptOpinion);
        }
        return result;
    }

    @Override
    public Page<ReportArticle> findPageByInChild(ReportArticle reportArticle) {
        List<Long> userId = sysUserService.findChildIdListByParentId(reportArticle.getCreatedUserId());
        Specification<ReportArticle> specification = new Specification<ReportArticle>() {
            @Override
            public Predicate toPredicate(Root<ReportArticle> root, CriteriaQuery<?> query, CriteriaBuilder builder) {
                CriteriaBuilder.In<Long> in = builder.in(root.get("createdUserId").as(Long.class));
                userId.forEach(userid -> in.value(userid));
                query.where(in);
                if (StringUtils.isNotEmpty(reportArticle.getTitle())) {
                    query.where(builder.and(builder.like(root.get("title").as(String.class), reportArticle.getTitle())));
                }
                if (StringUtils.isEmpty(reportArticle.getAdoptState())) {
                    query.where(builder.and(builder.equal(root.get("adoptState").as(String.class), reportArticle.getAdoptState())));
                }
                if (StringUtils.isNotEmpty(reportArticle.getSourceType())) {
                    query.where(builder.and(builder.equal(root.get("sourceType").as(String.class), reportArticle.getSourceType())));
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
    public List<ReportArticle> findListByCreatedUserId(Long createdUserId, LocalDateTime startDateTime, LocalDateTime endDateTime) {
        Specification<ReportArticle> specification = new Specification<ReportArticle>() {
            @Override
            public Predicate toPredicate(Root<ReportArticle> root, CriteriaQuery<?> query, CriteriaBuilder builder) {
                query.where(builder.and(builder.equal(root.get("createdUserId").as(Long.class), createdUserId)));
                query.where(builder.between(root.get("createdDatetime").as(LocalDateTime.class), startDateTime, endDateTime));
                return null;
            }
        };
        Sort sort = new Sort(Sort.Direction.ASC, "createdDatetime");
        List<ReportArticle> result = reportArticleRepository.findAll(specification, sort);
        return result;
    }

    @Override
    public List<ReportArticle> findListInCreatedUserIds(List<Long> createdUserId, LocalDateTime startDateTime, LocalDateTime endDateTime) {
        Specification<ReportArticle> specification = new Specification<ReportArticle>() {
            @Override
            public Predicate toPredicate(Root<ReportArticle> root, CriteriaQuery<?> query, CriteriaBuilder builder) {
                CriteriaBuilder.In<Long> in = builder.in(root.get("createdUserId").as(Long.class));
                createdUserId.forEach(userid -> in.value(userid));
                query.where(in);
                query.where(builder.between(root.get("createdDatetime").as(LocalDateTime.class), startDateTime, endDateTime));
                return null;
            }
        };
        Sort sort = new Sort(Sort.Direction.ASC, "createdDatetime");
        List<ReportArticle> result = reportArticleRepository.findAll(specification, sort);
        return result;
    }


    public ReportArticleLog saveReportArticleLog(String reportCode,
                                                 String adoptState,
                                                 String adoptOpinion) {
        Long userId = SysConst.USER_ID;
        LocalDate currentDate = DateUtils.currentDate();
        LocalDateTime currentDatetime = DateUtils.currentDatetime();
        ReportArticleLog reportArticleLog = new ReportArticleLog();
        reportArticleLog.setReportCode(reportCode);
        reportArticleLog.setAdoptDatetime(currentDatetime);
        reportArticleLog.setAdoptUserId(userId);
        reportArticleLog.setAdoptState(adoptState);
        reportArticleLog.setAdoptOpinion(adoptOpinion);
        reportArticleLog.setCreatedDate(currentDate);
        reportArticleLog.setCreatedDatetime(currentDatetime);
        reportArticleLog.setCreatedUserId(userId);
        reportArticleLogService.save(reportArticleLog);
        return reportArticleLog;
    }
}
