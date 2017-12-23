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

}
