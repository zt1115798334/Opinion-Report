package com.opinion.constants;

import org.apache.commons.lang3.StringUtils;

/**
 * 系统常量类
 *
 * @author zhangtong
 * Created by on 2017/11/13
 */
public class SysConst {
    public enum LoginStatus {

        EFFECTIVE("effective", "有效"),
        INVALID("invalid", "无效");

        private String code;
        private String name;

        LoginStatus(String code, String name) {
            this.code = code;
            this.name = name;
        }

        public String getCode() {
            return code;
        }

        public String getName() {
            return name;
        }
    }

    public enum ReportSource {

        ARTIFICIAL("artificial", "人工上报"),
        MACHINE("machine", "机器上报");

        private String code;
        private String name;

        ReportSource(String code, String name) {
            this.code = code;
            this.name = name;
        }

        public String getCode() {
            return code;
        }

        public String getName() {
            return name;
        }
    }

    public enum SourceType {

        NETWORK("network", "网络"),
        MEDIA("media", "媒体"),
        SCENE("scene", "现场"),
        OTHER("other", "其他");

        private String code;
        private String name;

        SourceType(String code, String name) {
            this.code = code;
            this.name = name;
        }

        public String getCode() {
            return code;
        }

        public String getName() {
            return name;
        }
    }

    public static SourceType getSourceTypeByCode(String code) {
        for (SourceType sourceType : SourceType.values()) {
            if (StringUtils.equals(code, sourceType.getCode())) {
                return sourceType;
            }
        }
        return null;
    }

    public enum AdoptState {

        ADOPT("adopt", "已采纳"),
        NOTADOPTED("notAdopted", "未采纳"),
        REPORT("report", "已上报");

        private String code;
        private String name;

        AdoptState(String code, String name) {
            this.code = code;
            this.name = name;
        }

        public String getCode() {
            return code;
        }

        public String getName() {
            return name;
        }
    }

    public enum ReportLevel {

        RED("red", "红色"),
        ORANGE("orange", "橙色"),
        YELLOW("yellow", "黄色");

        private String code;
        private String name;

        ReportLevel(String code, String name) {
            this.code = code;
            this.name = name;
        }

        public String getCode() {
            return code;
        }

        public String getName() {
            return name;
        }
    }

    public static ReportLevel getReportLevelByCode(String code) {
        for (ReportLevel reportLevel : ReportLevel.values()) {
            if (StringUtils.equals(code, reportLevel.getCode())) {
                return reportLevel;
            }
        }
        return null;
    }

    public enum NoticeRange {

        ALL("all", "全部"),
        MUNICIPAL("municipal ", "市级"),
        COUNTY("county", "县级");

        private String code;
        private String name;

        NoticeRange(String code, String name) {
            this.code = code;
            this.name = name;
        }

        public String getCode() {
            return code;
        }

        public String getName() {
            return name;
        }
    }

    public enum ReceiptState {

        UNRECEIPT("unreceipt", "未回执"),
        RECEIPT("receipt ", "以回执"),
        RECEIPTING("receipting ", "回执中"),
        UNREAD("unread ", "未读"),
        READ("read", "已读");

        private String code;
        private String name;

        ReceiptState(String code, String name) {
            this.code = code;
            this.name = name;
        }

        public String getCode() {
            return code;
        }

        public String getName() {
            return name;
        }
    }

    public enum CityLevel {

        SYSTEM("0", "最高等级"),
        PROVINCE("1 ", "省级"),
        MUNICIPAL("2 ", "市级"),
        COUNTY("3 ", "县级");

        private String code;
        private String name;

        CityLevel(String code, String name) {
            this.code = code;
            this.name = name;
        }

        public String getCode() {
            return code;
        }

        public String getName() {
            return name;
        }
    }


}
