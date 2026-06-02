import com.shankong.config.DataServiceConfiguration;
import com.shankong.mapper.ManagerMapper;
import com.shankong.pojo.Manager;
import com.shankong.service.ManagerService;
import org.apache.ibatis.annotations.Mapper;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class ManagerTest {
    @Test
    public void test() {
        ApplicationContext context =
                new AnnotationConfigApplicationContext(DataServiceConfiguration.class);
        ManagerMapper mapper = context.getBean(ManagerMapper.class);

        System.out.println(mapper.findByManagerName("aa"));


    }
}
