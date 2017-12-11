package com.opinion.mysql.service.impl;

import com.google.common.collect.Lists;
import com.opinion.constants.SysConst;
import com.opinion.constants.SysUserConst;
import com.opinion.mysql.entity.ReportArticle;
import com.opinion.mysql.entity.ReportArticleLog;
import com.opinion.mysql.entity.SysMessage;
import com.opinion.mysql.entity.SysUser;
import com.opinion.mysql.repository.ReportArticleRepository;
import com.opinion.mysql.service.ReportArticleLogService;
import com.opinion.mysql.service.ReportArticleService;
import com.opinion.mysql.service.SysMessageService;
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
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * @author zhangtong
 * Created by on 2017/11/13
 */
@Transactional
@Service
public class ReportArticleServiceImpl implements ReportArticleService {

    @Autowired
    private ReportArticleRepository reportArticleRepository;

    @Autowired
    private SysUserService sysUserService;

    @Autowired
    private ReportArticleLogService reportArticleLogService;

    @Autowired
    private SysMessageService sysMessageService;

    @Override
    public ReportArticle save(ReportArticle reportArticle) {
        Long userId = new SysUserConst().getUserId();
        LocalDate currentDate = DateUtils.currentDate();
        LocalDateTime currentDatetime = DateUtils.currentDatetime();
        reportArticle.setReportCode(SNUtil.create15());
        reportArticle.setReportSource(SysConst.ReportSource.ARTIFICIAL.getCode());
        reportArticle.setPublishDatetime(currentDatetime);
        reportArticle.setAdoptState(SysConst.AdoptState.REPORT.getCode());
        reportArticle.setExpireDate(DateUtils.currentDateAfterSevenDays().toLocalDate());
        reportArticle.setCreatedDate(currentDate);
        reportArticle.setCreatedDatetime(currentDatetime);
        reportArticle.setCreatedUserId(userId);
        reportArticle.setModifiedDate(currentDate);
        reportArticle.setModifiedDatetime(currentDatetime);
        reportArticle.setModifiedUserId(userId);
        reportArticle = reportArticleRepository.save(reportArticle);
        saveReportArticleLog(reportArticle.getReportCode(), reportArticle.getAdoptState(), null, userId);
        return reportArticle;
    }

    @Override
    public ReportArticle saveAgain(String reportCode) {
        ReportArticle reportArticle = reportArticleRepository.findByReportCode(reportCode);
        ReportArticle newReportArticle = new ReportArticle();
        if (reportArticle != null) {

            newReportArticle.setReportLevel(reportArticle.getReportLevel());
            newReportArticle.setSourceUrl(reportArticle.getSourceUrl());
            newReportArticle.setSourceType(reportArticle.getSourceType());
            newReportArticle.setTitle(reportArticle.getTitle());
            newReportArticle.setReplyType(reportArticle.getReplyType());
            newReportArticle.setReplyNumber(reportArticle.getReplyNumber());
            newReportArticle.setReportCause(reportArticle.getReportCause());

            newReportArticle.setId(null);
            newReportArticle.setAdoptState(SysConst.AdoptState.REPORT.getCode());
            newReportArticle.setAdoptDatetime(null);
            newReportArticle.setAdoptUserId(null);
            newReportArticle = save(newReportArticle);
        }
        return newReportArticle;
    }

    @Override
    public ReportArticle findOneByreportCode(String reportCode) {
        return reportArticleRepository.findByReportCode(reportCode);
    }

    @Override
    public Page<ReportArticle> findPageByCreateUser(ReportArticle reportArticle) {
        Specification<ReportArticle> specification = new Specification<ReportArticle>() {
            @Override
            public Predicate toPredicate(Root<ReportArticle> root, CriteriaQuery<?> query, CriteriaBuilder builder) {
                List<Predicate> predicates = Lists.newArrayList();
                predicates.add(builder.equal(root.get("createdUserId").as(Long.class), reportArticle.getCreatedUserId()));
                if (StringUtils.isNotEmpty(reportArticle.getTitle())) {
                    predicates.add(builder.like(root.get("title").as(String.class), "%" + reportArticle.getTitle() + "%"));
                }
                if (StringUtils.isNotEmpty(reportArticle.getAdoptState())) {
                    predicates.add(builder.equal(root.get("adoptState").as(String.class), reportArticle.getAdoptState()));
                }
                if (StringUtils.isNotEmpty(reportArticle.getSourceType())) {
                    predicates.add(builder.equal(root.get("sourceType").as(String.class), reportArticle.getSourceType()));
                }

                Predicate[] pre = new Predicate[predicates.size()];
                query.where(predicates.toArray(pre));

                return builder.and(predicates.toArray(pre));
            }
        };
        Pageable pageable = PageUtils.buildPageRequest(reportArticle.getPageNumber(),
                reportArticle.getPageSize(),
                reportArticle.getSortName(),
                reportArticle.getSortOrder());
        Page<ReportArticle> result = reportArticleRepository.findAll(specification, pageable);
        return result;
    }

    @Override
    public Page<ReportArticle> findPageByInChild(ReportArticle reportArticle) {
        List<Long> userId = sysUserService.findChildIdListByParentId(reportArticle.getCreatedUserId());
        if (userId.size() == 0) {
            userId.add(-1L);
        }
        Specification<ReportArticle> specification = new Specification<ReportArticle>() {
            @Override
            public Predicate toPredicate(Root<ReportArticle> root, CriteriaQuery<?> query, CriteriaBuilder builder) {
                List<Predicate> predicates = Lists.newArrayList();
                CriteriaBuilder.In<Long> in = builder.in(root.get("createdUserId").as(Long.class));
                userId.forEach(userid -> in.value(userid));
                predicates.add(in);
                if (StringUtils.isNotEmpty(reportArticle.getTitle())) {
                    predicates.add(builder.like(root.get("title").as(String.class), reportArticle.getTitle()));
                }
                if (StringUtils.isNotEmpty(reportArticle.getAdoptState())) {
                    predicates.add(builder.equal(root.get("adoptState").as(String.class), reportArticle.getAdoptState()));
                }
                if (StringUtils.isNotEmpty(reportArticle.getSourceType())) {
                    predicates.add(builder.equal(root.get("sourceType").as(String.class), reportArticle.getSourceType()));
                }
                Predicate[] pre = new Predicate[predicates.size()];
                query.where(predicates.toArray(pre));

                return builder.and(predicates.toArray(pre));
            }
        };
        Pageable pageable = PageUtils.buildPageRequest(reportArticle.getPageNumber(),
                reportArticle.getPageSize(),
                reportArticle.getSortName(),
                reportArticle.getSortOrder());
        Page<ReportArticle> result = reportArticleRepository.findAll(specification, pageable);
        return result;
    }

    @Override
    public Page<ReportArticle> findAdoptStatePage(ReportArticle reportArticle) {
        Specification<ReportArticle> specification = new Specification<ReportArticle>() {
            @Override
            public Predicate toPredicate(Root<ReportArticle> root, CriteriaQuery<?> query, CriteriaBuilder builder) {
                query.where(builder.and(builder.equal(root.get("expireDate").as(LocalDate.class), reportArticle.getExpireDate())));
                query.where(builder.and(builder.equal(root.get("adoptState").as(String.class), reportArticle.getAdoptState())));
                return null;
            }
        };
        Pageable pageable = PageUtils.buildPageRequest(reportArticle.getPageNumber(),
                reportArticle.getPageSize(),
                reportArticle.getSortName(),
                reportArticle.getSortOrder());
        Page<ReportArticle> result = reportArticleRepository.findAll(specification, pageable);
        return result;
    }

    @Override
    public boolean examineAndVerify(ReportArticle reportArticle) {
        SysUser sysUser = new SysUserConst().getSysUser();
        Long userId = sysUser.getId();
        StringBuilder title = new StringBuilder();
        title.append("用户：").append(sysUser.getUserName())
                .append(SysConst.getAdoptStateByCode(reportArticle.getAdoptState()).getName()).append("舆情上报");
        return saveReportArticleAndLog(reportArticle, userId, title);
    }

    @Override
    public boolean examineAndVerifyInSystem(ReportArticle reportArticle) {
        Long userId = reportArticle.getCreatedUserId();
        StringBuilder title = new StringBuilder();
        title.append("系统关闭：").append("舆情上报");
        return saveReportArticleAndLog(reportArticle, userId, title);
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

    @Override
    public boolean delByIds(List<Long> ids) {
        List<ReportArticle> reportArticles = (List<ReportArticle>) reportArticleRepository.findAll(ids);
        delReportArticleAndReportArticleLog(reportArticles);
        return true;
    }

    @Override
    public boolean delByCreatedUserId(Long createdUserId) {
        List<ReportArticle> reportArticles = reportArticleRepository.findByCreatedUserId(createdUserId);
        delReportArticleAndReportArticleLog(reportArticles);
        return true;
    }

    private boolean saveReportArticleAndLog(ReportArticle reportArticle, Long userId, StringBuilder title) {
        LocalDateTime adoptDatetime = DateUtils.currentDatetime();
        String reportCode = reportArticle.getReportCode();
        ReportArticle result = reportArticleRepository.findByReportCode(reportCode);
        if (result != null && Objects.equals(result.getAdoptState(), SysConst.AdoptState.REPORT.getCode())) {
            String adoptState = reportArticle.getAdoptState();
            String adoptOpinion = reportArticle.getAdoptOpinion();

            result.setAdoptDatetime(adoptDatetime);
            result.setAdoptUserId(userId);
            result.setAdoptState(adoptState);
            result.setAdoptOpinion(adoptOpinion);
            result = reportArticleRepository.save(result);
            saveReportArticleLog(reportCode, adoptState, adoptOpinion, userId);

            /**
             * 保存系统消息
             */
            StringBuilder subtitle = new StringBuilder();
            subtitle.append("《").append(result.getTitle()).append("》");

            SysMessage sysMessage = new SysMessage();
            sysMessage.setType(SysConst.ImportOrExport.IMPORT.getCode());
            sysMessage.setAdoptState(adoptState);
            sysMessage.setPublishUserId(userId);
            sysMessage.setRelationUserId(result.getCreatedUserId());
            sysMessage.setTitle(title.toString());
            sysMessage.setSubtitle(subtitle.toString());
            sysMessage.setUrl(SysConst.OPINION_REPORT_INFO_URL_EXAMINE + reportCode);
            sysMessageService.save(sysMessage);
            return true;
        } else {
            return false;
        }
    }


    public ReportArticleLog saveReportArticleLog(String reportCode,
                                                 String adoptState,
                                                 String adoptOpinion,
                                                 Long userId) {
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

    private void delReportArticleAndReportArticleLog(List<ReportArticle> reportArticles) {
        List<String> reportCodes = reportArticles.stream().map(ReportArticle::getReportCode).collect(Collectors.toList());
        reportArticleLogService.delByReportCodes(reportCodes);
        reportArticleRepository.delete(reportArticles);
    }
}
