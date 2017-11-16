package com.opinion.mysql.service;

import com.opinion.mysql.entity.IssuedNoticeLog;

import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/11/16
 */
public interface IssuedNoticeLogService {

    Iterable<IssuedNoticeLog> save(List<IssuedNoticeLog> issuedNoticeLogs);

    IssuedNoticeLog readIssuedNotice(String noticeCode,Long receiptUserId);

    List<IssuedNoticeLog> findListByReceiptUserId(Long receiptUserId);

    IssuedNoticeLog findByNoticeCodeAndReceiptUserId(String noticeCode,Long receiptUserId);

    long findCountByNoticeCode(String noticeCode);

    long findCountByNoticeCodeAndReceiptState(String noticeCode, String receiptState);
}
