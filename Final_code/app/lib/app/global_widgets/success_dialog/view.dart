import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class SuccessDialogComponent extends AwesomeDialog {
  SuccessDialogComponent({
    required BuildContext context,
    required String title,
    Function()? btnOkOnPress,
  }) :
        super(
          context: context,
          dialogType: DialogType.SUCCES,
          animType: AnimType.LEFTSLIDE,
          headerAnimationLoop: false,
          title: title,
          btnOkOnPress: btnOkOnPress,
          btnOkIcon: Icons.check_circle,
          autoHide: const Duration(seconds: 2));
}

