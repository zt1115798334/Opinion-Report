package com.opinion.mysql.service;

import com.opinion.mysql.entity.IssuedNoticeLog;

import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/11/16
 */
public interface IssuedNoticeLogService {

    /**
     * 保存
     *
     * @param issuedNoticeLogs 下达通知日志
     * @return
     */
    Iterable<IssuedNoticeLog> save(List<IssuedNoticeLog> issuedNoticeLogs);

    /**
     * 根据通知编号和回执人id执行读取操作
     *
     * @param noticeCode    通知编号
     * @param receiptUserId 回执人id
     * @return
     */
    IssuedNoticeLog readIssuedNotice(String noticeCode, Long receiptUserId);

    /**
     * 根据通知编号查询
     *
     * @param noticeCode 通知编号
     * @return
     */
    List<IssuedNoticeLog> findListByNoticeCode(String noticeCode);

    /**
     * 根据回执人id查询
     *
     * @param receiptUserId 回执人id
     * @return
     */
    List<IssuedNoticeLog> findListByReceiptUserId(Long receiptUserId);

    /**
     * 根据通知编号和回执人id 查询
     *
     * @param noticeCode
     * @param receiptUserId
     * @return
     */
    IssuedNoticeLog findByNoticeCodeAndReceiptUserId(String noticeCode, Long receiptUserId);

    /**
     * 根据通知编号查询数量
     *
     * @param noticeCode 通知编号
     * @return
     */
    long findCountByNoticeCode(String noticeCode);

    /**
     * 根据通知编号和通知状态查询数量
     *
     * @param noticeCode   通知编号
     * @param receiptState 通知状态
     * @return
     */
    long findCountByNoticeCodeAndReceiptState(String noticeCode, String receiptState);

    /**
     * 根据通知编号批量删除
     *
     * @param noticeCode 通知编号
     * @return
     */
    boolean delByNoticeCodes(List<String> noticeCode);
}
