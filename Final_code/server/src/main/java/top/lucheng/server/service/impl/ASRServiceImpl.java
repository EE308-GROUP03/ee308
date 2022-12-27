package top.lucheng.server.service.impl;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import com.alibaba.fastjson2.JSONReader;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import top.lucheng.server.pojo.Speech;
import top.lucheng.server.service.ASRService;
import top.lucheng.server.utils.HttpClientUtil;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Service
public class ASRServiceImpl implements ASRService {
    @Autowired
    String baiduAsrToken;

    @Override
    public List<String> getASRResult(Speech speech) {
        Map<String, Object> param = new HashMap<String, Object>() {{
            put("format", "pcm");
            put("rate", 16000);
            put("channel", 1);
            put("cuid", "lakdfj;alsdjf");
            put("token", baiduAsrToken);
            put("speech", speech.getSpeech());
            put("len", speech.getLength());
        }};

        String resp = HttpClientUtil.doPostJson("http://vop.baidu.com/server_api", JSON.toJSONString(param));
        Assert.notNull(resp, "识别失败");
        JSONObject respObj = JSONObject.parseObject(resp);
        Assert.isTrue(Integer.valueOf(0).equals(respObj.get("err_no")), "识别失败");
        Assert.notNull(respObj.get("result"), "识别失败");

        JSONArray resultList = (JSONArray) respObj.get("result");
        return Arrays.asList(resultList.toArray(String.class));
    }
}
