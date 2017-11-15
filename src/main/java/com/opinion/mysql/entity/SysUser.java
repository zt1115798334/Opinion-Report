package com.opinion.mysql.entity;

import com.opinion.mysql.converter.LocalDateTimeAttributeConverter;
import org.apache.commons.lang3.builder.ToStringBuilder;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * @author zhangtong
 * Created by on 2017/11/13
 */
@Entity
@Table(name = "t_sys_user")
public class SysUser implements Serializable {
    private static final long serialVersionUID = 9201034849892179276L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    private Long id;

    /**
     * 用户账户
     */
    @Column(name = "user_account", nullable = false)
    private String userAccount;

    /**
     * 用户名称
     */
    @Column(name = "user_name", nullable = false)
    private String userName;

    /**
     * 手机号
     */
    @Column(name = "phone", nullable = false)
    private String phone;

    /**
     * 用户密码
     */
    @Column(name = "user_password", nullable = false)
    private String userPassword;

    /**
     * 最后登录时间
     */
    @Column(name = "last_login_time", nullable = false)
    @Convert(converter = LocalDateTimeAttributeConverter.class)
    private LocalDateTime lastLoginTime;

    /**
     * effective:有效，invalid:无效
     */
    @Column(name = "status", nullable = false)
    private String status;

    /**
     * 创建时间
     */
    @Column(name = "created_date", nullable = false)
    @Convert(converter = LocalDateTimeAttributeConverter.class)
    private LocalDateTime createdDate;

    /**
     * 创建人
     */
    @Column(name = "created_user", nullable = false)
    private String createdUser;

    /**
     * 修改时间
     */
    @Column(name = "modified_date", nullable = false)
    @Convert(converter = LocalDateTimeAttributeConverter.class)
    private LocalDateTime modifiedDate;

    /**
     * 修改人
     */
    @Column(name = "modified_user", nullable = false)
    private String modifiedUser;

    public SysUser() {
    }

    public SysUser(SysUser user) {
        this.userAccount = user.getUserAccount();
        this.userName = user.getUserName();
        this.phone = user.getPhone();
        this.userPassword = user.getUserPassword();
        this.lastLoginTime = user.getLastLoginTime();
        this.status = user.getStatus();
        this.createdDate = user.getCreatedDate();
        this.createdUser = user.getCreatedUser();
        this.modifiedDate = user.getModifiedDate();
        this.modifiedUser = user.getModifiedUser();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserAccount() {
        return userAccount;
    }

    public void setUserAccount(String userAccount) {
        this.userAccount = userAccount;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public LocalDateTime getLastLoginTime() {
        return lastLoginTime;
    }

    public void setLastLoginTime(LocalDateTime lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public LocalDateTime getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(LocalDateTime createdDate) {
        this.createdDate = createdDate;
    }

    public String getCreatedUser() {
        return createdUser;
    }

    public void setCreatedUser(String createdUser) {
        this.createdUser = createdUser;
    }

    public LocalDateTime getModifiedDate() {
        return modifiedDate;
    }

    public void setModifiedDate(LocalDateTime modifiedDate) {
        this.modifiedDate = modifiedDate;
    }

    public String getModifiedUser() {
        return modifiedUser;
    }

    public void setModifiedUser(String modifiedUser) {
        this.modifiedUser = modifiedUser;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
