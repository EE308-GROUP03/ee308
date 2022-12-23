package top.lucheng.server.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArraySet;
import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import com.alibaba.druid.support.json.JSONUtils;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;
import org.springframework.util.Assert;
import top.lucheng.server.utils.RedisUtils;


@Api(tags = "建立websocket连接")
@Component
@Slf4j
@ServerEndpoint("/websocket/{uid}")  // 接口路径 ws://localhost:8866/webSocket/{uid};
public class WebSocketController {

    @Autowired
    RedisUtils redisUtils;
    //与某个客户端的连接会话，需要通过它来给客户端发送数据
    private Session session;

    //concurrent包的线程安全Set，用来存放每个客户端对应的MyWebSocket对象。
    //虽然@Component默认是单例模式的，但springboot还是会为每个websocket连接初始化一个bean，所以可以用一个静态set保存起来。
    //  注：底下WebSocket是当前类名
    private static CopyOnWriteArraySet<WebSocketController> webSockets = new CopyOnWriteArraySet<>();
    // 用来存在线连接数
    private static final Map<String, Session> sessionPool = new HashMap<>();
    @OnOpen
    public void onOpen(Session session, @PathParam(value = "uid") String uid) {
        try {
            this.session = session;
            webSockets.add(this);
            sessionPool.put(uid, session);
            log.info("【websocket消息】有新的连接，总数为:" + webSockets.size());
            for (String ui : sessionPool.keySet()) {
                System.out.println("当前连接用户:" + ui);
            }
        } catch (Exception e) {
        }
    }

    /**
     * 链接关闭调用的方法
     */
    @OnClose
    public void onClose() {
        try {
            webSockets.remove(this);
            log.info("【websocket消息】连接断开，总数为:" + webSockets.size());
        } catch (Exception e) {
        }
    }
    /**
     * 收到客户端消息后调用的方法
     * <p>
     * //     * @param message

     * //     * @param session
     */

    @OnMessage
    public void onMessage(String message) {
        if (message.equals(null)) {
            return;
        }
        Map<String, String> mp = (Map<String, String>) JSONUtils.parse(message);
        String uid = mp.get("uid");
        String fid = mp.get("fid");
        String actionType = mp.get("action_type");
        Assert.notNull(uid,"websocket连接失败：uid为空");
        Assert.notNull(fid,"websocket连接失败：fid为空");
        Assert.notNull(actionType,"websocket连接失败：action_type为空");
        String info="";
        if (sendOneMessage(fid, actionType)) info="发送成功";
        else info ="但是消息接受方并未连接上服务器";
        log.info("【websocket消息】: 用户:{} 向用户:{} 发送了一条消息,内容为：{} {}",uid,fid,message,info);
    }

    /**
     * 发送错误时的处理
     *
     * @param session
     * @param error
     */
    @OnError
    public void onError(Session session, Throwable error) {

        log.error("用户错误,原因:" + error.getMessage());
        error.printStackTrace();
    }


    // 此为广播消息
    public void sendAllMessage(String message) {
        log.info("【websocket消息】广播消息:" + message);
        for (WebSocketController webSocket : webSockets) {
            try {
                if (webSocket.session.isOpen()) {
                    webSocket.session.getAsyncRemote().sendText(message);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    // 此为单点消息
    public Boolean sendOneMessage(String uid, String message) {
        Session session = sessionPool.get(uid);
        if (session != null && session.isOpen()) {
            try {
                session.getAsyncRemote().sendText(message);
                return true;
            } catch (Exception e) {
                e.printStackTrace();
                return false;
            }
        }
        return false;
    }

    // 此为单点消息(多人)
    public void sendMoreMessage(String[] userIds, String message) {
        for (String userId : userIds) {
            Session session = sessionPool.get(userId);
            if (session != null && session.isOpen()) {
                try {
                    log.info("【websocket消息】 单点消息:" + message);
                    session.getAsyncRemote().sendText(message);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }

    }

}
