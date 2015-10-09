/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.job.web.controller;

import com.job.persistence.model.Entreprise;
import com.job.persistence.model.Placement;
import com.job.persistence.service.IEntrepriseService;
import com.job.persistence.service.IPlacementService;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author Brice GUEMKAM <briceguemkam@gmail.com>
 */
@Controller
@RequestMapping("/entreprise")
public class EntrepriseController
{

    @Autowired
    private IEntrepriseService entrepriseService;

    @Autowired
    IPlacementService placementService;

    @RequestMapping(value = "/{id}/show", method = RequestMethod.GET)
    public String ShowAction(@PathVariable("id") final Long id, final ModelMap model, final WebRequest webRequest)
    {

        Date dateDebut, dateFin;
        SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy/MM/dd");
        // POur la date
        final String dateDebuString = webRequest.getParameter("querydatedebut") != null
                ? webRequest.getParameter("querydatedebut")
                : "";
        final String dateFinString = webRequest.getParameter("querydatefin") != null
                ? webRequest.getParameter("querydatefin")
                : "";
        final String nom = webRequest.getParameter("querynom") != null
                ? webRequest.getParameter("querynom") : "";
        final String statut = webRequest.getParameter("querystatut") != null
                && !webRequest.getParameter("querystatut").equals("")
                        ? webRequest.getParameter("querystatut") : "";
        final Integer page = webRequest.getParameter("page") != null
                ? Integer.valueOf(webRequest.getParameter("page"))
                : 0;
        final Integer size = webRequest.getParameter("size") != null
                ? Integer.valueOf(webRequest.getParameter("size"))
                : 20;
        dateDebut = parsedDateFrom(dateDebuString, "2000/01/01", dateFormatter);
        dateFin = parsedDateFrom(dateFinString, "2090/12/31", dateFormatter);

        final Entreprise entreprise = entrepriseService.findOne(id);
        Page<Placement> resultPage = placementService.filterbyEntrepriseID(id, nom, statut, dateDebut, dateFin, page, size);

        model.addAttribute("querydatedebut", dateDebuString);
        model.addAttribute("querydatefin", dateFinString);
        model.addAttribute("entreprise", entreprise);
        model.addAttribute("placements", resultPage.getContent());
        model.addAttribute("querynom", nom);
        model.addAttribute("querystatut", statut);
        model.addAttribute("page", page);
        model.addAttribute("Totalpage", resultPage.getTotalPages());
        model.addAttribute("size", size);
        return "entreprise/show";
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String indexAction(final ModelMap model, final WebRequest webRequest)
    {

        final String nom = webRequest.getParameter("querynom") != null
                ? webRequest.getParameter("querynom")
                : "";
        final String adresse = webRequest.getParameter("queryadresse") != null
                ? webRequest.getParameter("queryadresse")
                : "";
        final Integer page = webRequest.getParameter("page") != null
                ? Integer.valueOf(webRequest.getParameter("page"))
                : 0;
        final Integer size = webRequest.getParameter("size") != null
                ? Integer.valueOf(webRequest.getParameter("size"))
                : 20;

        Page<Entreprise> resultPage = entrepriseService.search("%" + nom + "%", "%" + adresse + "%", page, size);
        Entreprise entreprise = new Entreprise();
        model.addAttribute("entreprise", entreprise);
        model.addAttribute("page", page);
        model.addAttribute("Totalpage", resultPage.getTotalPages());
        model.addAttribute("size", size);
        model.addAttribute("entreprises", resultPage.getContent());
        return "entreprise/index";
    }

    // write
    @RequestMapping(value = "/new", method = RequestMethod.GET)
    public String newAction(final ModelMap model)
    {
        Entreprise entreprise = new Entreprise();
        model.addAttribute("entreprise", entreprise);
        return "entreprise/new";
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String createAction(@Valid final Entreprise entreprise,
            final BindingResult result, final ModelMap model,
            final RedirectAttributes redirectAttributes)
    {
        if (result.hasErrors())
        {
            model.addAttribute("error", "error");
            model.addAttribute("entreprise", entreprise);
            return "entreprise/new";
        }
        else
        {
            redirectAttributes.addFlashAttribute("info", "alert.success.new");
            entrepriseService.create(entreprise);
            return "redirect:/entreprise/" + entreprise.getId() + "/show";
        }

    }

    @RequestMapping(value = "{id}/edit", method = RequestMethod.GET)
    public String editAction(@PathVariable("id") final Long id, final ModelMap model)
    {
        final Entreprise entreprise = entrepriseService.findOne(id);
        model.addAttribute("entreprise", entreprise);
        return "entreprise/edit";
    }

    @RequestMapping(value = "/{id}/update", method = RequestMethod.POST)
    public String updateAction(@Valid final Entreprise entreprise,
            @PathVariable("id") final Long id, final BindingResult result,
            final ModelMap model, final RedirectAttributes redirectAttributes)
    {
        if (result.hasErrors())
        {
            model.addAttribute("error", "error");
            model.addAttribute("entreprise", entreprise);
            return "entreprise/edit";
        }
        else
        {
            redirectAttributes.addFlashAttribute("info", "alert.success.new");
            entrepriseService.update(entreprise);
            return "redirect:/entreprise/" + entreprise.getId() + "/show";
        }
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String deleteAction(final Entreprise entreprise, final ModelMap model)
    {
        entrepriseService.deleteById(entreprise.getId());
        return "redirect:/entreprise/";
    }

    @ModelAttribute("mesStatuts")
    public Map<Long, String> populateStatutFields()
    {
        final Map<Long, String> results = new HashMap<>();
        results.put(1L, "En attente");
        results.put(2L, "En Cours d'execution");
        results.put(3L, "Stage termine");
        return results;
    }

    /**
     * Pour Convertir une chaine de charactères en java.util.Date suivant un
     * format donné
     *
     * @exception ParseException
     * @param dateFormat : le format de sortie de la date
     * @param dateString : la chaine de charactères à convertir en date
     * @return result: la java.util.Date obtenue après conversion
     */
    private Date parsedDateFrom(String dateString, String dateLimite, SimpleDateFormat dateFormat)
    {
        Date result = new Date();
        SimpleDateFormat dateFormatter = dateFormat;
        try
        {
            result = dateFormatter.parse(dateString);
        }
        catch (ParseException ex)
        {
            try
            {
                result = dateFormatter.parse(dateLimite);
            }
            catch (ParseException ex1)
            {
                Logger.getLogger(JobSeekerController.class.getName()).log(Level.SEVERE, null, ex1);
            }
        }
        return result;
    }
}
