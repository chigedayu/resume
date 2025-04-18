package org.example.resume.util;

import lombok.Data;

import java.io.Serializable;

@Data
public class Result<T> implements Serializable {
    private static final long serialVersionUID = 1L;
    
    // 状态码
    private String code;
    
    // 提示信息
    private String message;
    
    // 返回数据
    private T data;
    
    // 时间戳
    private Long timestamp = System.currentTimeMillis();

    /*
     * 成功静态方法（无数据）
     */
    public static <T> Result<T> success() {
        Result<T> result = new Result<>();
        result.setCode(ResultEnum.SUCCESS.getCode());
        result.setMessage(ResultEnum.SUCCESS.getMessage());
        return result;
    }

    /*
     * 成功静态方法（带数据）
     */
    public static <T> Result<T> success(T data) {
        Result<T> result = success();
        result.setData(data);
        return result;
    }

    /*
     * 失败静态方法（默认错误码）
     */
    public static <T> Result<T> error() {
        Result<T> result = new Result<>();
        result.setCode(ResultEnum.ERROR.getCode());
        result.setMessage(ResultEnum.ERROR.getMessage());
        return result;
    }

    /*
     * 失败静态方法（自定义错误信息）
     */
    public static <T> Result<T> error(String message) {
        Result<T> result = error();
        result.setMessage(message);
        return result;
    }

    /*
     * 失败静态方法（自定义错误码和信息）
     */
    public static <T> Result<T> error(String code, String message) {
        Result<T> result = new Result<>();
        result.setCode(code);
        result.setMessage(message);
        return result;
    }

    /*
     * 失败静态方法（使用预定义枚举）
     */
    public static <T> Result<T> error(ResultEnum resultEnum) {
        return error(resultEnum.getCode(), resultEnum.getMessage());
    }
}