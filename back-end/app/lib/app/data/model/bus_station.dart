import 'bus_line.dart';

class BusStationModel {
  late String name;
  late String cityName;
  late double xydistance;
  late List<BusLineModel> busLineList;
  fromJson(dynamic json){
    List jsonList = json["busLineList"];
    List<BusLineModel> list = [];

    name = json["name"];
    for (dynamic e in jsonList) {
      list.add(BusLineModel().fromJson(e, name));
    }
    busLineList = list;
    cityName = json["cityName"];
    xydistance = json["xydistance"];
    return this;
  }
}
