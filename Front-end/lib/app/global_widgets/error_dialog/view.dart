import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class ErrorDialogComponent extends AwesomeDialog {
  ErrorDialogComponent({
    required BuildContext context,
    required String title,
    Function()? btnOkOnPress,
  }) : super(
    context: context,
    dialogType: DialogType.ERROR,
    animType: AnimType.RIGHSLIDE,
    title: title,
    btnOkOnPress: btnOkOnPress,
    btnOkIcon: Icons.cancel,
    btnOkColor: Colors.red,
    btnOkText: "确定",
    autoHide: const Duration(seconds: 4),
  );
}

