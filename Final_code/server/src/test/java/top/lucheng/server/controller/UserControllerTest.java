package top.lucheng.server.controller;

import org.junit.Before;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import top.lucheng.server.config.BusApiConfig;

@SpringBootTest
@RunWith(SpringRunner.class)
@WebAppConfiguration
class UserControllerTest {
    private MockMvc mockMvc;
    private WebApplicationContext webApplicationContext;
    @Value("bus-api.uname")
    String uname;
    @Value("bus-api.secret")
    String secret;
    @Before
    public void setup() {
        // 实例化方式一
        mockMvc = MockMvcBuilders.standaloneSetup(new UserController()).build();
        // 实例化方式二
//		mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext).build();
    }

    @Autowired
    BusApiConfig busApiConfig;
    @Test
    public void testValue(){
        System.out.println(busApiConfig.toString());
    }
    @Test
    public void testRegister() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders
                .post("/register")
                .accept(MediaType.APPLICATION_JSON_UTF8_VALUE)
                .param("identifier", "17738800302")
                .param("identity_type", "phone")
        );
    }
}