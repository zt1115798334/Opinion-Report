package com.opinion.mysql.service.impl;

import com.opinion.mysql.entity.ReportArticle;
import com.opinion.mysql.repository.ReportArticleRepository;
import com.opinion.mysql.service.ReportArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/11/13
 */
@Service
public class ReportArticleServiceImpl implements ReportArticleService {

    @Autowired
    private ReportArticleRepository reportArticleRepository;

    @Override
    public ReportArticle save(ReportArticle reportArticle) {
        return reportArticleRepository.save(reportArticle);
    }

    @Override
    public ReportArticle findOneById(Long id) {
        return reportArticleRepository.findOne(id);
    }

    @Override
    public List<ReportArticle> findListByCreatedUser(String createdUser) {
        return reportArticleRepository.findByCreatedUser(createdUser);
    }

    @Override
    public Page<ReportArticle> findPageByCreateUser(String createdUser, int page, int size, String sortParam, String sortType) {
        Sort sort = new Sort(Sort.Direction.DESC, "id");
        Pageable pageable = new PageRequest(page, size, sort);
        Page<ReportArticle> result = reportArticleRepository.findByCreatedUser(createdUser, pageable);
        return result;
    }

    @Override
    public ReportArticle examineAndVerify(Long id, LocalDateTime adoptDate, String adoptUser, String adoptState) {
        ReportArticle reportArticle = reportArticleRepository.findOne(id);
        if (reportArticle != null) {
            reportArticle.setAdoptDate(adoptDate);
            reportArticle.setAdoptUser(adoptUser);
            reportArticle.setAdoptState(adoptState);
            reportArticle = reportArticleRepository.save(reportArticle);
        }
        return reportArticle;
    }
}
