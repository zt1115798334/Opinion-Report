package com.opinion.mysql.repository;

import com.opinion.mysql.entity.SysMessage;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/11/21
 */
public interface SysMessageRepository extends CrudRepository<SysMessage,Long> {

    List<SysMessage> findByRelationUserIdAndStatus(Long relationUserId,String status,Sort sort);
}
