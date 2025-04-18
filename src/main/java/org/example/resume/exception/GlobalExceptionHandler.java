package org.example.resume.exception;

import lombok.extern.slf4j.Slf4j;
import org.example.resume.util.Result;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@Slf4j
@RestControllerAdvice
public class GlobalExceptionHandler {
    /*
     * 处理业务异常
     */
    @ExceptionHandler(ServiceException.class)
    public Result<?> handleBusinessException(ServiceException e) {
        log.error("业务异常: {}", e.getMessage(), e);
        return Result.error(e.getErrorEnum());
    }

    /*
     * 处理系统异常
     */
    @ExceptionHandler(Exception.class)
    public Result<?> handleException(Exception e) {
        log.error("系统异常: {}", e.getMessage(), e);
        return Result.error();
    }
}