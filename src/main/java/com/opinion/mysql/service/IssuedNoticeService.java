package com.opinion.mysql.service;

import com.opinion.mysql.entity.IssuedNotice;
import org.springframework.data.domain.Page;

import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/11/16
 */
public interface IssuedNoticeService {

    /**
     * 保存
     *
     * @param issuedNotice 下达通知
     * @return
     */
    IssuedNotice save(IssuedNotice issuedNotice);

    /**
     * 根据通知编号查询
     *
     * @param noticeCode 通知编号
     * @return
     */
    IssuedNotice findOneByNoticeCode(String noticeCode);

    /**
     * 根据创建人id查询
     *
     * @param issuedNotice 下达通知
     * @return
     */
    Page<IssuedNotice> findPageByCreatedUserId(IssuedNotice issuedNotice);

    /**
     * 根据回执人id查询
     *
     * @param issuedNotice 下达通知
     * @return
     */
    Page<IssuedNotice> findPageByReceiptUserId(IssuedNotice issuedNotice);

    /**
     * 执行回执操作
     *
     * @param noticeCode 通知编号
     * @return
     */
    IssuedNotice replyExecution(String noticeCode);

    /**
     * 根据id集合批量删除
     *
     * @param ids id集合
     * @return
     */
    boolean delByIds(List<Long> ids);

    /**
     * 根据创建人id删除
     *
     * @param createdUserId 创建人id
     * @return
     */
    boolean delByCreatedUserId(Long createdUserId);
}
