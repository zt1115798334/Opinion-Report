package com.opinion.app;

import com.opinion.mongodb.service.UserFingerprintService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;

/**
 * @author zhangtong
 * Created by on 2017/12/20
 */
@Component
public class ApplicationStartup implements ApplicationRunner {

    @Autowired
    private UserFingerprintService userFingerprintService;

    @Override
    public void run(ApplicationArguments applicationArguments) throws Exception {
        userFingerprintService.saveDefault();
    }
}
