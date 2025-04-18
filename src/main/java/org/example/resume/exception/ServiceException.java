package org.example.resume.exception;


import org.example.resume.util.ResultEnum;

public class ServiceException extends RuntimeException {
    private ResultEnum errorEnum;
    
    public ServiceException(ResultEnum errorEnum) {
        super(errorEnum.getMessage());
        this.errorEnum = errorEnum;
    }
    
    public ResultEnum getErrorEnum() {
        return errorEnum;
    }
}