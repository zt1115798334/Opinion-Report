package com.opinion.mongodb.service.impl;

import com.opinion.mongodb.entity.UserFingerprint;
import com.opinion.mongodb.repository.UserFingerprintRepository;
import com.opinion.mongodb.service.UserFingerprintService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author zhangtong
 * Created by on 2017/12/15
 */
@Service
public class UserFingerprintServiceImpl implements UserFingerprintService{

    @Autowired
    private UserFingerprintRepository userFingerprintRepository;

    @Override
    public void save(UserFingerprint userFingerprint) {
        userFingerprintRepository.save(userFingerprint);
    }

    @Override
    public UserFingerprint findByUserId(Long userId) {
        return userFingerprintRepository.findByUserId(userId);
    }
}
