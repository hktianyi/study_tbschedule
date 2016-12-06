package com.taobao.pamirs.schedule.web.filter;

import org.apache.commons.lang.StringUtils;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Pattern;

/**
 * 认证过滤器
 * Created by Tianyi on 2015/12/31.
 */
//@WebFilter(dispatcherTypes = {DispatcherType.REQUEST, DispatcherType.FORWARD}, urlPatterns = "/*", asyncSupported = true)
public class AuthenticationFilter implements Filter {

  private static Pattern urlRegex;
  private static final String KEY_SESSION_USER = "_USER";
  private static final String KEY_SESSION_LOGIN_TO_PAGE = "_LOGIN_TO";

  @Override
  public void init(FilterConfig filterConfig) throws ServletException {
    urlRegex = Pattern.compile(filterConfig.getInitParameter("urlRegex"));
  }

  @Override
  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
    HttpServletRequest req = (HttpServletRequest) request;
    HttpServletResponse res = (HttpServletResponse) response;

    // 替换 项目部署路径 ，只留项目相对根路径
    String uri = req.getRequestURI().replaceAll("^" + req.getContextPath(), "");

    //1，白名单判断

    if (!urlRegex.matcher(uri).matches()) {

      //2，登录判断
      Object so = req.getSession().getAttribute(KEY_SESSION_USER);
      if (so == null || so.equals("")) {
        this.forword(req, res, req.getContextPath() + "/login");
        return;
      } else {
        // 此处只针对服务操作，排除jsp资源考虑在拦截器中做权限处理
        // 通过组件uri前缀 和 web页面组件目录名来做组件权限判断，例如 /member/modfiyPwd ,/s9/member
        //3，角色权限判断
        //            	User member =(User)so;
        //            	List<String> source = member.getResourceList();
        //            	if(!source.contains(uri)){// 如果当前用户没有访问此资源的权限
        //            		forword(res,"/s9/error/noSecurity.html");
        //        			return;
        //        		}
      }
    }
    chain.doFilter(request, response);
  }

  @Override
  public void destroy() {
    urlRegex = null;
  }

  /**
   * 页面跳转
   * 由于Web端 可能 使用iframe嵌套, 因此直接重定向到登录页面并不能总是完成地很完美, 比如HTTP请求来自
   * iframe对象的时候, 只能让iframe加载到index.html, 体验不够好; 所以在这里将直接重定向改为向
   * 页面输出一段JS代码来实现使顶部window跳转到默认的登录页面.
   * httpResponse.sendRedirect(httpRequest.getContextPath() + "/index.html");
   */
  protected void forword(HttpServletRequest req, HttpServletResponse res, String url) throws IOException {
    /**
     * 当HTTP请求来自AJAX并且用户的Session已经超时时, 这时页面会没有任何反应, 因为向AJAX请求
     * 重定向或者输出一段JS实现跳转都是无法完成的. 因此这里实现当上述情况发生时, 向AJAX请求返
     * 回特定的标识(添加到响应对象中), 可以在定义AJAX请求完成回调方法时得到这个标识, 进而提示
     * 用户并完成JS跳转.
     */
    String loginToPath = req.getServletPath();
    if (StringUtils.isNotEmpty(loginToPath) && !"/".equals(loginToPath)) {
      String queryString = req.getQueryString();
      if (StringUtils.isNotEmpty(queryString)) loginToPath += "?" + queryString;
      req.getSession().setAttribute(KEY_SESSION_LOGIN_TO_PAGE, loginToPath);
    }
    String requestType = req.getHeader("X-Requested-With");
    if (!StringUtils.isEmpty(requestType) && requestType.equalsIgnoreCase("XMLHttpRequest")) {
      res.setHeader("sessionstatus", "timeout");
      res.sendError(518, "session timeout.");
      return;
    } else {
      PrintWriter out = res.getWriter();
      out.print("<!DOCTYPE html>");
      out.print("<html>");
      out.print("<script> ");
      out.print("var p=window;while(p!=p.parent){p=p.parent; } p.location.href='" + url + "';");
      out.print("</script>");
      out.print("</html>");
    }
  }
}
