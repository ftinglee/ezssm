package ezbase.core;

import com.alibaba.fastjson.JSON;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class GlobalMappingExceptionResolver extends SimpleMappingExceptionResolver{

    @Override
    protected ModelAndView doResolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {

        ModelAndView modelAndView = super.doResolveException(request, response, handler, ex);
        ex.toString();
        modelAndView.addObject("url", request.getRequestURL());
        if (!(request.getHeader("accept").contains("application/json")  || (request.getHeader("X-Requested-With")!= null
                && request.getHeader("X-Requested-With").contains("XMLHttpRequest") ))) {
            return modelAndView;
        }else {
            try {
                PrintWriter writer = response.getWriter();
                modelAndView.addObject("url",request.getRequestURI());
                modelAndView.addObject("msg","noe permission");
                writer.write(JSON.toJSONString(modelAndView));
                writer.flush();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return null;
    }
}
