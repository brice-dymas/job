package com.job.web.controller;

import com.job.persistence.model.Secteur;
import com.job.persistence.service.ISecteurService;
import java.util.List;
import java.util.TreeMap;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
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
@RequestMapping("/secteur")
public class SecteurController {

    public TreeMap<String, String> getBreadcrumb() {
        final TreeMap<String, String> breadcrumb = new TreeMap<>();
        breadcrumb.put("breadcrumb.secteur.index", "/job/secteur/");
        return breadcrumb;
    }

    @Autowired
    private ISecteurService secteurService;

    @RequestMapping(value = "/{id}/show", method = RequestMethod.GET)
    public String ShowAction(@PathVariable("id") final Long id, final ModelMap model) {
        final Secteur secteur = secteurService.findOne(id);
        model.addAttribute("secteur", secteur);
        final TreeMap<String, String> breadcrumb = getBreadcrumb();
        breadcrumb.put("breadcrumb.secteur.show", "");
        model.addAttribute("breadcrumbs", breadcrumb);
        return "secteur/show";
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String indexAction(final ModelMap model, final WebRequest webRequest) {
        
        final String libelle = webRequest.getParameter("query") != null
                ? webRequest.getParameter("query")
                : "";
        final Integer page = webRequest.getParameter("page") != null
                ? Integer.valueOf(webRequest.getParameter("page"))
                : 0;
        final Integer size = webRequest.getParameter("size") != null
                ? Integer.valueOf(webRequest.getParameter("size"))
                : 20;

        final List<Secteur> secteurs = secteurService.findAll();
        Page<Secteur> resultPage = secteurService.findByName("%" + libelle + "%", new PageRequest(page, size));
        final TreeMap<String, String> breadcrumb = getBreadcrumb();

        breadcrumb.put("breadcrumb.secteur.index", "");
        model.addAttribute("breadcrumbs", breadcrumb);

        model.addAttribute("query", libelle);
        model.addAttribute("page", page);
        model.addAttribute("Totalpage", resultPage.getTotalPages());
        model.addAttribute("size", size);
        model.addAttribute("secteurs", resultPage.getContent());
        return "secteur/index";
    }

    // write
    @RequestMapping(value = "/new", method = RequestMethod.GET)
    public String newAction(final ModelMap model) {
        model.addAttribute("secteur", new Secteur());
        final TreeMap<String, String> breadcrumb = getBreadcrumb();
        breadcrumb.put("breadcrumb.secteur.new", "");
        model.addAttribute("breadcrumbs", breadcrumb);
        return "secteur/new";
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String createAction(@Valid final Secteur secteur,
            final BindingResult result, final ModelMap model,
            final RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            model.addAttribute("error", "error");
            model.addAttribute("secteur", secteur);
            return "secteur/new";
        } else {
            redirectAttributes.addFlashAttribute("info", "alert.success.new");
            secteurService.create(secteur);
            return "redirect:/secteur/" + secteur.getId() + "/show";
        }

    }

    @RequestMapping(value = "{id}/edit", method = RequestMethod.GET)
    public String editAction(@PathVariable("id") final Long id, final ModelMap model) {
        final Secteur secteur = secteurService.findOne(id);
        final TreeMap<String, String> breadcrumb = getBreadcrumb();
        breadcrumb.put("breadcrumb.secteur.edit", "");
        model.addAttribute("breadcrumbs", breadcrumb);
        model.addAttribute("secteur", secteur);
        return "secteur/edit";
    }

    @RequestMapping(value = "/{id}/update", method = RequestMethod.POST)
    public String updateAction(@Valid final Secteur secteur,
            @PathVariable("id") final Long id, final BindingResult result,
            final ModelMap model, final RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            model.addAttribute("error", "error");
            model.addAttribute("secteur", secteur);
            return "secteur/edit";
        } else {
            redirectAttributes.addFlashAttribute("info", "alert.success.new");
            secteurService.update(secteur);
            return "redirect:/secteur/" + secteur.getId() + "/show";
        }
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String deleteAction(final Secteur secteur, final ModelMap model) {
        secteurService.deleteById(secteur.getId());
        return "redirect:/secteur/";
    }

}
