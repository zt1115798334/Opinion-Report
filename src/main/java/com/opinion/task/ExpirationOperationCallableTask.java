package com.opinion.task;

import com.opinion.constants.SysConst;
import com.opinion.mysql.entity.ReportArticle;
import com.opinion.mysql.service.ReportArticleService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;
import java.util.concurrent.Callable;

/**
 * @author zhangtong
 * Created by on 2017/11/23
 */
public class ExpirationOperationCallableTask implements Callable<Integer> {

    protected final Logger logger = LoggerFactory.getLogger(ExpirationOperationCallableTask.class);

    private List<ReportArticle> list;
    private ReportArticleService reportArticleService;

    public ExpirationOperationCallableTask(List<ReportArticle> list, ReportArticleService reportArticleService) {
        this.list = list;
        this.reportArticleService = reportArticleService;
    }

    @Override
    public Integer call() {
        list.parallelStream().forEach(ra -> {
            ra.setAdoptState(SysConst.AdoptState.NOTADOPTED.getCode());
            ra.setAdoptOpinion(SysConst.DEFAULT_ADOPT_OPINION);
            boolean flag = reportArticleService.examineAndVerifyInSystem(ra);
        });
        return 0;
    }
}
