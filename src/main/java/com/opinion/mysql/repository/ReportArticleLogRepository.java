package com.opinion.mysql.repository;

import com.opinion.mysql.entity.ReportArticleLog;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/11/13
 */
public interface ReportArticleLogRepository extends CrudRepository<ReportArticleLog, Long> {

    List<ReportArticleLog> findAllByReportArticleId(Long reportArticleId, Sort sort);
}
