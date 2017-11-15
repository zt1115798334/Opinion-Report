package com.opinion.mysql.service.impl;

import com.opinion.mysql.entity.ReportArticleLog;
import com.opinion.mysql.repository.ReportArticleLogRepository;
import com.opinion.mysql.service.ReportArticleLogService;
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

    @Override
    public ReportArticleLog save(ReportArticleLog reportArticleLog) {
        return reportArticleLogRepository.save(reportArticleLog);
    }

    @Override
    public List<ReportArticleLog> findListByReportArticleId(Long reportArticleId) {
        Sort sort = new Sort(Sort.Direction.ASC, "createdDate");
        return reportArticleLogRepository.findAllByReportArticleId(reportArticleId, sort);
    }
}
