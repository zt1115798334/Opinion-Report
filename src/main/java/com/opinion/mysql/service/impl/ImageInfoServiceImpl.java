package com.opinion.mysql.service.impl;

import com.opinion.mysql.entity.ImageInfo;
import com.opinion.mysql.repository.ImageInfoRepository;
import com.opinion.mysql.service.ImageInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author zhangtong
 * Created by on 2017/11/29
 */
@Service
public class ImageInfoServiceImpl implements ImageInfoService {

    @Autowired
    private ImageInfoRepository imageInfoRepository;

    @Override
    public ImageInfo save(ImageInfo imageInfo) {
        return imageInfoRepository.save(imageInfo);
    }

    @Override
    public ImageInfo findById(Long id) {
        return imageInfoRepository.findOne(id);
    }
}
