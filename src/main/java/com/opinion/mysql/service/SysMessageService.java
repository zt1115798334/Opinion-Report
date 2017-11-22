package com.opinion.mysql.service;

import com.opinion.mysql.entity.SysMessage;

import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/11/21
 */
public interface SysMessageService {

    /**
     * 保存
     *
     * @param sysMessage 系统消息
     * @return
     */
    SysMessage save(SysMessage sysMessage);

    /**
     * 批量保存
     *
     * @param sysMessages 系统消息集合
     * @return
     */
    Iterable<SysMessage> save(List<SysMessage> sysMessages);

    /**
     * 根据关联人id 状态查询
     *
     * @param relationUserId 关联人id
     * @param status         状态
     * @return
     */
    List<SysMessage> findByRelationUserId(Long relationUserId, String status);

    /**
     * 根据id执行读取操作
     *
     * @param id id
     * @return
     */
    boolean executeRead(Long id);

    /**
     * 读取全部
     *
     * @return
     */
    boolean executeRead();

    /**
     * 根据id集合执行读取操作
     *
     * @param ids 集合
     * @return
     */
    boolean executeRead(List<Long> ids);

    /**
     * 删除相关 人的信息（创建的和有关联的）
     *
     * @param userId
     * @return
     */
    boolean delInRelevantUserId(Long userId);
}
