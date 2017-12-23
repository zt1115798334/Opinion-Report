package com.opinion.mysql.service.impl;

import com.opinion.mysql.entity.ReportArticleFile;
import com.opinion.mysql.repository.ReportArticleFileRepository;
import com.opinion.mysql.service.ReportArticleFileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/12/23
 */
@Service
public class ReportArticleFileServiceImpl implements ReportArticleFileService {

    @Autowired
    private ReportArticleFileRepository reportArticleFileRepository;

    @Override
    public void save(List<ReportArticleFile> reportArticleFiles) {
        reportArticleFileRepository.save(reportArticleFiles);
    }
}
