package com.opinion.mongodb.service.impl;

import com.google.common.base.Objects;
import com.opinion.mongodb.entity.UserFingerprint;
import com.opinion.mongodb.repository.UserFingerprintRepository;
import com.opinion.mongodb.service.UserFingerprintService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import zk.jni.JavaToBiokey;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @author zhangtong
 * Created by on 2017/12/15
 */
@Service
public class UserFingerprintServiceImpl implements UserFingerprintService {

    @Autowired
    private UserFingerprintRepository userFingerprintRepository;

    @Override
    public UserFingerprint save(UserFingerprint userFingerprint) {
        this.deleteByUserId(userFingerprint.getUserId());
        String fingerprint = userFingerprint.getFingerprint();
        List<UserFingerprint> allUF = this.findAll();
        if (allUF == null && allUF.size() == 0) {
            return userFingerprintRepository.save(userFingerprint);
        }
        List<UserFingerprint> matchingFingerprint = allUF.stream()
                .filter(cf -> !Objects.equal(cf.getFingerprint(), fingerprint))
                .filter(cf -> this.verificationFingerprint(cf.getFingerprint(), fingerprint))
                .collect(Collectors.toList());
        if (matchingFingerprint != null && matchingFingerprint.size() > 0) {
            return null;
        }
        return userFingerprintRepository.save(userFingerprint);
    }

    @Override
    public List<UserFingerprint> findAll() {
        return userFingerprintRepository.findAll();
    }

    @Override
    public UserFingerprint findByUserId(Long userId) {
        return userFingerprintRepository.findByUserId(userId);
    }

    @Override
    public boolean deleteByUserId(Long userId) {
        userFingerprintRepository.deleteByUserId(userId);
        return false;
    }

    @Override
    public boolean verificationFingerprintByUserId(Long userId, String fingerprint) {
        UserFingerprint userFingerprint = this.findByUserId(userId);
        if (userFingerprint != null) {
            return JavaToBiokey.NativeToProcess(fingerprint, userFingerprint.getFingerprint());
        } else {
            return false;
        }
    }

    @Override
    public boolean verificationFingerprint(String fingerprint1, String fingerprint2) {
        return JavaToBiokey.NativeToProcess(fingerprint1, fingerprint2);
    }

    @Override
    public boolean isExistFingerprint(Long userId) {
        UserFingerprint userFingerprint = this.findByUserId(userId);
        return userFingerprint != null;
    }
}
