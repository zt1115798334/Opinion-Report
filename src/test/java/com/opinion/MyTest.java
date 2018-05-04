package com.opinion;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Lists;
import org.junit.Test;

import java.util.Date;
import java.util.List;

/**
 * @author zhangtong
 * Created by on 2018/4/2
 */
public class MyTest {


    @Test
    public void test(){
        List<TestYY> testYYS = Lists.newArrayList();
        TestYY yy1 = new TestYY();
        yy1.setXiao("xxxx");
        TestYY yy2 = new TestYY();
        yy1.setXiao("xxxx");
        testYYS.add(yy1);
        testYYS.add(yy2);

        JSONArray jsonObject = JSONArray.parseArray(JSONObject.toJSONString(testYYS));
    }
}

class TestYY{
    private String xiao ;
    private Date data;

    public String getXiao() {
        return xiao;
    }

    public void setXiao(String xiao) {
        this.xiao = xiao;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }
}
