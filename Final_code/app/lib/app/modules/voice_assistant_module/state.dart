import 'dart:io';

import 'package:audio_session/audio_session.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter_sound_platform_interface/flutter_sound_recorder_platform_interface.dart';

class VoiceAssistantModuleState {
  final theSource = AudioSource.microphone;
  final Codec codec = Codec.pcm16;
  late bool languageChoose;

  late bool recording;
  late String language;
  late List<String> languageList;
  late int activeLanguageIndex;
  late Directory tempDir;
  late String mPath;
  FlutterSoundRecorder? mRecorder;
  late bool isOpen;

  VoiceAssistantModuleState() {
    ///Initialize variables
    languageChoose = false;
    isOpen = false;
    recording = false;
    language = "普通话";
    languageList = ["普通话","四川话","广东话"];
    activeLanguageIndex= 0;
  }
}
