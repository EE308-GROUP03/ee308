import 'package:app/app/data/model/user.dart';

class FriendModel extends UserModel {
  String? mark;

  @override
  fromJson(dynamic json) {
    super.fromJson(json);
    mark = json["mark"];
    return this;
  }
}
