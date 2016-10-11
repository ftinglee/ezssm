/**
 * Created by LeeZhao on 16/10/11.
 **/
package ezbase.system;

import ezbase.BaseTest;
import org.junit.Assert;
import org.junit.Test;

/**
 * <p>spring功能测试</p>
 * @author LeeZhao
 * @date 16/10/11
 * @version 1.0
 **/
public class SpringTest extends BaseTest {

    @Test
    public void testSpringLoaded(){
        TestService testService = (TestService) context.getBean("test");
        Assert.assertTrue(testService.isLoaded());
    }
}
