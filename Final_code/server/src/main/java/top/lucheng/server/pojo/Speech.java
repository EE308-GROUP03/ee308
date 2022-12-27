package top.lucheng.server.pojo;

import lombok.Data;

@Data
public class Speech {
    /**
     * 语音base64编码
     */
    String speech;
    /**
     * 语音base64长度
     */
    Integer length;
}
