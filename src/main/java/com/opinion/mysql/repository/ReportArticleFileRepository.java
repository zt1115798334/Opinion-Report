package com.opinion.mysql.repository;

import com.opinion.mysql.entity.ReportArticleFile;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/12/23
 */
public interface ReportArticleFileRepository extends CrudRepository<ReportArticleFile, Long> {

    List<ReportArticleFile> findByReportCode(String reportCode);

    List<ReportArticleFile> findByReportCodeIn(List<String> reportCodes);

    void deleteByReportCodeIn(List<String> reportCodes);
}
