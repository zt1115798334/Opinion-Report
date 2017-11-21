package com.opinion.mysql.service;

import com.opinion.mysql.entity.SysMessage;

import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/11/21
 */
public interface SysMessageService {

    SysMessage save(SysMessage sysMessage);

    Iterable<SysMessage> save(List<SysMessage> sysMessages);

    List<SysMessage> findByRelationUserId(Long relationUserId,String status);

    boolean executeRead(Long id);

    boolean executeRead(List<Long> ids);
}
