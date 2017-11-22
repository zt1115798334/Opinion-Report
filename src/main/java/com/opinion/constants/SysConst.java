package com.opinion.constants;

import org.apache.commons.lang3.StringUtils;

/**
 * 系统常量类
 *
 * @author zhangtong
 * Created by on 2017/11/13
 */
public class SysConst {

    public final static String OPINION_REPORT_INFO_URL = "/reportArticle/opinionReportExaminePage?reportCode=";
    public final static String ISSUED_NOTICE_INFO_URL = "/issuedNotice/issuedNoticeInfoPage?noticeCode=";

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

    public enum RoleType {

        ADMIN("admin", "000"),
        OPERATION("operation", "001");

        private String code;
        private String name;

        RoleType(String code, String name) {
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

    public enum ReplyType {

        CLICK("click", "点击"),
        COMMENT("comment", "评论"),
        ESTIMATE("estimate", "预估值");

        private String code;
        private String name;

        ReplyType(String code, String name) {
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

    public static ReplyType getReplyTypeByCode(String code) {
        for (ReplyType replyType : ReplyType.values()) {
            if (StringUtils.equals(code, replyType.getCode())) {
                return replyType;
            }
        }
        return null;
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

    public static AdoptState getAdoptStateByCode(String code) {
        for (AdoptState adoptState : AdoptState.values()) {
            if (StringUtils.equals(code, adoptState.getCode())) {
                return adoptState;
            }
        }
        return null;
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

    public enum NoticeType {

        IMPORTANTNOTICE("importantNotice", "重要通知"),
        WORKARRANGEMENT("workArrangement ", "工作安排"),
        WORKSUGGESTION("workSuggestion", "工作建议"),
        OTHER("other", "其他");

        private String code;
        private String name;

        NoticeType(String code, String name) {
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

    public static NoticeType getNoticeTypeByCode(String code) {
        for (NoticeType noticeType : NoticeType.values()) {
            if (StringUtils.equals(code, noticeType.getCode())) {
                return noticeType;
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

    public static ReceiptState getReceiptStateByCode(String code) {
        for (ReceiptState receiptState : ReceiptState.values()) {
            if (StringUtils.equals(code, receiptState.getCode())) {
                return receiptState;
            }
        }
        return null;
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

    public enum PermissionType {

        DISPLAY("display", "显示权限"),
        OPERATION("operation ", "操作权限");

        private String code;
        private String name;

        PermissionType(String code, String name) {
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

    public enum MessageState {

        UNREAD("unread ", "未读"),
        READ("read", "已读");

        private String code;
        private String name;

        MessageState(String code, String name) {
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
