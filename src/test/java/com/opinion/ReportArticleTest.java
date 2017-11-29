package com.opinion;

import com.opinion.base.BaseTest;
import com.opinion.constants.SysConst;
import com.opinion.mysql.entity.ReportArticle;
import com.opinion.mysql.service.ReportArticleService;
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
public class ReportArticleTest extends BaseTest {

    @Autowired
    private ReportArticleService reportArticleService;

    @Test
    public void saveReportArticle() {
        List<String> ReplyType = Arrays.asList(
                SysConst.ReplyType.CLICK.getCode(),
                SysConst.ReplyType.COMMENT.getCode(),
                SysConst.ReplyType.ESTIMATE.getCode()
        );
        List<String> SourceType = Arrays.asList(
                SysConst.SourceType.NETWORK.getCode(),
                SysConst.SourceType.MEDIA.getCode(),
                SysConst.SourceType.SCENE.getCode(),
                SysConst.SourceType.OTHER.getCode()
        );
        List<String> ReportLevel = Arrays.asList(
                SysConst.ReportLevel.RED.getCode(),
                SysConst.ReportLevel.ORANGE.getCode(),
                SysConst.ReportLevel.YELLOW.getCode()
        );

        List<String> AdoptState = Arrays.asList(
                SysConst.AdoptState.ADOPT.getCode(),
                SysConst.AdoptState.NOTADOPTED.getCode(),
                SysConst.AdoptState.REPORT.getCode()
        );

        IntStream.rangeClosed(1, 50).forEach(i -> {
            ReportArticle reportArticle = new ReportArticle();
            reportArticle.setTitle("携程亲子园事件最新进展：更多虐童视");
            reportArticle.setSourceType(TestUtils.randomGetString(SourceType));
            reportArticle.setReportLevel(TestUtils.randomGetString(ReportLevel));
            reportArticle.setReplyType(TestUtils.randomGetString(ReplyType));
            reportArticle.setAdoptState(TestUtils.randomGetString(AdoptState));
            reportArticle.setReplyNumber(TestUtils.randomGetInt());
            reportArticle.setReportCause("上报原因我不知道说些什么");
            reportArticleService.save(reportArticle);
        });
    }
}
