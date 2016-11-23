package ezbase.core.interceptor;

import com.alibaba.fastjson.JSON;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

public class SecurityInterceptor implements HandlerInterceptor{

    private String redirectionUrl;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {

        HttpSession session = request.getSession();
        if (session.getAttribute("user") != null) {
            return true;
        } else if (!(request.getHeader("accept").contains("application/json")  || (request.getHeader("X-Requested-With")!= null
                && request.getHeader("X-Requested-With").contains("XMLHttpRequest") ))) {
            response.sendRedirect(request.getContextPath()+redirectionUrl);
        }else {
            try {
                PrintWriter writer = response.getWriter();
                Map map = new HashMap();
                map.put("url", request.getRequestURI());
                map.put("msg", "noe permission");
                writer.write(JSON.toJSONString(map));
                writer.flush();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }

    public String getRedirectionUrl() {
        return redirectionUrl;
    }

    public void setRedirectionUrl(String redirectionUrl) {
        this.redirectionUrl = redirectionUrl;
    }
}
