class UserModel {
  late int id;
  String? nickname;
  String? avatar;
  int? level;
  int? status;

  fromJson(dynamic json) {
    id = json["id"];
    nickname = json["nickname"];
    avatar = json["avatar"];
    level = json["level"];
    status = json["status"];
    return this;
  }
}
