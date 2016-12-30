package ezbase.system.controller;

import ezbase.core.utils.SpringUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.sql.DataSource;
import java.lang.management.ManagementFactory;
import java.lang.management.OperatingSystemMXBean;
import java.lang.management.RuntimeMXBean;
import java.lang.management.ThreadMXBean;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

@Controller
public class SecurityController {

    @RequestMapping(value = "/system")
    public String index(Model model) throws SQLException {

        Map<String,Object> sysMap = new HashMap();

        //java应用程序运行时的环境
        Map<String,Object> runTimeMap = new HashMap();
        runTimeMap.put("totalMemory",Runtime.getRuntime().totalMemory());
        runTimeMap.put("freeMemory",Runtime.getRuntime().freeMemory());
        runTimeMap.put("maxMemory",Runtime.getRuntime().maxMemory());
        sysMap.put("runTime", runTimeMap);

        //操作系统
        Map<String,Object> osMap = new HashMap();
        OperatingSystemMXBean operatingSystemMXBean = (OperatingSystemMXBean) ManagementFactory.getOperatingSystemMXBean();
        osMap.put("arch", operatingSystemMXBean.getArch());
        osMap.put("availableProcessors", operatingSystemMXBean.getAvailableProcessors());
        osMap.put("name" ,operatingSystemMXBean.getName());
        osMap.put("version",operatingSystemMXBean.getVersion());
        sysMap.put("os",osMap);


        //获取各个线程的各种状态，CPU 占用情况，以及整个系统中的线程状况
        ThreadMXBean threadMXBean=(ThreadMXBean)ManagementFactory.getThreadMXBean();
        sysMap.put("threadMXBean", threadMXBean);


        //java虚拟机运行时信息
        RuntimeMXBean runtimeMXBean = ManagementFactory.getRuntimeMXBean();
        sysMap.put("runtimeMXBean",runtimeMXBean);

        //数据库元信息
        Map<String,Object> dbMap = new HashMap();
        DataSource dataSource = (DataSource) SpringUtil.getBean("dataSource");
        java.sql.DatabaseMetaData metaData = dataSource.getConnection().getMetaData();
        dbMap.put("name",metaData.getDatabaseProductName());
        dbMap.put("version",metaData.getDatabaseProductVersion());
        sysMap.put("db", dbMap);


        model.addAttribute("system", sysMap);

        return "index";
    }

}
