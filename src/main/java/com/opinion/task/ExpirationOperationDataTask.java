package com.opinion.task;

import com.opinion.constants.SysConst;
import com.opinion.mysql.entity.ReportArticle;
import com.opinion.task.handler.BasePageHandler;
import com.opinion.utils.DateUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.time.LocalDate;

/**
 * @author zhangtong
 * Created by on 2017/11/23
 */
@Component
public class ExpirationOperationDataTask {

    protected final Logger logger = LoggerFactory.getLogger(ExpirationOperationDataTask.class);

    @Autowired
    @Qualifier("expirationOperationPageHandler")
    protected BasePageHandler expirationOperationPageHandler;

    /**
     * @Scheduled(fixedDelay = 3600000)
     */
    @Scheduled(cron = "0 00 23 * * ?")
    public void execute() {
        ReportArticle reportArticle = new ReportArticle();
        reportArticle.setExpireDate(DateUtils.currentDate());
        reportArticle.setAdoptState(SysConst.AdoptState.REPORT.getCode());
        reportArticle.setPageSize(SysConst.DEFAULT_BATCH_SIZE);
        reportArticle.setPageNumber(SysConst.DEFAULT_PAGE_NUMBER);
        expirationOperationPageHandler.handle(reportArticle);
    }
}
