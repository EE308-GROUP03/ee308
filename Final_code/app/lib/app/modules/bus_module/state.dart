import 'package:app/app/data/model/bus_station.dart';
import 'package:geolocator/geolocator.dart';

class BusModuleState {
  Position? position;
  late bool loading;
  late bool loadingSuccess;
 late List<BusStationModel> busStationList;
  BusModuleState() {
    ///Initialize variables
    loading = true;
    loadingSuccess = true;
    busStationList= [];
  }
}
