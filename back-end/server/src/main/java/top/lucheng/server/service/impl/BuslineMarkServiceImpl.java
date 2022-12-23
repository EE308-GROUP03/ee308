package top.lucheng.server.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import top.lucheng.server.pojo.BuslineMark;
import top.lucheng.server.service.BuslineMarkService;
import top.lucheng.server.mapper.BuslineMarkMapper;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 61580
 * @description 针对表【busline_mark】的数据库操作Service实现
 * @createDate 2022-10-08 20:19:26
 */
@Service
public class BuslineMarkServiceImpl extends ServiceImpl<BuslineMarkMapper, BuslineMark>
        implements BuslineMarkService {

    @Autowired
    BuslineMarkMapper buslineMarkMapper;

    @Override
    public List<BuslineMark> getBusLineMark(Integer uid) {

        return buslineMarkMapper.selectList(new QueryWrapper<BuslineMark>().eq("uid", uid));
    }

    @Override
    public Integer addBusLineMark(BuslineMark buslineMark) {
        return buslineMarkMapper.insert(buslineMark);

    }

    @Override
    public Integer deleteBusLineMart(Integer uid, String busLinestrid) {

        return buslineMarkMapper.delete(new QueryWrapper<BuslineMark>().eq("uid", uid).eq("bus_linestrid", busLinestrid));

    }
}




