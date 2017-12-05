package com.opinion.task.handler;

import com.opinion.constants.SysConst;
import com.opinion.mysql.entity.ReportArticle;
import com.opinion.mysql.service.ReportArticleService;
import com.opinion.task.ExpirationOperationCallableTask;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.ThreadPoolExecutor;

/**
 * @author zhangtong
 * Created by on 2017/11/23
 */
@Component("expirationOperationPageHandler")
public class ExpirationOperationPageHandler extends BasePageHandler<ReportArticle> {

    @Autowired
    private ReportArticleService reportArticleService;

    /**
     * 用作查询条件的对象
     */
    private ReportArticle filterObject;

    @Override
    protected void prepareFilterObject(ReportArticle filterObject) {
        if (filterObject == null) {
            throw new IllegalArgumentException("查询对象不能为null");
        }
        this.filterObject = filterObject;
        if (filterObject.getPageNumber() == 0) {
            this.filterObject.setPageNumber(1);
        }
        if (filterObject.getPageSize() == 0) {
            this.filterObject.setPageSize(SysConst.DEFAULT_BATCH_SIZE);
        }
        this.filterObject.setAdoptState(filterObject.getAdoptState());
        this.filterObject.setExpireDate(filterObject.getExpireDate());
    }

    @Override
    protected int handleDataOfPerPage(List<ReportArticle> list, int pageNumber, ThreadPoolExecutor executor) {
        int count = 0;
        try {
            ExpirationOperationCallableTask task =
                    new ExpirationOperationCallableTask(list, reportArticleService);
            Future<Integer> future = executor.submit(task);
            count += future.get();
        } catch(ExecutionException | InterruptedException e) {
            logger.error("获取执行结果时发生异常，异常信息：{}", e);
        }

        return count;
    }

    @Override
    protected Page<ReportArticle> getPageList(int pageNumber) {
        filterObject.setPageNumber(pageNumber);
        return reportArticleService.findAdoptStatePage(filterObject);
    }
}
