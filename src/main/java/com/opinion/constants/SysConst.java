package com.opinion.constants;

import com.opinion.mysql.entity.SysUser;
import org.apache.shiro.SecurityUtils;

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
    public static final SysUser SYS_USER = (SysUser) SecurityUtils.getSubject().getPrincipal();

//    public static final String USER_ACCOUNT = "admin";

    public static final Long USER_ID = 1L;

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

    public enum ReportType {

        RED("red", "红色"),
        ORANGE("orange", "橙色"),
        YELLOW("yellow", "黄色");

        private String code;
        private String name;

        ReportType(String code, String name) {
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
