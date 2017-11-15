package com.opinion.mysql.service;

import com.opinion.mysql.entity.ReportArticleLog;

import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/11/15
 */
public interface ReportArticleLogService {

    ReportArticleLog save(ReportArticleLog reportArticleLog);

    List<ReportArticleLog> findListByReportArticleId(Long reportArticleId);
}
