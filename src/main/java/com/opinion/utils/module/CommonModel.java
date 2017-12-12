package com.opinion.utils.module;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * @author zhangtong
 * Created by on 2017/12/12
 */
@Component
public class CommonModel {

    @Value("${download.template.report.path}")
    private String reportTemplatePath;

    @Value("${download.template.report.file}")
    private String reportTemplateFile;

    public String getReportTemplatePath() {
        return reportTemplatePath;
    }

    public void setReportTemplatePath(String reportTemplatePath) {
        this.reportTemplatePath = reportTemplatePath;
    }

    public String getReportTemplateFile() {
        return reportTemplateFile;
    }

    public void setReportTemplateFile(String reportTemplateFile) {
        this.reportTemplateFile = reportTemplateFile;
    }
}
