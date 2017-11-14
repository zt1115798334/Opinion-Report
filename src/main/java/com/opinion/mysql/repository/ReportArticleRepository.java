package com.opinion.mysql.repository;

import com.opinion.mysql.entity.ReportArticle;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/11/13
 */
public interface ReportArticleRepository extends CrudRepository<ReportArticle, Long> {
    List<ReportArticle> findByCreatedUser(String createUser);

    Page<ReportArticle> findByCreatedUser(String createUser, Pageable pageable);
}
