import com.shankong.config.DataServiceConfiguration;
import com.shankong.service.CataLogService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class CataLogTest {
    @Test
    public void test() {
        ApplicationContext context =
                new AnnotationConfigApplicationContext(DataServiceConfiguration.class);
        CataLogService cataLogService = context.getBean(CataLogService.class);

        cataLogService.moveDown(9);
    }
}
