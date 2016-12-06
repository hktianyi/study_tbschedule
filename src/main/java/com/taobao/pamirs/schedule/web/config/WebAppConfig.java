package com.taobao.pamirs.schedule.web.config;

import com.taobao.pamirs.schedule.web.filter.AuthenticationFilter;
import org.apache.commons.lang.StringUtils;
import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.util.IntrospectorCleanupListener;

import javax.servlet.DispatcherType;
import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;
import java.util.Calendar;
import java.util.EnumSet;

/**
 * Web主配置文件，替代web.xml
 * Created by Tianyi on 2016/3/1.
 */
public class WebAppConfig implements WebApplicationInitializer {
  
  private static final String urlRegex = "^/(login|static)+.*$";
  private static final String SYSTEM_SERVLET_NAME_SPRINGMVC = "spring-mvc";

  // 启动执行
  public void onStartup(ServletContext servletContext) throws ServletException {

    // 应用初始化配置参数
    servletContext.setAttribute("_PATH", servletContext.getContextPath());
    servletContext.setAttribute("_VERSION", Calendar.getInstance().getTimeInMillis());
    servletContext.setAttribute("_CDN", "//cdn.bootcss.com");

    // SpringMVC 入口
    AnnotationConfigWebApplicationContext mvcContext = new AnnotationConfigWebApplicationContext();
    mvcContext.register(SpringMvcConfig.class);
    ServletRegistration.Dynamic springMvc = servletContext.addServlet(SYSTEM_SERVLET_NAME_SPRINGMVC, new DispatcherServlet(mvcContext));
    springMvc.setLoadOnStartup(1);
    
    // 验证tomcat版本
    if (!springMvc.addMapping("/").isEmpty()) {
      throw new IllegalStateException("'" + SYSTEM_SERVLET_NAME_SPRINGMVC + "' cannot be mapped to '/' under Tomcat versions <= 7.0.14");
    }

    servletContext.addListener(new ContextLoaderListener(mvcContext));
    // Spring 刷新Introspector防止内存泄露
    servletContext.addListener(new IntrospectorCleanupListener());

    // 字符集过滤
    FilterRegistration.Dynamic encodingFilter = servletContext.addFilter("encodingFilter", new CharacterEncodingFilter());
    encodingFilter.setInitParameter("forceEncoding", "true");
    encodingFilter.setInitParameter("encoding", "UTF-8");
    encodingFilter.addMappingForServletNames(EnumSet.of(DispatcherType.REQUEST, DispatcherType.FORWARD), true, SYSTEM_SERVLET_NAME_SPRINGMVC);

    // 权限过滤
    if (StringUtils.isNotEmpty(urlRegex)) {
      FilterRegistration.Dynamic authenticationFilter = servletContext.addFilter("authenticationFilter", new AuthenticationFilter());
      authenticationFilter.setInitParameter("urlRegex", urlRegex);
      authenticationFilter.addMappingForServletNames(EnumSet.of(DispatcherType.REQUEST), true, SYSTEM_SERVLET_NAME_SPRINGMVC);
    }

  }

}