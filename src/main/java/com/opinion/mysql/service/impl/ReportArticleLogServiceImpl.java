package com.opinion.mysql.service.impl;

import com.opinion.mysql.entity.ReportArticleLog;
import com.opinion.mysql.repository.ReportArticleLogRepository;
import com.opinion.mysql.service.ReportArticleLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/11/15
 */
@Transactional
@Service
public class ReportArticleLogServiceImpl implements ReportArticleLogService {

    @Autowired
    private ReportArticleLogRepository reportArticleLogRepository;

    @Override
    public ReportArticleLog save(ReportArticleLog reportArticleLog) {
        return reportArticleLogRepository.save(reportArticleLog);
    }

    @Override
    public List<ReportArticleLog> findListByReportCode(String reportCode) {
        Sort sort = new Sort(Sort.Direction.DESC, "createdDatetime");
        List<ReportArticleLog> reportArticleLogs = reportArticleLogRepository.findAllByReportCode(reportCode, sort);
        return reportArticleLogs;
    }

    @Override
    public boolean delByReportCodes(List<String> reportCodes) {
        reportArticleLogRepository.deleteByReportCodeIn(reportCodes);
        return true;
    }
}
