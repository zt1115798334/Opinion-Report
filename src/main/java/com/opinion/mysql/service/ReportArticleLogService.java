package com.opinion.mysql.service;

import com.opinion.mysql.entity.ReportArticleLog;

import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/11/15
 */
public interface ReportArticleLogService {

    /**
     * 保存
     *
     * @param reportArticleLog 报文章表log
     * @return
     */
    ReportArticleLog save(ReportArticleLog reportArticleLog);

    /**
     * 根据上传编号查询
     *
     * @param reportCode
     * @return
     */
    List<ReportArticleLog> findListByReportArticleId(String reportCode);

    /**
     * 根据上传编号批量删除
     *
     * @param reportCodes 上传编号集合
     * @return
     */
    boolean delByReportCodes(List<String> reportCodes);
}
