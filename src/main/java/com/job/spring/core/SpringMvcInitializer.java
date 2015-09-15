/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.job.spring.core;

import com.job.spring.AppConfig;
import com.job.spring.web.WebConfig;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

/**
 *
 * @author sando
 */
public class SpringMvcInitializer extends AbstractAnnotationConfigDispatcherServletInitializer
{

    @Override
    protected Class<?>[] getRootConfigClasses()
    {
        return new Class[]
        {
            AppConfig.class
        };
    }

    @Override
    protected Class<?>[] getServletConfigClasses()
    {
        return new Class<?>[]
        {
            WebConfig.class
        };
    }

    @Override
    protected String[] getServletMappings()
    {
        return new String[]
        {
            "/"
        };
    }

}
