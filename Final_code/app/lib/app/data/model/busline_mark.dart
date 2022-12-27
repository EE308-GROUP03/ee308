class BuslineMarkModel {
  late int uid;
  late String cityid;
  late String busLinestrid;
  late String busLinenum;
  late String busStaname;

  BuslineMarkModel(
      {required this.uid,
      required this.cityid,
      required this.busLinestrid,
      required this.busLinenum,
      required this.busStaname});

  fromJson(dynamic data) {

    uid = data["uid"];
    cityid = data["cityid"];
    busLinestrid = data["busLinestrid"];
    busLinenum = data["busLinenum"];
    busStaname = data["busStaname"];
    return this;
  }

  static BuslineMarkModel fromJson2(dynamic data){
    return BuslineMarkModel(uid: data["uid"],cityid:data["cityid"],busLinestrid:data["busLinestrid"],busLinenum: data["busLinenum"],busStaname:  data["busStaname"] );
  }
}
