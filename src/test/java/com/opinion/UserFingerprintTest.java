package com.opinion;

import com.opinion.base.BaseTest;
import com.opinion.mongodb.entity.UserFingerprint;
import com.opinion.mongodb.service.UserFingerprintService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author zhangtong
 * Created by on 2017/12/15
 */
public class UserFingerprintTest extends BaseTest {

    @Autowired
    private UserFingerprintService userFingerprintService;

    @Test
    public void testAdd(){
        UserFingerprint userFingerprint = new UserFingerprint(1L,"1111111");
        userFingerprintService.save(userFingerprint);
    }
}
