package top.lucheng.server.controller;

import com.alibaba.druid.wall.violation.ErrorCode;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import top.lucheng.server.utils.BizErrorCodeEnum;
import top.lucheng.server.utils.BizException;
import top.lucheng.server.utils.R;

@Slf4j
@RestControllerAdvice
public class BizExceptionController {
    @ExceptionHandler
    public R bizHandler(BizException e) {
        BizErrorCodeEnum errorCode = e.getErrorCode();
        return R.error(errorCode.getCode(), errorCode.getDescription());
    }

    @ExceptionHandler
    public R IllegalArgumentExceptionHandler(IllegalArgumentException e) {
        log.error(e.toString());
        log.error(e.getMessage());
        return R.error(400, e.getMessage());
    }
}
