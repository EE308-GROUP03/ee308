package top.lucheng.server.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import top.lucheng.server.pojo.BusStation;
import top.lucheng.server.pojo.BuslineMark;
import top.lucheng.server.service.BuslineMarkService;
import top.lucheng.server.service.LocationService;
import top.lucheng.server.utils.R;

import java.util.List;

@Api(tags = "位置信息接口")
@RestController
@RequestMapping("/location")
public class LocationController {
    @Autowired
    LocationService locationService;

    @ApiOperation("获取附近公交")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "log",
                    value = "经度",
                    paramType = "path",
                    dataType = "double",
                    dataTypeClass = Double.class,
                    required = true),
            @ApiImplicitParam(name = "lat",
                    value = "纬度",
                    paramType = "path",
                    dataType = "double",
                    dataTypeClass = Double.class,
                    required = true),
    })
    @GetMapping("/bus/{log}/{lat}")
    public R getNearbyBus(@PathVariable(value = "log") double longitude, @PathVariable("lat") double latitude) {
        List<BusStation> result = locationService.getNearbyBus(longitude, latitude);
        if (result.equals(null) || result.isEmpty()) return R.error(404, "无法请求到附近公交路线!");
        return R.ok("返回路线成功").put("bus", result);
    }


    @Autowired
    BuslineMarkService buslineMarkService;

    @GetMapping("/busline/mark/{uid}")
    public R getBusLineMark(@PathVariable(value = "uid") Integer uid) {
        return R.ok("获取收藏公交成功").put("buslines", buslineMarkService.getBusLineMark(uid));
    }

    @PostMapping("/busline/mark/{uid}")
    public R addBusLineMark(@RequestBody BuslineMark buslineMark) {
        buslineMarkService.addBusLineMark(buslineMark);
        return R.ok("添加成功");
    }

    @DeleteMapping("/busline/mark/{bus_linestrid}/{uid}")
    public R deleteBusLineMart(@PathVariable(value = "bus_linestrid") String busLinestrid, @PathVariable(value = "uid") Integer uid) {
        buslineMarkService.deleteBusLineMart(uid, busLinestrid);
        return R.ok("删除成功");
    }
}
