package top.lucheng.server.pojo;

import lombok.Data;

import java.util.List;

@Data
public class BusLine {
    String name;
    List<String> stations;
    Integer distance;
    Integer dis_stat;
    String cityid;
    String bus_linestrid;
    String bus_linenum;
    String bus_staname;
}
