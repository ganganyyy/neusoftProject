package basic;

public class LogicException extends RuntimeException{

    /**
     *
     * @param message �쳣����Ϣ�������Զ����
     */
    public LogicException(String message) {
        super(message);
    }

    /**
     *
     * @param message �쳣����Ϣ
     * @param cause   �쳣�ĸ���ԭ��
     */
    public LogicException(String message, Throwable cause) {
        super(message, cause);
    }
}
