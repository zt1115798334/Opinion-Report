package com.opinion.mysql.service.impl;

import com.opinion.constants.SysConst;
import com.opinion.constants.SysUserConst;
import com.opinion.mysql.entity.SysMessage;
import com.opinion.mysql.repository.SysMessageRepository;
import com.opinion.mysql.service.SysMessageService;
import com.opinion.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author zhangtong
 * Created by on 2017/11/21
 */
@Service
public class SysMessageServiceImpl implements SysMessageService {

    @Autowired
    private SysMessageRepository sysMessageRepository;

    @Override
    public SysMessage save(SysMessage sysMessage) {
        Long userId = new SysUserConst().getUserId();
        LocalDate currentDate = DateUtils.currentDate();
        LocalDateTime currentDatetime = DateUtils.currentDatetime();
        sysMessage.setStatus(SysConst.MessageState.UNREAD.getCode());
        sysMessage.setPublishDate(currentDate);
        sysMessage.setPublishDatetime(currentDatetime);
        sysMessage.setPublishUserId(userId);
        return sysMessageRepository.save(sysMessage);
    }

    @Override
    public Iterable<SysMessage> save(List<SysMessage> sysMessages) {
        Long userId = new SysUserConst().getUserId();
        LocalDate currentDate = DateUtils.currentDate();
        LocalDateTime currentDatetime = DateUtils.currentDatetime();
        List<SysMessage> newSysMessages = sysMessages.stream()
                .map(sysMessage -> {
                    sysMessage.setStatus(SysConst.MessageState.UNREAD.getCode());
                    sysMessage.setPublishDate(currentDate);
                    sysMessage.setPublishDatetime(currentDatetime);
                    sysMessage.setPublishUserId(userId);
                    return sysMessage;
                }).collect(Collectors.toList());
        return sysMessageRepository.save(newSysMessages);
    }

    @Override
    public List<SysMessage> findByRelationUserId(Long relationUserId, String status) {
        Sort sort = new Sort(Sort.Direction.DESC, "publishDatetime");
        return sysMessageRepository.findByRelationUserIdAndStatus(relationUserId, status, sort);
    }


    @Override
    public boolean executeRead(Long id) {
        SysMessage sysMessage = sysMessageRepository.findOne(id);
        sysMessage.setStatus(SysConst.MessageState.READ.getCode());
        sysMessageRepository.save(sysMessage);
        return true;
    }

    @Override
    public boolean executeRead() {
        Long userId = new SysUserConst().getUserId();
        List<SysMessage> sysMessages = findByRelationUserId(userId, SysConst.MessageState.UNREAD.getCode());
        readList(sysMessages);
        return true;
    }

    @Override
    public boolean executeRead(List<Long> ids) {
        List<SysMessage> sysMessages = (List<SysMessage>) sysMessageRepository.findAll(ids);
        readList(sysMessages);
        return true;
    }

    private void readList(List<SysMessage> sysMessages) {
        sysMessages = sysMessages.stream().map(sysMessage -> {
            sysMessage.setStatus(SysConst.MessageState.READ.getCode());
            return sysMessage;
        }).collect(Collectors.toList());
        sysMessageRepository.save(sysMessages);
    }
}
