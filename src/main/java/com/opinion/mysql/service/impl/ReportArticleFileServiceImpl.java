package com.opinion.mysql.service.impl;

import com.opinion.mysql.entity.ReportArticleFile;
import com.opinion.mysql.repository.ReportArticleFileRepository;
import com.opinion.mysql.service.ReportArticleFileService;
import com.opinion.utils.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/12/23
 */
@Transactional
@Service
public class ReportArticleFileServiceImpl implements ReportArticleFileService {

    @Autowired
    private ReportArticleFileRepository reportArticleFileRepository;

    @Override
    public void save(List<ReportArticleFile> reportArticleFiles) {
        reportArticleFileRepository.save(reportArticleFiles);
    }

    @Override
    public ReportArticleFile findById(Long id) {
        return reportArticleFileRepository.findOne(id);
    }

    @Override
    public List<ReportArticleFile> findListByReportCode(String reportCode) {
        return reportArticleFileRepository.findByReportCode(reportCode);
    }

    @Override
    public List<ReportArticleFile> findListByReportCodes(List<String> reportCodes) {
        return reportArticleFileRepository.findByReportCodeIn(reportCodes);
    }

    @Override
    public boolean delByReportCodes(List<String> reportCodes) {
        List<ReportArticleFile> reportArticleFiles = this.findListByReportCodes(reportCodes);
        reportArticleFiles.stream()
                .forEach(reportArticleFile -> {
                    String filePath = reportArticleFile.getFilePath();
                    FileUtils.deleteFile(filePath);
                });
        reportArticleFileRepository.deleteByReportCodeIn(reportCodes);
        return true;
    }

    @Override
    public boolean delById(Long id) {
        ReportArticleFile reportArticleFile = this.findById(id);
        if (reportArticleFile != null) {
            String filePath = reportArticleFile.getFilePath();
            FileUtils.deleteFile(filePath);
            reportArticleFileRepository.delete(id);
            return true;
        } else {
            return false;
        }
    }
}
