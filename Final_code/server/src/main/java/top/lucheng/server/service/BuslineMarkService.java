package top.lucheng.server.service;

import top.lucheng.server.pojo.BuslineMark;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
* @author 61580
* @description 针对表【busline_mark】的数据库操作Service
* @createDate 2022-10-08 20:19:26
*/
public interface BuslineMarkService extends IService<BuslineMark> {

    List<BuslineMark> getBusLineMark(Integer uid);

    Integer addBusLineMark(BuslineMark buslineMark);

    Integer deleteBusLineMart(Integer uid,String busLinestrid);

}
