package com.opinion.mysql.service.impl;

import com.opinion.mysql.repository.CityRepository;
import com.opinion.mysql.service.CityService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author zhangtong
 * Created by on 2017/11/15
 */
public class CityServiceImpl implements CityService {

    @Autowired
    private CityRepository cityRepository;
}
