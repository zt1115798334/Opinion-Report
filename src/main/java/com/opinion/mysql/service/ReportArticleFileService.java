package com.opinion.mysql.service;

import com.opinion.mysql.entity.ReportArticleFile;

import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/12/23
 */
public interface ReportArticleFileService {

    /**
     * 保存
     * @param reportArticleFiles
     */
    void save(List<ReportArticleFile> reportArticleFiles);

    /**
     *
     * @param reportCode
     * @return
     */
    List<ReportArticleFile> findListByReportCode(String reportCode);

    /**
     *
     * @param reportCodes
     * @return
     */
    List<ReportArticleFile> findListByReportCodes(List<String> reportCodes);

    /**
     *
     * @param reportCodes
     * @return
     */
    boolean delByReportCodes(List<String> reportCodes);

}
