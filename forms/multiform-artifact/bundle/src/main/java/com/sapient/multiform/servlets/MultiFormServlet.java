package com.sapient.multiform.servlets;

import org.apache.felix.scr.annotations.Component;
import org.apache.felix.scr.annotations.Properties;
import org.apache.felix.scr.annotations.Property;
import org.apache.felix.scr.annotations.Service;
import org.apache.sling.api.SlingHttpServletRequest;
import org.apache.sling.api.SlingHttpServletResponse;
import org.apache.sling.api.servlets.SlingAllMethodsServlet;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import java.io.IOException;

@Component(immediate = true)
@Service(Servlet.class)
@Properties({ @Property(name = "service.description", value = { "Multi form Servlet" }), @Property(name = "service.vendor", value = { "Sapient" }),
        @Property(name = "sling.servlet.paths", value = { "/cq/multiform/uhc" }), @Property(name = "sling.servlet.methods", value = { "POST" }),
        @Property(name = "sling.servlet.resourceTypes", value = "sling/servlet/default") })
public class MultiFormServlet extends SlingAllMethodsServlet {
    @Override
    protected void doGet(SlingHttpServletRequest request, SlingHttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(SlingHttpServletRequest request, SlingHttpServletResponse response) throws ServletException, IOException {
        String nxtPage = request.getParameter("NextPage");
        request.getRequestDispatcher(nxtPage).forward(request, response);
    }
}