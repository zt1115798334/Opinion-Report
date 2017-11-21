package com.opinion.mysql.service.impl;

import com.opinion.constants.SysConst;
import com.opinion.mysql.entity.IssuedNoticeLog;
import com.opinion.mysql.repository.IssuedNoticeLogRepository;
import com.opinion.mysql.service.IssuedNoticeLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/11/16
 */
@Service
public class IssuedNoticeLogServiceImpl implements IssuedNoticeLogService {

    @Autowired
    private IssuedNoticeLogRepository issuedNoticeLogRepository;

    @Override
    public Iterable<IssuedNoticeLog> save(List<IssuedNoticeLog> issuedNoticeLogs) {
        return issuedNoticeLogRepository.save(issuedNoticeLogs);
    }

    @Override
    public IssuedNoticeLog readIssuedNotice(String noticeCode, Long receiptUserId) {
        IssuedNoticeLog issuedNoticeLog = findByNoticeCodeAndReceiptUserId(noticeCode, receiptUserId);
        if (issuedNoticeLog != null) {
            issuedNoticeLog.setReceiptState(SysConst.ReceiptState.READ.getCode());
            issuedNoticeLogRepository.save(issuedNoticeLog);
        }
        return issuedNoticeLog;
    }

    @Override
    public List<IssuedNoticeLog> findListByNoticeCode(String noticeCode) {
        Sort sort = new Sort(Sort.Direction.ASC, "createdDatetime");
        return issuedNoticeLogRepository.findByNoticeCode(noticeCode, sort);
    }

    @Override
    public List<IssuedNoticeLog> findListByReceiptUserId(Long receiptUserId) {
        return issuedNoticeLogRepository.findByReceiptUserId(receiptUserId);
    }

    @Override
    public IssuedNoticeLog findByNoticeCodeAndReceiptUserId(String noticeCode, Long receiptUserId) {
        return issuedNoticeLogRepository.findByNoticeCodeAndReceiptUserId(noticeCode, receiptUserId);
    }

    @Override
    public long findCountByNoticeCode(String noticeCode) {
        return issuedNoticeLogRepository.countByNoticeCode(noticeCode);

    }

    @Override
    public long findCountByNoticeCodeAndReceiptState(String noticeCode, String receiptState) {
        return issuedNoticeLogRepository.countByNoticeCodeAndReceiptState(noticeCode, receiptState);
    }

    @Override
    public boolean delByNoticeCodes(List<String> noticeCode) {
        issuedNoticeLogRepository.deleteByNoticeCodeIn(noticeCode);
        return true;
    }
}
