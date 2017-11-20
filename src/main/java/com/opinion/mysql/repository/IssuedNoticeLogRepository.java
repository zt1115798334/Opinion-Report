package com.opinion.mysql.repository;

import com.opinion.mysql.entity.IssuedNoticeLog;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/11/16
 */
public interface IssuedNoticeLogRepository extends CrudRepository<IssuedNoticeLog, Long> {

    List<IssuedNoticeLog> findByReceiptUserId(Long receiptUserId);

    List<IssuedNoticeLog> findByNoticeCode(String noticeCode, Sort sort);

    IssuedNoticeLog findByNoticeCodeAndReceiptUserId(String noticeCode, Long receiptUserId);

    long countByNoticeCode(String noticeCode);

    long countByNoticeCodeAndReceiptState(String noticeCode, String receiptState);
}
