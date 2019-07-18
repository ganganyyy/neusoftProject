package basic;

public class LogicException extends RuntimeException{

    /**
     *
     * @param message 异常的信息，可以自定义的
     */
    public LogicException(String message) {
        super(message);
    }

    /**
     *
     * @param message 异常的信息
     * @param cause   异常的根本原因
     */
    public LogicException(String message, Throwable cause) {
        super(message, cause);
    }
}
