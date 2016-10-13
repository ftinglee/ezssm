/**
 * Created by LeeZhao on 16/10/11.
 **/
package ezbase;

import org.junit.Before;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * <p></p>
 * @author LeeZhao
 * @date 16/10/11
 * @version 1.0
 **/
public abstract class BaseTest {

    public ApplicationContext context;

    @Before
    public void testBefore(){
        context = new ClassPathXmlApplicationContext("ApplicationContext.xml");
    }
}
