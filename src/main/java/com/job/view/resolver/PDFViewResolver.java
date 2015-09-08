/**
 *
 */
package com.job.view.resolver;

import java.util.Locale;

import org.springframework.web.servlet.View;
import org.springframework.web.servlet.ViewResolver;

import com.job.view.PdfView;



/**
 * @author gervais
 *
 */
public class PDFViewResolver implements ViewResolver {

	
	@Override
	public View resolveViewName(final String viewName, final Locale locale)
			throws Exception
	{
		return new PdfView();
	}

}
