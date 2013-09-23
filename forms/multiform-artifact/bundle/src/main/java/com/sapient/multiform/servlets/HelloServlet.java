package com.sapient.multiform.servlets;

import java.io.IOException;

import javax.servlet.Servlet;
import javax.servlet.ServletException;

import org.apache.felix.scr.annotations.Component;
import org.apache.felix.scr.annotations.Properties;
import org.apache.felix.scr.annotations.Property;
import org.apache.felix.scr.annotations.Service;
import org.apache.sling.api.SlingHttpServletRequest;
import org.apache.sling.api.SlingHttpServletResponse;
import org.apache.sling.api.servlets.SlingAllMethodsServlet;

@Component(immediate = true)
@Service(Servlet.class)
@Properties({ @Property(name = "service.description", value = { "Hello Servlet" }), @Property(name = "service.vendor", value = { "Sapient" }),
        @Property(name = "sling.servlet.paths", value = { "/sayhello" }), @Property(name = "sling.servlet.methods", value = { "GET" }),
        @Property(name = "sling.servlet.resourceTypes", value = "sling/servlet/default") })
public class HelloServlet extends SlingAllMethodsServlet {
    @Override
    protected void doGet(SlingHttpServletRequest request, SlingHttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/plain");
        response.getOutputStream().print("DDDDDDDDDDDDDD");
    }
}