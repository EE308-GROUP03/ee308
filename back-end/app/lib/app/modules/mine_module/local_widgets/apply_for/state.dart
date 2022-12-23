import 'package:app/app/data/model/user.dart';
import 'package:flutter/material.dart';

class ApplyForState {
  late TextEditingController phone;
  late TextEditingController mark;

  late bool find;
  late UserModel userModel;

  ApplyForState() {
    ///Initialize variables
    phone = TextEditingController();
    mark = TextEditingController();
    find = false;
    userModel = UserModel();
  }
}
