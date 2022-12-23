package top.lucheng.server.service.impl;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import top.lucheng.server.config.BusApiConfig;
import top.lucheng.server.pojo.BusLine;
import top.lucheng.server.pojo.BusStation;
import top.lucheng.server.provider.BusApiProvider;
import top.lucheng.server.service.LocationService;
import top.lucheng.server.utils.*;

import java.util.*;

@Service
@Slf4j
public class LocationServiceImpl implements LocationService {
    @Autowired
    BusApiConfig busApiConfig;

    Map<String, String> cityIdMap = null;

    private static final String NO_ERROR = "0";

    @Override
    public List<BusStation> getNearbyBus(Double longitude, Double latitude) {
        //初始化城市列表
        initCityIdMap();
        //转换坐标经纬度为string
        String lat = latitude.toString();
        String lng = longitude.toString();
        //获取附近站点
        String resp = BusApiProvider.getNearByBusStation(lat, lng, busApiConfig.getUname(), busApiConfig.getSecret());
        //获取 键值对 对象
        JSONObject jsonObject = JSON.parseObject(resp);
        String errorCode = jsonObject.getString("error_code");

        if (!NO_ERROR.equals(errorCode)) {
            log.error("附近公交线路信息获取失败,错误代码:" + errorCode);
            throw new BizException(BizErrorCodeEnum.UNSPECIFIED);
        }
        String returnListJson = jsonObject.getString("returl_list");
        JSONArray returnList = JSON.parseArray(returnListJson);
        //取前三个Station并保存
        Iterator iterator = returnList.iterator();
        Integer count = 0;
        List<BusStation> result = new ArrayList<>();
        while (iterator.hasNext() && count < 3) {
            //新建station并赋值名字
            JSONObject busStationJsonObject = returnList.getJSONObject(count++);
            //将station中的前三条路线保存在busstation中
            JSONArray busLineListJsonArray = JSON.parseArray(busStationJsonObject.getString("buslist"));
            List<BusLine> busLines = new ArrayList<>();
            for (int i = 0; i < 3 && i < busLineListJsonArray.size(); i++) {

                //获取线路名称
                String busName = busLineListJsonArray.get(i).toString();
                String cityname = busStationJsonObject.getString("citys");
                String cityid = "92";
                //查看map里面是否有该city 没有则使用默认92(福州)
                for (String key : cityIdMap.keySet()) {
                    if (cityIdMap.get(key).equals(cityname)) {
                        cityid = key;
                    }
                }
                Assert.notNull(cityid, "未查询到城市id");
                Map<String, String> buslinemap = new HashMap<>();
                Map<String, String> rtbus = new HashMap<>();
                try {
                    buslinemap = getBusLine(cityid, busName);
                    rtbus = getRealTimeBusInfo(cityid, buslinemap.get("bus_linestrid"), buslinemap.get("bus_linenum"), buslinemap.get("bus_staname"));
                } catch (IllegalArgumentException e) {
                    continue;
                }
                BusLine busLine = new BusLine();
                busLine.setName(busName);
                busLine.setCityid(cityid);
                busLine.setBus_linestrid(buslinemap.get("bus_linestrid"));
                busLine.setBus_linenum(buslinemap.get("bus_linenum"));
                busLine.setBus_staname(buslinemap.get("bus_staname"));
                if ("false".equals(rtbus.get("buses_empty"))) {
                    busLine.setDistance(Integer.valueOf(rtbus.get("distance")));
                    busLine.setDis_stat(Integer.valueOf(rtbus.get("dis_stat")));
                }
                JSONArray stationsJsonArray = JSON.parseArray(rtbus.get("stations"));
                List<String> stations = new ArrayList<>();
                for (int j = 0; j < stationsJsonArray.size(); j++) {
                    stations.add(stationsJsonArray.getJSONObject(j).getString("bus_staname"));
                }
                busLine.setStations(stations);
                busLines.add(busLine);
            }
            BusStation busStation = new BusStation();
            busStation.setName(busStationJsonObject.getString("title"));
            busStation.setCityName(busStationJsonObject.getString("citys"));
            busStation.setXydistance(Double.valueOf(busStationJsonObject.getString("xydistance")));
            busStation.setBusLineList(busLines);
            result.add(busStation);
        }
        return result;
    }

    public void initCityIdMap() {
        if (cityIdMap != null) return;
        String resp = BusApiProvider.getCityList(busApiConfig.getUname());
        JSONObject jsonObject = JSON.parseObject(resp);
        if (!NO_ERROR.equals(jsonObject.getString("error_code"))) {
            log.error("城市映射表初始化失败,错误代码" + jsonObject.getString("error_code"));
            throw new BizException(BizErrorCodeEnum.UNSPECIFIED);
        }
        JSONArray returnList = JSON.parseArray(jsonObject.getString("returl_list"));
        Integer index = 0;
        cityIdMap = new HashMap<>();
        while (index < returnList.size()) {
            JSONObject cityIdMapItem = returnList.getJSONObject(index++);
            cityIdMap.put(cityIdMapItem.getString("cityid"), cityIdMapItem.getString("city"));
        }
    }

    public Map<String, String> getBusLine(String cityId, String busLineName) {
        String resp = BusApiProvider.getBusLine(cityId, busLineName, busApiConfig.getUname(), busApiConfig.getSecret());
        JSONObject jsonObject = JSON.parseObject(resp);

        if (!NO_ERROR.equals(jsonObject.getString("error_code"))) {
            log.error("公交线路搜索失败,错误代码:" + jsonObject.getString("error_code"));
            throw new BizException(BizErrorCodeEnum.UNSPECIFIED);
        }
        JSONArray returnList = JSON.parseArray(jsonObject.getString("returl_list"));
        Map<String, String> result = new HashMap<>();
        result.put("bus_linestrid", returnList.getJSONObject(0).getString("bus_linestrid"));
        result.put("bus_linenum", returnList.getJSONObject(0).getString("bus_linenum"));
        result.put("bus_staname", returnList.getJSONObject(0).getString("bus_staname"));
        return result;
    }

    public Map<String, String> getRealTimeBusInfo(String cityid, String bus_linestrid, String bus_linenum, String bus_staname) {
        String resp = BusApiProvider.getNearByBusRealTimeInfo(cityid,
                bus_linestrid,
                bus_linenum,
                bus_staname,
                busApiConfig.getUname(),
                busApiConfig.getSecret());
        JSONObject jsonObject = JSON.parseObject(resp);
        if (!NO_ERROR.equals(jsonObject.getString("error_code"))) {
            log.error("公交线路完整信息查询失败,错误代码:" + jsonObject.getString("error_code"));
            throw new BizException(BizErrorCodeEnum.UNSPECIFIED);
        }
        JSONObject returl_list = JSON.parseObject(jsonObject.getString("returl_list"));
        String stations = returl_list.getString("stations");
        JSONArray buses = JSON.parseArray(returl_list.getString("buses"));
        Map<String, String> result = new HashMap<>();
        result.put("stations", stations);
        if (buses.isEmpty()) {
            result.put("buses_empty", "true");
            return result;
        }
        result.put("distance", buses.getJSONObject(0).getString("distance"));
        result.put("dis_stat", buses.getJSONObject(0).getString("dis_stat"));
        result.put("buses_empty", "false");
        return result;
    }
}
