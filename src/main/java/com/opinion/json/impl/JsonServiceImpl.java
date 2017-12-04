package com.opinion.json.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.opinion.json.JsonService;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.util.ResourceUtils;

import java.io.*;

/**
 * @author zhangtong
 * Created by on 2017/12/4
 */
@Service
public class JsonServiceImpl implements JsonService {

    @Override
    public JSONObject getCityCodeJSON() {
        System.out.println("执行缓存");
        JSONObject result = new JSONObject();
        try {
            File file = ResourceUtils.getFile("classpath:cityinfo.json");
            BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(file)));
            StringBuffer message = new StringBuffer();
            String line = null;
            while ((line = br.readLine()) != null) {
                message.append(line);
            }
            String defaultString = message.toString();
            String defaultMenu;
            defaultMenu = defaultString.replace("\r\n", "").replaceAll(" +", "");
            result = JSON.parseObject(defaultMenu);
        } catch(FileNotFoundException e) {
            e.printStackTrace();
        } catch(IOException e) {
            e.printStackTrace();
        }
        return result;
    }
}
