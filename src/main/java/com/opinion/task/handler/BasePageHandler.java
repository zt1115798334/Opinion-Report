package com.opinion.task.handler;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.ThreadPoolExecutor;

/**
 * @author zhangtong
 * Created by on 2017/11/23
 */
public abstract class BasePageHandler<T> {
    protected final Logger logger = LoggerFactory.getLogger(this.getClass());

    public void handle(T filterObject) {
        try {
            logger.info("处理数据开始");

            prepareFilterObject(filterObject);

            int corePoolSize = 10;
            ThreadPoolExecutor executor = new ScheduledThreadPoolExecutor(corePoolSize);
            int total = 0;
            int count = handleData(executor);
            total += count;

            executor.shutdown();

            logger.info("共处理了{}条数据", total);
            logger.info("处理数据结束");
        } catch(Exception e) {
            logger.error("处理数据出错，异常信息：{} ", e);
        }
    }

    private int handleData(ThreadPoolExecutor executor) {
        int total = 0;
        int pageNumber = 1;

        Page<T> page = getPageList(pageNumber);
        long totalPages = page.getTotalPages();
        List<T> list = page.getContent();

        logger.info("第1页数据处理开始");
        int count = handleDataOfPerPage(list, pageNumber, executor);
        logger.info("第1页数据处理结束，处理了{}条数据", count);
        total += count;

        for (int i = 2; i <= totalPages; i++) {
            page = getPageList(i);
            list = page.getContent();
            logger.info("第{}页数据处理开始", i);
            count = handleDataOfPerPage(list, i, executor);
            logger.info("第{}页数据处理结束，处理了{}条数据", i, count);
            total += count;
        }
        return total;
    }

    protected abstract int handleDataOfPerPage(List<T> list, int pageNumber,
                                               ThreadPoolExecutor executor);

    protected Page<T> getPageList(int pageNumber) {
        return null;
    }

    protected abstract void prepareFilterObject(T filterObject);
}
