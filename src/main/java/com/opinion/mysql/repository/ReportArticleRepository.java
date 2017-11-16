package com.opinion.mysql.repository;

import com.opinion.mysql.entity.ReportArticle;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/11/13
 */
public interface ReportArticleRepository extends CrudRepository<ReportArticle, Long>, JpaSpecificationExecutor<ReportArticle> {
    Page<ReportArticle> findAll(Specification<ReportArticle> specification, Pageable pageable);
}
