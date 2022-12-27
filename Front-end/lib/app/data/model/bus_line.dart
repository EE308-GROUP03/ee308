class BusLineModel {
  late String name;
  late List<String> stations;
  int? distance;
  int? dis_stat;
  late String cityid;
  late String bus_linestrid;
  late String bus_linenum;
  late String bus_staname;
  late int station_index;

  fromJson(dynamic json, String stationName) {
    name = json["name"];
    distance = json["distance"];

    stations = List<String>.from(json["stations"]);
    station_index = stations.lastIndexOf(stationName);
    cityid = json["cityid"];
    bus_linestrid = json["bus_linestrid"];
    bus_linenum = json["bus_linenum"];
    bus_staname = json["bus_staname"];
    dis_stat = json["dis_stat"];
    return this;
  }
}
