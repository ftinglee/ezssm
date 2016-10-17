package ezbase.system;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class SpringTest {

    private ApplicationContext context;

    @Before
    public void testBefore() {
        context = new ClassPathXmlApplicationContext("classpath:ApplicationContext.xml");
    }

    @Test
    public void testSpringLoaded() {
        TestService testService = (TestService) context.getBean("test");
        Assert.assertTrue(testService.isLoaded());
    }
}
