package org.example.resume.util;

import lombok.Getter;


@Getter
public enum ResultEnum {
    // 通用异常
    SUCCESS("200", "操作成功"),
    ERROR("500", "操作失败"),
    PARAM_ERROR("400", "参数错误"),
    UNAUTHORIZED("401", "未授权访问"),
    FORBIDDEN("403", "禁止访问"),
    NOT_FOUND("4004", "资源不存在"),


    // 业务异常 (可根据实际业务扩展)
    USER_NOT_EXIST("1001", "用户不存在"),
    USER_DISABLED("1002", "用户已被禁用"),
    USERNAME_NOT_NULL("1003", "用户名不能为空"),
    PASSWORD_NOT_NULL("1004", "密码不能为空"),
    PASSWORD_MISMATCH("1005", "两次输入的密码不一致"),
    USER_ALREADY_EXISTS("1006", "用户已存在"),
    PASSWORD_ERROR("1005", "密码错误"),
    PRODUCT_STOCK_LOW("2001", "商品库存不足"),
    ORDER_CREATE_FAIL("3001", "保存失败"),
    PAYMENT_TIMEOUT("4001", "支付超时"),
    INVALID_TOKEN("5001", "未提供有效令牌"),
    EXPIRED_TOKEN("5002", "令牌已过期");


    private final String code;

    private final String message;

    ResultEnum(String code, String message) {
        this.code = code;
        this.message = message;
    }

    public static ResultEnum getByCode(String code) {
        for (ResultEnum value : values()) {
            if (value.getCode().equals(code)) {
                return value;
            }
        }
        return null;
    }
}