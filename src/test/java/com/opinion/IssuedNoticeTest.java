package com.opinion;

import com.opinion.base.BaseTest;
import com.opinion.constants.SysConst;
import com.opinion.mysql.entity.IssuedNotice;
import com.opinion.mysql.service.IssuedNoticeService;
import com.opinion.utils.TestUtils;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Arrays;
import java.util.List;
import java.util.stream.IntStream;

/**
 * @author zhangtong
 * Created by on 2017/11/29
 */
public class IssuedNoticeTest extends BaseTest {

    @Autowired
    private IssuedNoticeService issuedNoticeService;

    @Test
    public void saveIssuedNotice() {

        List<String> NoticeType = Arrays.asList(
                SysConst.NoticeType.IMPORTANTNOTICE.getCode(),
                SysConst.NoticeType.WORKARRANGEMENT.getCode(),
                SysConst.NoticeType.WORKSUGGESTION.getCode(),
                SysConst.NoticeType.OTHER.getCode()
        );
        List<String> NoticeRange = Arrays.asList(
                SysConst.NoticeRange.ALL.getCode(),
                SysConst.NoticeRange.MUNICIPAL.getCode(),
                SysConst.NoticeRange.COUNTY.getCode()
        );

        IntStream.rangeClosed(1, 50).forEach(i -> {
            IssuedNotice issuedNotice = new IssuedNotice();
            issuedNotice.setTitle("这是我我的通知标题，大家注意看啊");
            issuedNotice.setNoticeType(TestUtils.randomGetString(NoticeType));
            issuedNotice.setNoticeRange(TestUtils.randomGetString(NoticeRange));
            issuedNotice.setNoticeContent("我通知的内容啊");
            issuedNoticeService.save(issuedNotice);
        });
    }
}
