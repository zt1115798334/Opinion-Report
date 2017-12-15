package com.opinion.mongodb.entity;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

/**
 * @author zhangtong
 * Created by on 2017/12/15
 */
@Document(collection = "user_fingerprint")
public class UserFingerprint {

    @Id
    @Indexed(unique = true)
    private String id;

    /**
     * 用户id
     */
    @Field("user_id")
    private Long userId;

    @Field("fingerprint")
    private String fingerprint;

    public UserFingerprint() {
    }

    public UserFingerprint(Long userId, String fingerprint) {
        this.userId = userId;
        this.fingerprint = fingerprint;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getFingerprint() {
        return fingerprint;
    }

    public void setFingerprint(String fingerprint) {
        this.fingerprint = fingerprint;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
}
