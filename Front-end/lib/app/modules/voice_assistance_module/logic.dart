import 'dart:convert';
import 'dart:io';

import 'package:app/app/data/provider/api_provider.dart';
import 'package:app/app/modules/voice_assistant_module/local_widgets/hint_dialog.dart';
import 'package:app/app/utils/action_enum.dart';
import 'package:audio_session/audio_session.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'state.dart';

class VoiceAssistantModuleLogic extends GetxController {
  final VoiceAssistantModuleState state = VoiceAssistantModuleState();

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(milliseconds: 500), () => Get.dialog(const VoiceAssistantHintWidget()));
  }

  @override
  void onClose() {
    super.onClose();
    state.mRecorder!.closeRecorder();
  }

  // 语言选择改变
  void languageChooseChange() {
    state.languageChoose = !state.languageChoose;
    update(["language"]);
  }

  //语言选择
  void languageChange(String newLanguage) {
    state.language = newLanguage;
    state.languageChoose = !state.languageChoose;
    update(["language"]);
  }

  Future<void> openTheRecorder() async {
    //获取麦克风权限
    var status = await Permission.microphone.request();
    // 判断是否获得权限
    if (status != PermissionStatus.granted) {
      throw RecordingPermissionException('Microphone permission not granted');
    }
    await state.mRecorder!.openRecorder();

    // 配置
    final session = await AudioSession.instance;
    await session.configure(
      AudioSessionConfiguration(
        avAudioSessionCategory: AVAudioSessionCategory.record,
        avAudioSessionCategoryOptions:
            AVAudioSessionCategoryOptions.allowBluetooth | AVAudioSessionCategoryOptions.defaultToSpeaker,
        avAudioSessionMode: AVAudioSessionMode.spokenAudio,
        avAudioSessionRouteSharingPolicy: AVAudioSessionRouteSharingPolicy.defaultPolicy,
        avAudioSessionSetActiveOptions: AVAudioSessionSetActiveOptions.none,
        androidAudioAttributes: const AndroidAudioAttributes(
          contentType: AndroidAudioContentType.speech,
          flags: AndroidAudioFlags.none,
          usage: AndroidAudioUsage.voiceCommunication,
        ),
        androidAudioFocusGainType: AndroidAudioFocusGainType.gain,
        androidWillPauseWhenDucked: true,
      ),
    );
  }

  // ----------------------  Here is the code for state.recording and playback -------

  void record() async {
    if (!state.isOpen) {
      state.mRecorder = FlutterSoundRecorder();
      state.tempDir = await getTemporaryDirectory();
      state.mPath = '${state.tempDir.path}/myFile.pcm';

      state.isOpen = true;
      await openTheRecorder();
    }

    state.mRecorder!.startRecorder(toFile: state.mPath, codec: state.codec, audioSource: state.theSource).then((value) {
      state.recording = true;
      update();
    });
  }

  void stopRecorder() async {
    await state.mRecorder!.stopRecorder().then((value) {
      state.recording = false;
      update();
    }).then((value) {
      soundToBase64();
    });
  }

  // 将语音转换为base64编码并上传百度语音平台识别,将结果分析后跳转
  Future soundToBase64() async {
    List<int> soundBytes = await File(state.mPath).readAsBytes();
    String base64String = base64Encode(soundBytes);
    Response resp = await ApiProvider.getASRResult(base64String, soundBytes.length);
    print(resp.body.toString());
  }

  void jumpTo(String data) {
    if (data.contains("付款") || data.contains("钱") || data.contains("支付宝")) {
      ActionEnum.toAlipay();
    } else if (data.contains("地图") || data.contains("哪") || data.contains("位置")) {
      ActionEnum.toBaiduMap();
    } else if (data.contains("报警")||data.contains("救命")) {
      ActionEnum.toPolice();
    } else if (data.contains("回家") || data.contains("公交")) {
      ActionEnum.toTakeBus();
    }
  }
}
