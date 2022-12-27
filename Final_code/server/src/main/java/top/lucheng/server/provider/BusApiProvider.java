package top.lucheng.server.provider;

import org.springframework.util.Assert;
import org.springframework.util.DigestUtils;
import top.lucheng.server.utils.HttpClientUtil;
import top.lucheng.server.utils.UnicodeUtil;

import java.util.HashMap;
import java.util.Map;


/**
 * @author 61580
 */
public class BusApiProvider {
    public static String getSecretKey(String uname, String secret, String optype) {
        return DigestUtils.md5DigestAsHex((uname + secret + optype).getBytes());
    }


    /**
     * 获取城市列表
     * @param uname
     * @return
     */
    public static String getCityList(String uname){
        Map<String, String> param = new HashMap<String, String>(2) {{
            put("optype", "city");
            put("uname",uname);
        }};
        String resp = HttpClientUtil.doGet("http://api.wxbus163.cn/z_busapi/BusApi.php", param);
        Assert.notNull(resp, "getCityList返回了一个错误的null");
        Assert.isTrue(!"".equals(resp),"getCityList返回了一个空结果");
        return UnicodeUtil.unicodeToStr(resp);
    }

    /**
     * 获取附近站点
     *
     * @param lat
     * @param lng
     * @param uname
     * @param secret
     * @return
     */
    public static String getNearByBusStation(String lat, String lng, String uname, String secret) {
        Assert.notNull(lat, "参数lat不能为null");
        Assert.notNull(lng, "参数lng不能为null");
        Assert.notNull(uname, "参数uname不能为null");
        Assert.notNull(secret, "参数secret不能为null");

        Map<String, String> param = new HashMap<String, String>(5) {{
            put("xylat", lat);
            put("xylng", lng);
            put("optype", "ptnear");
            put("uname", uname);
            put("keySecret", getSecretKey(uname, secret, "ptnear"));
        }};
        String resp = HttpClientUtil.doGet("http://api.wxbus163.cn/z_busapi/BusApi.php", param);
        Assert.notNull(resp, "getNearByBusStation返回值错误");
        Assert.isTrue(!"".equals(resp),"getNearByBusStation返回了一个空结果");
        return UnicodeUtil.unicodeToStr(resp);
    }


    /**
     * 获取一条公交路线的信息
     * @param cityId
     * @param busLineName
     * @param uname
     * @param secret
     * @return
     */
    public static String getBusLine(String cityId, String busLineName, String uname, String secret) {
        Assert.notNull(cityId, "参数cityId不能为null");
        Assert.notNull(busLineName, "参数busLineName不能为null");
        Assert.notNull(uname, "参数uname不能为null");
        Assert.notNull(secret, "参数secret不能为null");
        Map<String, String> param = new HashMap<String, String>(5) {{
            put("optype", "luxian");
            put("uname", uname);
            put("cityid", cityId);
            put("keywords", busLineName);
            put("keySecret", getSecretKey(uname, secret, "luxian"));
        }};
        String resp = HttpClientUtil.doGet("http://api.wxbus163.cn/z_busapi/BusApi.php", param);
        Assert.notNull(resp, "getBusLine返回一个错误的null值");
        Assert.isTrue(!"".equals(resp),"getBusLine返回了一个空结果");
        return UnicodeUtil.unicodeToStr(resp);
    }


    /**
     * 获取公交实时信息
     *
     * @param cityid
     * @param bus_linestrid
     * @param bus_linenum
     * @param bus_staname
     * @param uname
     * @param secret
     * @return
     */
    public static String getNearByBusRealTimeInfo(String cityid, String bus_linestrid, String bus_linenum, String bus_staname, String uname, String secret) {
        Assert.notNull(cityid, "参数cityid不能为null");
        Assert.notNull(bus_linestrid, "参数bus_linestrid不能为null");
        Assert.notNull(bus_linenum, "参数bus_linenum不能为null");
        Assert.notNull(uname, "参数uname不能为null");
        Assert.notNull(secret, "参数secret不能为null");
        Map<String, String> param = new HashMap<String, String>(7) {{
            put("optype", "rtbus");
            put("uname", uname);
            //福州cityid92
            put("cityid", cityid);
            put("bus_linestrid", bus_linestrid);
            put("bus_linenum", bus_linenum);
            put("bus_staname", bus_staname);
            put("keySecret", getSecretKey(uname, secret, "rtbus"));
        }};
        String resp = HttpClientUtil.doGet("http://api.wxbus163.cn/z_busapi/BusApi.php", param);
        Assert.notNull(resp, "getNearByBusRealTimeInfo返回值错误");
        Assert.isTrue(!"".equals(resp),"getNearByBusRealTimeInfo返回了一个空结果");
        return UnicodeUtil.unicodeToStr(resp);

    }
}
