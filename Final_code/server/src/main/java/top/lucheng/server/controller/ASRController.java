package top.lucheng.server.controller;


import io.swagger.annotations.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import top.lucheng.server.pojo.Speech;
import top.lucheng.server.service.ASRService;
import top.lucheng.server.utils.R;


@Api(tags = "语音识别")
@RestController
@RequestMapping("/ASR")
public class ASRController {
    @Autowired
    ASRService asrService;


    @ApiOperation(value = "获取语音识别结果")
    @ApiImplicitParams(@ApiImplicitParam(value = "speech",
            name = "语音文本的base64编码,及长度",
            dataType = "Speech",
            dataTypeClass = Speech.class,
            paramType = "body"))
    @PostMapping("/result")
    R gerASRResult(@RequestBody Speech speech) {

        return R.ok("识别成功").put("result",asrService.getASRResult(speech));
    }
}
