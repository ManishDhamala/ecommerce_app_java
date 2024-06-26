/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/10.1.20
 * Generated at: 2024-06-02 08:56:16 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.pages;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.jsp.*;
import com.icp.gadgets.model.User;
import com.icp.gadgets.utils.StringUtils;

public final class profile_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports,
                 org.apache.jasper.runtime.JspSourceDirectives {

  private static final jakarta.servlet.jsp.JspFactory _jspxFactory =
          jakarta.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.LinkedHashSet<>(3);
    _jspx_imports_packages.add("jakarta.servlet");
    _jspx_imports_packages.add("jakarta.servlet.http");
    _jspx_imports_packages.add("jakarta.servlet.jsp");
    _jspx_imports_classes = new java.util.LinkedHashSet<>(2);
    _jspx_imports_classes.add("com.icp.gadgets.model.User");
    _jspx_imports_classes.add("com.icp.gadgets.utils.StringUtils");
  }

  private volatile jakarta.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public boolean getErrorOnELNotFound() {
    return false;
  }

  public jakarta.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final jakarta.servlet.http.HttpServletRequest request, final jakarta.servlet.http.HttpServletResponse response)
      throws java.io.IOException, jakarta.servlet.ServletException {

    if (!jakarta.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
        return;
      }
    }

    final jakarta.servlet.jsp.PageContext pageContext;
    jakarta.servlet.http.HttpSession session = null;
    final jakarta.servlet.ServletContext application;
    final jakarta.servlet.ServletConfig config;
    jakarta.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    jakarta.servlet.jsp.JspWriter _jspx_out = null;
    jakarta.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (jakarta.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/styles/global.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (jakarta.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/styles/css/profile.styles.css\">\r\n");
      out.write("    <script defer src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (jakarta.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/script/myscript.js\"></script>\r\n");
      out.write("    <script src=\"../script/toast.script.js\"></script>\r\n");
      out.write("    <style>\r\n");
      out.write("        .toast-notification {\r\n");
      out.write("            position: fixed;\r\n");
      out.write("            text-decoration: none;\r\n");
      out.write("            z-index: 999999;\r\n");
      out.write("            max-width: 300px;\r\n");
      out.write("            background-color: #fff;\r\n");
      out.write("            box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.12);\r\n");
      out.write("            border-radius: 4px;\r\n");
      out.write("            display: flex;\r\n");
      out.write("            padding: 10px;\r\n");
      out.write("            transform: translate(0, -150%);\r\n");
      out.write("        }\r\n");
      out.write("        .toast-notification .toast-notification-wrapper {\r\n");
      out.write("            flex: 1;\r\n");
      out.write("            padding-right: 10px;\r\n");
      out.write("            overflow: hidden;\r\n");
      out.write("        }\r\n");
      out.write("        .toast-notification .toast-notification-wrapper .toast-notification-header {\r\n");
      out.write("            padding: 0 0 5px 0;\r\n");
      out.write("            margin: 0;\r\n");
      out.write("            font-weight: 500;\r\n");
      out.write("            font-size: 14px;\r\n");
      out.write("            word-break: break-all;\r\n");
      out.write("            color: #4f525a;\r\n");
      out.write("        }\r\n");
      out.write("        .toast-notification .toast-notification-wrapper .toast-notification-content {\r\n");
      out.write("            font-size: 14px;\r\n");
      out.write("            margin: 0;\r\n");
      out.write("            padding: 0;\r\n");
      out.write("            word-break: break-all;\r\n");
      out.write("            color: #4f525a;\r\n");
      out.write("        }\r\n");
      out.write("        .toast-notification .toast-notification-close {\r\n");
      out.write("            appearance: none;\r\n");
      out.write("            border: none;\r\n");
      out.write("            background: transparent;\r\n");
      out.write("            cursor: pointer;\r\n");
      out.write("            font-size: 24px;\r\n");
      out.write("            line-height: 24px;\r\n");
      out.write("            padding-bottom: 4px;\r\n");
      out.write("            font-weight: bold;\r\n");
      out.write("            color: rgba(0, 0, 0, 0.2);\r\n");
      out.write("        }\r\n");
      out.write("        .toast-notification .toast-notification-close:hover {\r\n");
      out.write("            color: rgba(0, 0, 0, 0.4);\r\n");
      out.write("        }\r\n");
      out.write("        .toast-notification.toast-notification-top-center {\r\n");
      out.write("            transform: translate(calc(50vw - 50%), -150%);\r\n");
      out.write("        }\r\n");
      out.write("        .toast-notification.toast-notification-bottom-left, .toast-notification.toast-notification-bottom-right {\r\n");
      out.write("            transform: translate(0, 150%);\r\n");
      out.write("        }\r\n");
      out.write("        .toast-notification.toast-notification-bottom-center {\r\n");
      out.write("            transform: translate(calc(50vw - 50%), 150%);\r\n");
      out.write("        }\r\n");
      out.write("        .toast-notification.toast-notification-dark {\r\n");
      out.write("            background-color: #2d2e31;\r\n");
      out.write("        }\r\n");
      out.write("        .toast-notification.toast-notification-dark .toast-notification-wrapper .toast-notification-header {\r\n");
      out.write("            color: #edeff3;\r\n");
      out.write("        }\r\n");
      out.write("        .toast-notification.toast-notification-dark .toast-notification-wrapper .toast-notification-content {\r\n");
      out.write("            color: #edeff3;\r\n");
      out.write("        }\r\n");
      out.write("        .toast-notification.toast-notification-dark .toast-notification-close {\r\n");
      out.write("            color: rgba(255, 255, 255, 0.2);\r\n");
      out.write("        }\r\n");
      out.write("        .toast-notification.toast-notification-dark .toast-notification-close:hover {\r\n");
      out.write("            color: rgba(255, 255, 255, 0.4);\r\n");
      out.write("        }\r\n");
      out.write("        .toast-notification.toast-notification-success {\r\n");
      out.write("            background-color: #C3F3D7;\r\n");
      out.write("            border-left: 4px solid #51a775;\r\n");
      out.write("        }\r\n");
      out.write("        .toast-notification.toast-notification-success .toast-notification-wrapper .toast-notification-header {\r\n");
      out.write("            color: #51a775;\r\n");
      out.write("        }\r\n");
      out.write("        .toast-notification.toast-notification-success .toast-notification-wrapper .toast-notification-content {\r\n");
      out.write("            color: #51a775;\r\n");
      out.write("        }\r\n");
      out.write("        .toast-notification.toast-notification-success .toast-notification-close {\r\n");
      out.write("            color: rgba(0, 0, 0, 0.2);\r\n");
      out.write("        }\r\n");
      out.write("        .toast-notification.toast-notification-success .toast-notification-close:hover {\r\n");
      out.write("            color: rgba(0, 0, 0, 0.4);\r\n");
      out.write("        }\r\n");
      out.write("        .toast-notification.toast-notification-error {\r\n");
      out.write("            background-color: #f3c3c3;\r\n");
      out.write("            border-left: 4px solid #a75151;\r\n");
      out.write("        }\r\n");
      out.write("        .toast-notification.toast-notification-error .toast-notification-wrapper .toast-notification-header {\r\n");
      out.write("            color: #a75151;\r\n");
      out.write("        }\r\n");
      out.write("        .toast-notification.toast-notification-error .toast-notification-wrapper .toast-notification-content {\r\n");
      out.write("            color: #a75151;\r\n");
      out.write("        }\r\n");
      out.write("        .toast-notification.toast-notification-error .toast-notification-close {\r\n");
      out.write("            color: rgba(0, 0, 0, 0.2);\r\n");
      out.write("        }\r\n");
      out.write("        .toast-notification.toast-notification-error .toast-notification-close:hover {\r\n");
      out.write("            color: rgba(0, 0, 0, 0.4);\r\n");
      out.write("        }\r\n");
      out.write("        .toast-notification.toast-notification-verified {\r\n");
      out.write("            background-color: #d0eaff;\r\n");
      out.write("            border-left: 4px solid #6097b8;\r\n");
      out.write("        }\r\n");
      out.write("        .toast-notification.toast-notification-verified .toast-notification-wrapper .toast-notification-header {\r\n");
      out.write("            color: #6097b8;\r\n");
      out.write("        }\r\n");
      out.write("        .toast-notification.toast-notification-verified .toast-notification-wrapper .toast-notification-content {\r\n");
      out.write("            color: #6097b8;\r\n");
      out.write("        }\r\n");
      out.write("        .toast-notification.toast-notification-verified .toast-notification-close {\r\n");
      out.write("            color: rgba(0, 0, 0, 0.2);\r\n");
      out.write("        }\r\n");
      out.write("        .toast-notification.toast-notification-verified .toast-notification-close:hover {\r\n");
      out.write("            color: rgba(0, 0, 0, 0.4);\r\n");
      out.write("        }\r\n");
      out.write("        .toast-notification.toast-notification-dimmed {\r\n");
      out.write("            opacity: .3;\r\n");
      out.write("        }\r\n");
      out.write("        .toast-notification.toast-notification-dimmed:hover, .toast-notification.toast-notification-dimmed:active {\r\n");
      out.write("            opacity: 1;\r\n");
      out.write("        }\r\n");
      out.write("    </style>\r\n");
      out.write("\r\n");
      out.write("    <title>User Profile</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");

//here if session is not active then it will redirect user to
// login page and if session is active then it will show the user profile.
    HttpSession isSession = request.getSession(false);
    if (isSession == null || isSession.getAttribute("user") == null) {
        response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
    } else {
        User user = (User) isSession.getAttribute("user");
    }

      out.write('\r');
      out.write('\n');

    String errorMessage = (String) request.getParameter(StringUtils.ERROR_MESSAGE);
    String successMessage = (String) request.getParameter(StringUtils.SUCCESS_MESSAGE);
    if (errorMessage != null && !errorMessage.isEmpty()) {

      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("    const toasts = new Toasts({\r\n");
      out.write("        width: 300,\r\n");
      out.write("        timing: 'ease',\r\n");
      out.write("        duration: '.5s',\r\n");
      out.write("        dimOld: false,\r\n");
      out.write("        position: 'top-right' // top-left | top-center | top-right | bottom-left | bottom-center | bottom-right\r\n");
      out.write("    });\r\n");
      out.write("    toasts.push({\r\n");
      out.write("        title:\"Error\",\r\n");
      out.write("        content:\"");
      out.print(errorMessage);
      out.write("\",\r\n");
      out.write("        style:'error'\r\n");
      out.write("    })\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");

    }
    
      out.write('\r');
      out.write('\n');

    if (successMessage != null && !successMessage.isEmpty()) {

      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("    const toasts = new Toasts({\r\n");
      out.write("        width: 300,\r\n");
      out.write("        timing: 'ease',\r\n");
      out.write("        duration: '.5s',\r\n");
      out.write("        dimOld: false,\r\n");
      out.write("        position: 'top-right' // top-left | top-center | top-right | bottom-left | bottom-center | bottom-right\r\n");
      out.write("    });\r\n");
      out.write("    toasts.push({\r\n");
      out.write("        title:\"Success\",\r\n");
      out.write("        content:\"");
      out.print(successMessage);
      out.write("\",\r\n");
      out.write("        style:'success'\r\n");
      out.write("    })\r\n");
      out.write("</script>\r\n");

    }

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!-- Header Start -->\r\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header.jsp", out, false);
      out.write('\r');
      out.write('\n');
      out.write('\r');
      out.write('\n');
      out.write("\r\n");
      out.write("\r\n");
      out.write('\r');
      out.write('\n');
      out.write('\r');
      out.write('\n');
      out.write('\r');
      out.write('\n');
      out.write('\r');
      out.write('\n');
      out.write('\r');
      out.write('\n');
      out.write('\r');
      out.write('\n');
      out.write('\r');
      out.write('\n');
      out.write('\r');
      out.write('\n');
      out.write('\r');
      out.write('\n');
      out.write('\r');
      out.write('\n');
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div class=\"container\">\r\n");
      out.write("    <div class=\"main-body\">\r\n");
      out.write("        <div class=\"row gutters-sm\">\r\n");
      out.write("            <div class=\"col-md-4 mb-3\">\r\n");
      out.write("                <div class=\"card\">\r\n");
      out.write("                    <div class=\"card-body\">\r\n");
      out.write("                        <div class=\"d-flex flex-column align-items-center text-center\">\r\n");
      out.write("                            <div class=\"images_link\">\r\n");
      out.write("                                <label for=\"file-upload\" class=\"upload-label\">\r\n");
      out.write("                                    <div class=\"image-container\">\r\n");
      out.write("                                        <img class=\"mt-5\"\r\n");
      out.write("                                             src=\"https://imgs.search.brave.com/J0ixr3aHGA8aitBrET8u4exc5KcrQl8PWXGrvAdsUY4/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9mcmVl/c3ZnLm9yZy9pbWcv/YWJzdHJhY3QtdXNl/ci1mbGF0LTQucG5n\"\r\n");
      out.write("                                             style=\"width: 220px;height: 220px;\" alt=\"First Image\">\r\n");
      out.write("                                        <img class=\"overlay upload-icon\"\r\n");
      out.write("                                             src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (jakarta.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/assets/upload.png\"\r\n");
      out.write("                                             alt=\"upload\"\r\n");
      out.write("                                             style=\"width: 30px;height: 30px;\">\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                </label>\r\n");
      out.write("                                <input type=\"file\" id=\"file-upload\" style=\"display: none;\">\r\n");
      out.write("                            </div>\r\n");
      out.write("\r\n");
      out.write("                            <div class=\" mt-3\">\r\n");
      out.write("                                <h4>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${user.fullName}", java.lang.String.class, (jakarta.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</h4>\r\n");
      out.write("                                <p class=\"text-muted font-size-sm mb-5\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${user.address}", java.lang.String.class, (jakarta.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</p>\r\n");
      out.write("                            </div>\r\n");
      out.write("\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"col-md-8\">\r\n");
      out.write("                <div class=\"card mb-3\">\r\n");
      out.write("                    <div class=\"card-body\">\r\n");
      out.write("                        <form action=\"");
      out.print(request.getContextPath());
      out.write("/save-servlet\" method=\"post\">\r\n");
      out.write("\r\n");
      out.write("                            <div class=\"row\">\r\n");
      out.write("                                <div class=\"col-sm-3\">\r\n");
      out.write("                                    <h6 class=\"mb-0\">Fullname</h6>\r\n");
      out.write("                                </div>\r\n");
      out.write("                                <div class=\"col-sm-9 text-secondary\">\r\n");
      out.write("                                    <input type=\"text\" class=\"form-control\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${user.fullName}", java.lang.String.class, (jakarta.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\" name=\"fullname\" readonly>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <hr>\r\n");
      out.write("                            <div class=\"row\">\r\n");
      out.write("                                <div class=\"col-sm-3\">\r\n");
      out.write("                                    <h6 class=\"mb-0\">Username</h6>\r\n");
      out.write("                                </div>\r\n");
      out.write("                                <div class=\"col-sm-9 text-secondary\">\r\n");
      out.write("                                    <input type=\"text\" class=\"form-control\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${user.username}", java.lang.String.class, (jakarta.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\" name=\"username\" readonly>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <hr>\r\n");
      out.write("                            <div class=\"row\">\r\n");
      out.write("                                <div class=\"col-sm-3\">\r\n");
      out.write("                                    <h6 class=\"mb-0\">Email</h6>\r\n");
      out.write("                                </div>\r\n");
      out.write("                                <div class=\"col-sm-9 text-secondary\">\r\n");
      out.write("                                    <input type=\"email\" class=\"form-control\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${user.email}", java.lang.String.class, (jakarta.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\" name=\"email\"  readonly>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <hr>\r\n");
      out.write("                            <div class=\"row\">\r\n");
      out.write("                                <div class=\"col-sm-3\">\r\n");
      out.write("                                    <h6 class=\"mb-0\">Phone</h6>\r\n");
      out.write("                                </div>\r\n");
      out.write("                                <div class=\"col-sm-9 text-secondary\">\r\n");
      out.write("                                    <input type=\"tel\" class=\"form-control\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${user.phoneNumber}", java.lang.String.class, (jakarta.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\" name=\"phonenumber\" readonly>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <hr>\r\n");
      out.write("                            <div class=\"row\">\r\n");
      out.write("                                <div class=\"col-sm-3\">\r\n");
      out.write("                                    <h6 class=\"mb-0\">Date of Birth</h6>\r\n");
      out.write("                                </div>\r\n");
      out.write("                                <div class=\"col-sm-9 text-secondary\">\r\n");
      out.write("                                    <input type=\"tel\" class=\"form-control\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${user.dob}", java.lang.String.class, (jakarta.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\" name=\"dob\" readonly>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <hr>\r\n");
      out.write("                            <div class=\"row\">\r\n");
      out.write("                                <div class=\"col-sm-3\">\r\n");
      out.write("                                    <h6 class=\"mb-0\">Address</h6>\r\n");
      out.write("                                </div>\r\n");
      out.write("                                <div class=\"col-sm-9 text-secondary\">\r\n");
      out.write("                                    <input type=\"text\" class=\"form-control\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${user.address}", java.lang.String.class, (jakarta.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\" name=\"address\" readonly>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <hr>\r\n");
      out.write("                            <div class=\"row\">\r\n");
      out.write("                                <div class=\"col-sm-12 text-center\">\r\n");
      out.write("                                    <div class=\"btn-group\" role=\"group\" aria-label=\"User actions\">\r\n");
      out.write("                                        <button type=\"button\" class=\"btn rounded-3 btn-outline-warning text-bg-warning text-white px-3 mx-2 gap-5 \"\r\n");
      out.write("                                                href=\"\" id=\"editButton\" onclick=\"toggleEditMode()\">Edit</button>\r\n");
      out.write("                                        <button  type=\"button\" class=\"btn btn-danger rounded-3  text-white px-3 mx-2 \" id=\"cancelButton\" style=\"display: none;\" onclick=\"cancelEdit()\">Cancel</button>\r\n");
      out.write("                                        <button type=\"submit\" class=\"btn btn-success px-3\" id=\"saveButton\">Save</button>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </form>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write('\r');
      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "footer.jsp", out, false);
      out.write('\r');
      out.write('\n');
      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("    function toggleEditMode() {\r\n");
      out.write("        var inputs = document.getElementsByTagName(\"input\");\r\n");
      out.write("        var editButton = document.getElementById(\"editButton\");\r\n");
      out.write("        var cancelButton = document.getElementById(\"cancelButton\");\r\n");
      out.write("        var saveButton = document.getElementById(\"saveButton\");\r\n");
      out.write("\r\n");
      out.write("        for (var i = 0; i < inputs.length; i++) {\r\n");
      out.write("            inputs[i].readOnly = !inputs[i].readOnly;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        editButton.style.display = \"none\";\r\n");
      out.write("        cancelButton.style.display = \"inline-block\";\r\n");
      out.write("        saveButton.style.display = \"inline-block\";\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("    function cancelEdit() {\r\n");
      out.write("        var inputs = document.getElementsByTagName(\"input\");\r\n");
      out.write("        var editButton = document.getElementById(\"editButton\");\r\n");
      out.write("        var cancelButton = document.getElementById(\"cancelButton\");\r\n");
      out.write("        var saveButton = document.getElementById(\"saveButton\");\r\n");
      out.write("\r\n");
      out.write("        for (var i = 0; i < inputs.length; i++) {\r\n");
      out.write("            inputs[i].readOnly = true;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        editButton.style.display = \"inline-block\";\r\n");
      out.write("        cancelButton.style.display = \"none\";\r\n");
      out.write("        saveButton.style.display = \"inline-block\";\r\n");
      out.write("    }\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof jakarta.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
