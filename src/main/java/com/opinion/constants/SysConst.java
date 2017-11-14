package com.opinion.constants;

/**
 * 系统常量类
 *
 * @author zhangtong
 * Created by on 2017/11/13
 */
public class SysConst {
    /**
     * 系统的默认用户账号
     */
    public static final String DEFAULT_USER_ACCOUNT = "admin";

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

    public enum AdoptState {

        ADOPT("adopt", "采纳"),
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
}
