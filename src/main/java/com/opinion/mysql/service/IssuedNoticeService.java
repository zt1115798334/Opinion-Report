package com.opinion.mysql.service;

import com.opinion.mysql.entity.IssuedNotice;
import org.springframework.data.domain.Page;

import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/11/16
 */
public interface IssuedNoticeService {

    IssuedNotice save(IssuedNotice issuedNotice);

    IssuedNotice findOneByNoticeCode(String noticeCode);

    Page<IssuedNotice> findPageByCreatedUserId(IssuedNotice issuedNotice);

    Page<IssuedNotice> findPageByReceiptUserId(IssuedNotice issuedNotice);

    /**
     * 执行回执操作
     *
     * @param noticeCode
     * @return
     */
    IssuedNotice replyExecution(String noticeCode);

    boolean delByIds(List<Long> ids);

    boolean delByCreatedUserId(Long createdUserId);
}
