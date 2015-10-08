/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.job.web.controller;

import com.job.persistence.dao.IPlacementDao;
import com.job.persistence.model.Entreprise;
import com.job.persistence.model.JobSeeker;
import com.job.persistence.model.Placement;
import com.job.persistence.service.IEntrepriseService;
import com.job.persistence.service.IJobSeekerService;
import com.job.persistence.service.IPlacementService;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
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
@RequestMapping("/placement")
public class PlacementController
{

    @Autowired
    IPlacementDao dao;

    @Autowired
    IPlacementService placementService;

    @Autowired
    IJobSeekerService jobSeekerService;

    @Autowired
    IEntrepriseService entrepriseService;

    @RequestMapping(value = "/{id}/show", method = RequestMethod.GET)
    public String ShowAction(@PathVariable("id") final Long id,
            final ModelMap model)
    {
        final Placement placement = placementService.findOne(id);
        final Entreprise entreprise = entrepriseService.findOne(placement.getEntreprise().getId());
        final JobSeeker jobSeeker = jobSeekerService.findOne(placement.getJobSeeker().getId());
        placement.setEntreprise(entreprise);
        placement.setJobSeeker(jobSeeker);

        model.addAttribute("placement", placement);
        model.addAttribute("entreprise", entreprise);
        model.addAttribute("jobSeeker", jobSeeker);
        return "placement/show";
    }

    /**
     * *
     * @RequestMapping(method = RequestMethod.GET) public String
     * indexAction(final ModelMap model, final WebRequest webRequest) { final
     * Integer page = webRequest.getParameter("page") != null ?
     * Integer.valueOf(webRequest.getParameter("page")) : 0; final Integer size
     * = webRequest.getParameter("size") != null ?
     * Integer.valueOf(webRequest.getParameter("size")) : 20;
     *
     * Placement placement = new Placement(); final Page<Placement> resultPage =
     * dao.findAll(new PageRequest(page, size)); model.addAttribute("page",
     * page); model.addAttribute("Totalpage", resultPage.getTotalPages());
     * model.addAttribute("size", size); model.addAttribute("placement",
     * placement); model.addAttribute("placements", resultPage.getContent());
     * return "placement/index";
    }**
     */

    /**
     *
     * @param model
     * @RequestMapping (method = RequestMethod.GET) public String
     * indexAction(final ModelMap model, final WebRequest webRequest) { final
     * Integer page = webRequest.getParameter("page") != null ?
     * Integer.valueOf(webRequest.getParameter("page")) : 0; final Integer size
     * = webRequest.getParameter("size") != null ?
     * Integer.valueOf(webRequest.getParameter("size")) : 20;
     *
     * Placement placement = new Placement(); final Page<Placement> resultPage =
     * dao.findAll(new PageRequest(page, size)); model.addAttribute("page",
     * page); model.addAttribute("Totalpage", resultPage.getTotalPages());
     * model.addAttribute("size", size); model.addAttribute("placement",
     * placement); model.addAttribute("placements", resultPage.getContent());
     * return "placement/index"; }
     */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String searchAction(final ModelMap model, final WebRequest webRequest)
    {
        Date dateDebut, dateFin;
        SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy/MM/dd");
        final Long idEntreprise = (webRequest.getParameter("queryentreprise") != null
                && !webRequest.getParameter("queryentreprise").equals(""))
                        ? Long.valueOf(webRequest.getParameter("queryentreprise"))
                        : -1;
        final String nom = webRequest.getParameter("querynom") != null
                ? webRequest.getParameter("querynom") : "";
        final String prenom = nom;
        final String statut = webRequest.getParameter("querystatut") != null
                && !webRequest.getParameter("querystatut").equals("")
                        ? webRequest.getParameter("querystatut") : "";

        // POur la date
        final String dateDebuString = webRequest.getParameter("querydatedebut") != null
                ? webRequest.getParameter("querydatedebut")
                : "";
        final String dateFinString = webRequest.getParameter("querydatefin") != null
                ? webRequest.getParameter("querydatefin")
                : "";
        final Integer page = webRequest.getParameter("page") != null
                ? Integer.valueOf(webRequest.getParameter("page")) : 0;
        final Integer size = webRequest.getParameter("size") != null
                ? Integer.valueOf(webRequest.getParameter("size")) : 20;

        dateDebut = parsedDateFrom(dateDebuString, "2010/01/01", dateFormatter);
        dateFin = parsedDateFrom(dateFinString, "2020/12/31", dateFormatter);

        final Page<Placement> resultPage = placementService.search(idEntreprise, nom, prenom, statut, dateDebut, dateFin, page, size);
        model.addAttribute("querydatedebut", dateDebuString);
        model.addAttribute("querydatefin", dateFinString);
        model.addAttribute("querynom", nom);
        model.addAttribute("querystatut", statut);
        model.addAttribute("queryentreprise", idEntreprise);
        model.addAttribute("page", page);
        model.addAttribute("Totalpage", resultPage.getTotalPages());
        model.addAttribute("size", size);
        model.addAttribute("placements", resultPage.getContent());
        return "placement/index";
    }

    @RequestMapping(value = "/{id}/affecter", method = RequestMethod.GET)
    public String affectAction(@PathVariable("id") final Long id, final ModelMap model)
    {
        final JobSeeker jobSeeker = jobSeekerService.findOne(id);
        Placement placement = new Placement();
        placement.setJobSeeker(jobSeeker);
        model.addAttribute("placement", placement);
        model.addAttribute("jobSeeker", jobSeeker);
        return "placement/affect";
    }

    @RequestMapping(value = "/{id}/create", method = RequestMethod.POST)
    public String createAction(@PathVariable("id") final Long id, @Valid Placement placement,
            final BindingResult result, final ModelMap model,
            final RedirectAttributes redirectAttributes)
    {
        placement.setJobSeeker(jobSeekerService.findOne(id));
        if (result.hasErrors() || placement.getEntreprise().getId() == null)
        {
            model.addAttribute("error", "error");
            model.addAttribute("placement", placement);
            return "placement/affect";
        }
        else
        {
            redirectAttributes.addFlashAttribute("info", "alert.success.new");
            placement.setJobSeeker(jobSeekerService.findOne(id));
            placementService.create(placement);
            return "redirect:/placement/" + placement.getId() + "/show";

        }

    }

    @RequestMapping(value = "{id}/edit", method = RequestMethod.GET)
    public String editAction(@PathVariable("id") final Long id,
            final ModelMap model)
    {
        final Placement placement = placementService.findOne(id);
        final Entreprise entreprise = entrepriseService.findOne(placement.getEntreprise().getId());
        final JobSeeker jobSeeker = jobSeekerService.findOne(placement.getJobSeeker().getId());
        placement.setEntreprise(entreprise);
        placement.setJobSeeker(jobSeeker);
        model.addAttribute("placement", placement);
        return "placement/edit";
    }

    @RequestMapping(value = "/{id}-{js}/update", method = RequestMethod.POST)
    public String updateAction(final ModelMap model, @PathVariable("id") final Long id,
            @PathVariable("js") final Long js,
            @Valid final Placement placement, final BindingResult result,
            final RedirectAttributes redirectAttributes)
    {
        final JobSeeker jobSeeker = jobSeekerService.findOne(js);
        placement.setJobSeeker(jobSeeker);
        if (result.hasErrors() || placement.getEntreprise().getId() == null)
        {
            System.out.println("il ya eu erreur de modification");
            model.addAttribute("placement", placement);
            model.addAttribute("error", "error");
            return "placement/edit";
        }
        else
        {
            redirectAttributes.addFlashAttribute("info", "alert.success.new");
            placementService.update(placement);
            return "redirect:/placement/" + placement.getId() + "/show";
        }
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String deleteAction(final Placement placement, final ModelMap model)
    {
        Placement placementToDelete = placementService.findOne(placement.getId());
        placementService.delete(placementToDelete);
        return "redirect:/placement/";
    }

    @ModelAttribute("entreprises")
    public Map<Long, String> populateMaterielFields()
    {
        final Map<Long, String> results = new HashMap<>();
        final List<Entreprise> entreprises = entrepriseService.findAll();
        for (Entreprise entreprise : entreprises)
        {
            results.put(entreprise.getId(), entreprise.getNom() + " - " + entreprise.getAdresse());
        }
        return results;
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
                Logger.getLogger(PlacementController.class.getName()).log(Level.SEVERE, null, ex1);
            }
        }
        return result;
    }
}
