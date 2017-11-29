package com.opinion.mysql.service;


import com.opinion.mysql.entity.ImageInfo;

/**
 * @author zhangtong
 * Created by on 2017/11/29
 */
public interface ImageInfoService {

    ImageInfo save(ImageInfo imageInfo);

    ImageInfo findById(Long id);
}
