import com.shankong.pojo.Manager;
import com.shankong.service.CataLogService;
import com.shankong.service.ManagerService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class CataLogTest {
    @Test
    public void test() {
        try {
            ApplicationContext context =
                    new ClassPathXmlApplicationContext("classpath:config/applicationContext.xml");
            CataLogService cataLogService = context.getBean(CataLogService.class);

            cataLogService.moveUp(5);

        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
}
