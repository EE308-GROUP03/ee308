import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPhoneInputField extends StatelessWidget {
  // "请 输 入 手 机 号", Icons.person, _loginController.phoneNumber
  String? placeHolder;
  IconData iconData;
  TextEditingController controller;

  LoginPhoneInputField(
      {Key? key,
      required this.placeHolder,
      required this.iconData,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 83.h,
      width: 1.sw - 60.w,
      child: Center(
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(iconData),
              // hintText: "请 输 入 短 信 验 证 码",
              hintText: placeHolder,
              hintStyle: const TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey.withOpacity(0.3),
      ),
    );
  }
}
