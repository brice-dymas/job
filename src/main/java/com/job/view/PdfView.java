package com.job.view;

import com.job.view.resolver.AbstractITextPdfView;
import com.itextpdf.text.Document;
import com.itextpdf.text.pdf.PdfWriter;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PdfView
        extends AbstractITextPdfView
{

    @Override
    protected void buildPdfDocument(final Map<String, Object> model,
            final Document document, final PdfWriter writer,
            final HttpServletRequest request, final HttpServletResponse response)
            throws Exception
    {

    }

}
