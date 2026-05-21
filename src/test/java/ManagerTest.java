import com.shankong.pojo.Manager;
import com.shankong.service.ManagerService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ManagerTest {
    @Test
    public void test() {
        try {
            ApplicationContext context =
                    new ClassPathXmlApplicationContext("classpath:config/applicationContext.xml");
            ManagerService managerService = context.getBean(ManagerService.class);

            Manager manager = new Manager();
            manager.setManagerName("lisi");
            manager.setManagerPwd("444444");

            System.out.println(managerService.login(manager));

        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
}
