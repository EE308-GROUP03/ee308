package top.lucheng.server.service;



import top.lucheng.server.pojo.BusStation;

import java.util.List;
import java.util.Map;

public interface LocationService {
    List<BusStation> getNearbyBus(Double longitude, Double latitude);
    public void initCityIdMap() ;

    public Map<String,String> getBusLine(String cityId,String busLineName);
    public Map<String,String> getRealTimeBusInfo(String cityid,String bus_linestrid,String bus_linenum,String bus_staname);
}
