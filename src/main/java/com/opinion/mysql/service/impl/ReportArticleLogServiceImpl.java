package com.opinion.mysql.service.impl;

import com.opinion.mysql.entity.ReportArticleLog;
import com.opinion.mysql.entity.SysUser;
import com.opinion.mysql.repository.ReportArticleLogRepository;
import com.opinion.mysql.service.ReportArticleLogService;
import com.opinion.mysql.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/11/15
 */
@Service
public class ReportArticleLogServiceImpl implements ReportArticleLogService {

    @Autowired
    private ReportArticleLogRepository reportArticleLogRepository;

    @Autowired
    private SysUserService sysUserService;

    @Override
    public ReportArticleLog save(ReportArticleLog reportArticleLog) {
        return reportArticleLogRepository.save(reportArticleLog);
    }

    @Override
    public List<ReportArticleLog> findListByReportArticleId(String reportCode) {
        Sort sort = new Sort(Sort.Direction.ASC, "createdDatetime");
        List<ReportArticleLog> reportArticleLogs = reportArticleLogRepository.findAllByReportCode(reportCode, sort);
        reportArticleLogs.forEach(reportArticleLog -> {
            Long createdUserId = reportArticleLog.getCreatedUserId();
            SysUser sysUser = sysUserService.findById(createdUserId);
            reportArticleLog.setUserName(sysUser.getUserName());
        });
        return reportArticleLogs;
    }
}
