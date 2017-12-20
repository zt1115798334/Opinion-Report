package com.opinion.mongodb.service;

import com.opinion.mongodb.entity.UserFingerprint;

import java.util.List;

/**
 * @author zhangtong
 * Created by on 2017/12/15
 */
public interface UserFingerprintService {

    UserFingerprint save(UserFingerprint userFingerprint);

    List<UserFingerprint> findAll();

    UserFingerprint findByUserId(Long userId);

    boolean deleteByUserId(Long userId);

    boolean verificationFingerprintByUserId(Long userId, String fingerprint);

    boolean verificationFingerprint(String fingerprint1,String fingerprint2);

    boolean isExistFingerprint(Long userId);
}
