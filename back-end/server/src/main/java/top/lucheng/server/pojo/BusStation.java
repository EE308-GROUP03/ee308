package top.lucheng.server.pojo;

import lombok.Data;

import java.util.List;

@Data
public class BusStation {
    String name;
    String cityName;
    Double xydistance;
    List<BusLine> busLineList;
}
