package top.lucheng.server.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import lombok.Data;

/**
 * 
 * @TableName busline_mark
 */
@TableName(value ="busline_mark")
@Data
public class BuslineMark implements Serializable {
    /**
     * id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 收藏条所属的用户id
     */
    private Integer uid;
    /**
     * 城市id
     */
    private String cityid;
    private String busLinestrid;
    private String busLinenum;
    private String busStaname;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        BuslineMark other = (BuslineMark) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getUid() == null ? other.getUid() == null : this.getUid().equals(other.getUid()))
            && (this.getCityid() == null ? other.getCityid() == null : this.getCityid().equals(other.getCityid()))
            && (this.getBusLinestrid() == null ? other.getBusLinestrid() == null : this.getBusLinestrid().equals(other.getBusLinestrid()))
            && (this.getBusLinenum() == null ? other.getBusLinenum() == null : this.getBusLinenum().equals(other.getBusLinenum()))
            && (this.getBusStaname() == null ? other.getBusStaname() == null : this.getBusStaname().equals(other.getBusStaname()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getUid() == null) ? 0 : getUid().hashCode());
        result = prime * result + ((getCityid() == null) ? 0 : getCityid().hashCode());
        result = prime * result + ((getBusLinestrid() == null) ? 0 : getBusLinestrid().hashCode());
        result = prime * result + ((getBusLinenum() == null) ? 0 : getBusLinenum().hashCode());
        result = prime * result + ((getBusStaname() == null) ? 0 : getBusStaname().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", uid=").append(uid);
        sb.append(", cityid=").append(cityid);
        sb.append(", busLinestrid=").append(busLinestrid);
        sb.append(", busLinenum=").append(busLinenum);
        sb.append(", busStaname=").append(busStaname);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}