package com.opinion.mongodb.service;

import com.opinion.mongodb.entity.UserFingerprint;

/**
 * @author zhangtong
 * Created by on 2017/12/15
 */
public interface UserFingerprintService {

    UserFingerprint save(UserFingerprint userFingerprint);

    UserFingerprint findByUserId(Long userId);

    boolean deleteByUserId(Long userId);

    boolean verificationFingerprint(Long userId,String fingerprint);
}
