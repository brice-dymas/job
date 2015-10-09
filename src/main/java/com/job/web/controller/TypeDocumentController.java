package com.job.web.controller;

import com.job.persistence.model.TypeDocument;
import com.job.persistence.service.ITypeDocumentService;
import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author Brice GUEMKAM <briceguemkam@gmail.com & (+237) 651-732-978>
 */
@Controller
@RequestMapping("/typeDocument")
public class TypeDocumentController
{

    @Autowired
    private ITypeDocumentService typeDocumentService;

    @RequestMapping(value = "/{id}/show", method = RequestMethod.GET)
    public String ShowAction(@PathVariable("id") final Long id, final ModelMap model)
    {
        final TypeDocument typeDocument = typeDocumentService.findOne(id);
        model.addAttribute("typeDocument", typeDocument);
        return "typeDocument/show";
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String indexAction(final ModelMap model, final WebRequest webRequest)
    {

        final String libelle = webRequest.getParameter("query") != null
                ? webRequest.getParameter("query")
                : "";
        final Integer page = webRequest.getParameter("page") != null
                ? Integer.valueOf(webRequest.getParameter("page"))
                : 0;
        final Integer size = webRequest.getParameter("size") != null
                ? Integer.valueOf(webRequest.getParameter("size"))
                : 20;

        final List<TypeDocument> typeDocuments = typeDocumentService.findAll();
        Page<TypeDocument> resultPage = typeDocumentService.findPaginated(page, size);

        model.addAttribute("query", libelle);
        model.addAttribute("page", page);
        model.addAttribute("Totalpage", resultPage.getTotalPages());
        model.addAttribute("size", size);
        model.addAttribute("typeDocuments", resultPage.getContent());
        return "typeDocument/index";
    }

    // write
    @RequestMapping(value = "/new", method = RequestMethod.GET)
    public String newAction(final ModelMap model)
    {
        model.addAttribute("typeDocument", new TypeDocument());
        return "typeDocument/new";
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String createAction(@Valid final TypeDocument typeDocument,
            final BindingResult result, final ModelMap model,
            final RedirectAttributes redirectAttributes)
    {
        if (result.hasErrors())
        {
            model.addAttribute("error", "error");
            model.addAttribute("typeDocument", typeDocument);
            return "typeDocument/new";
        }
        else
        {
            redirectAttributes.addFlashAttribute("info", "alert.success.new");
            typeDocumentService.create(typeDocument);
            return "redirect:/typeDocument/" + typeDocument.getId() + "/show";
        }

    }

    @RequestMapping(value = "{id}/edit", method = RequestMethod.GET)
    public String editAction(@PathVariable("id") final Long id, final ModelMap model)
    {
        final TypeDocument typeDocument = typeDocumentService.findOne(id);
        model.addAttribute("typeDocument", typeDocument);
        return "typeDocument/edit";
    }

    @RequestMapping(value = "/{id}/update", method = RequestMethod.POST)
    public String updateAction(@Valid final TypeDocument typeDocument,
            @PathVariable("id") final Long id, final BindingResult result,
            final ModelMap model, final RedirectAttributes redirectAttributes)
    {
        if (result.hasErrors())
        {
            model.addAttribute("error", "error");
            model.addAttribute("typeDocument", typeDocument);
            return "typeDocument/edit";
        }
        else
        {
            redirectAttributes.addFlashAttribute("info", "alert.success.new");
            typeDocumentService.update(typeDocument);
            return "redirect:/typeDocument/" + typeDocument.getId() + "/show";
        }
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String deleteAction(final TypeDocument typeDocument, final ModelMap model)
    {
        typeDocumentService.deleteById(typeDocument.getId());
        return "redirect:/typeDocument/";
    }

}
