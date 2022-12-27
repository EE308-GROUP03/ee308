package top.lucheng.server.service;


import top.lucheng.server.pojo.Speech;

import java.util.List;

public interface ASRService {
    public List<String> getASRResult(Speech speech);
}
