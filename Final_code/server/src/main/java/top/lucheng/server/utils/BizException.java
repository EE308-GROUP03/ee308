package top.lucheng.server.utils;
import lombok.Data;
@Data
public class BizException extends RuntimeException {

    private static final long serialVersionUID = -7864604160297181941L;

    /** 错误码 */
    protected final BizErrorCodeEnum errorCode;


    public BizException() {
        super(BizErrorCodeEnum.UNSPECIFIED.getDescription());
        this.errorCode = BizErrorCodeEnum.UNSPECIFIED;
    }

    public BizException(final BizErrorCodeEnum errorCode) {
        super(errorCode.getDescription());
        this.errorCode = errorCode;
    }

    public BizException(final String detailedMessage) {
        super(detailedMessage);
        this.errorCode = BizErrorCodeEnum.UNSPECIFIED;
    }

    public BizException(final BizErrorCodeEnum errorCode, final String detailedMessage) {
        super(detailedMessage);
        this.errorCode = errorCode;
    }

    public BizErrorCodeEnum getErrorCode() {
        return errorCode;
    }

}