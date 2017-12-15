package com.opinion.mongodb.repository;

import com.opinion.mongodb.entity.UserFingerprint;
import org.springframework.data.mongodb.repository.MongoRepository;

/**
 * @author zhangtong
 * Created by on 2017/12/15
 */
public interface UserFingerprintRepository extends MongoRepository<UserFingerprint, String> {

    /**
     * 根据用户id查询
     *
     * @param userId
     * @return
     */
    UserFingerprint findByUserId(Long userId);
}
