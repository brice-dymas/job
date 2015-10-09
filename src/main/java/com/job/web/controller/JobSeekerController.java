package com.job.web.controller;

import com.job.persistence.dao.IJobSeekerDao;
import com.job.persistence.model.Contact;
import com.job.persistence.model.Entreprise;
import com.job.persistence.model.JobSeeker;
import com.job.persistence.model.Placement;
import com.job.persistence.model.Secteur;
import com.job.persistence.service.IContactService;
import com.job.persistence.service.IEntrepriseService;
import com.job.persistence.service.IJobSeekerService;
import com.job.persistence.service.IPlacementService;
import com.job.persistence.service.ISecteurService;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author Brice GUEMKAM <briceguemkam@gmail.com & (+237) 651-732-978>
 */
@Controller
@RequestMapping("/jobSeeker")
public class JobSeekerController
{

    @Autowired
    IEntrepriseService entrepriseService;

    @Autowired
    IJobSeekerDao dao;

    @Autowired
    IPlacementService placementService;

    @Autowired
    private ServletContext servletContext;

    @Autowired
    private ISecteurService secteurService;

    @Autowired
    private IJobSeekerService jobSeekerService;

    @Autowired
    private IContactService adresseService;

    @RequestMapping(value = "/{id}/show", method = RequestMethod.GET)
    public String ShowAction(@PathVariable("id") final Long id,
            final ModelMap model, final WebRequest webRequest)
    {

        Date dateDebut, dateFin;
        SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy/MM/dd");
        final Long idEntreprise = (webRequest.getParameter("queryentreprise") != null
                && !webRequest.getParameter("queryentreprise").equals(""))
                        ? Long.valueOf(webRequest.getParameter("queryentreprise"))
                        : -1;
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

        dateDebut = parsedDateFrom(dateDebuString, "2000/01/01", dateFormatter);
        dateFin = parsedDateFrom(dateFinString, "2090/12/31", dateFormatter);
        final JobSeeker jobSeeker = jobSeekerService.findOne(id);
        final Page<Placement> resultPage = placementService.filterbyJobSeekerID(id, idEntreprise, dateDebut, dateFin, page, size);

        model.addAttribute("querydatedebut", dateDebuString);
        model.addAttribute("querydatefin", dateFinString);
        model.addAttribute("queryentreprise", idEntreprise);
        model.addAttribute("jobSeeker", jobSeeker);
        model.addAttribute("page", page);
        model.addAttribute("Totalpage", resultPage.getTotalPages());
        model.addAttribute("size", size);
        model.addAttribute("placements", resultPage.getContent());
        return "jobSeeker/show";
    }

    /**
     *
     * @param model
     * @param webRequest
     * @return
     * @RequestMapping (value = "/", method = RequestMethod.GET) public String
     * indexAction(final ModelMap model, final WebRequest webRequest) { final
     * Integer page = webRequest.getParameter("page") != null ?
     * Integer.valueOf(webRequest.getParameter("page")) : 0; final Integer size
     * = webRequest.getParameter("size") != null ?
     * Integer.valueOf(webRequest.getParameter("size")) : 20;
     *
     * final Page<JobSeeker> resultPage = dao.findAll(new PageRequest(page,
     * size)); JobSeeker jobSeeker = new JobSeeker(); model.addAttribute("page",
     * page); model.addAttribute("placement", jobSeeker);
     * model.addAttribute("Totalpage", resultPage.getTotalPages());
     * model.addAttribute("size", size); model.addAttribute("jobSeekers",
     * resultPage.getContent()); return "jobSeeker/index"; }
     */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String indexAction(final ModelMap model, final WebRequest webRequest)
    {
        final long secteur = webRequest.getParameter("querysecteur") != null && !webRequest.getParameter("querysecteur").equals("")
                ? Long.valueOf(webRequest.getParameter("querysecteur"))
                : -1;
        final String nom = webRequest.getParameter("querynom") != null
                ? webRequest.getParameter("querynom")
                : "";
        final String prenom = webRequest.getParameter("queryprenom") != null
                ? webRequest.getParameter("queryprenom")
                : "";
        final String numero = webRequest.getParameter("querynumero") != null
                ? webRequest.getParameter("querynumero")
                : "";
        final String statut = webRequest.getParameter("querystatut") != null
                && !webRequest.getParameter("querystatut").equals("")
                        ? webRequest.getParameter("querystatut")
                        : "";
        final Integer page = webRequest.getParameter("page") != null
                ? Integer.valueOf(webRequest.getParameter("page"))
                : 0;
        final Integer size = webRequest.getParameter("size") != null
                ? Integer.valueOf(webRequest.getParameter("size"))
                : 20;

        Page<JobSeeker> resultPage = jobSeekerService.search(nom, prenom, numero, secteur, statut, page, size);
        model.addAttribute("querynom", nom);
        model.addAttribute("queryprenom", prenom);
        model.addAttribute("querynumero", numero);
        model.addAttribute("querysecteur", secteur);
        model.addAttribute("querystatut", statut);
        model.addAttribute("page", page);
        model.addAttribute("Totalpage", resultPage.getTotalPages());
        model.addAttribute("size", size);
        model.addAttribute("jobSeekers", resultPage.getContent());
        return "jobSeeker/index";
    }

    // write
    @RequestMapping(value = "/new", method = RequestMethod.GET)
    public String newAction(final ModelMap model)
    {
        JobSeeker job = new JobSeeker();
        job.getSecteursDemploi().add(new Secteur());
        job.getContacts().add(new Contact());
        model.addAttribute("jobSeeker", job);
        return "jobSeeker/new";
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String createAction(@Valid final JobSeeker jobSeeker,
            final BindingResult result, final ModelMap model,
            final RedirectAttributes redirectAttributes)
    {

        if (result.hasErrors())
        {
            model.addAttribute("error", "error");
            model.addAttribute("JobSeeker", jobSeeker);
            return "jobSeeker/new";
        }
        else
        {
            try
            {
                processData(jobSeeker);
            }
            catch (IllegalStateException |
                    IOException e)
            {
                System.out.println(e.getMessage());
            }
            redirectAttributes.addFlashAttribute("info", "alert.success.new");
            jobSeekerService.create(jobSeeker);
            return "redirect:/jobSeeker/" + jobSeeker.getId() + "/show";
        }

    }

    @RequestMapping(value = "{id}/edit", method = RequestMethod.GET)
    public String editAction(@PathVariable("id") final Long id,
            final ModelMap model)
    {
        final JobSeeker jobSeeker = jobSeekerService.findOne(id);
        model.addAttribute("jobSeeker", jobSeeker);
        return "jobSeeker/edit";
    }

    @RequestMapping(value = "/{id}/update", method = RequestMethod.POST)
    public String updateAction(@Valid final JobSeeker jobSeeker,
            @PathVariable("id") final Long id, final BindingResult result,
            final ModelMap model, final RedirectAttributes redirectAttributes)
    {
        if (result.hasErrors())
        {
            model.addAttribute("error", "error");
            model.addAttribute("jobSeeker", jobSeeker);
            return "jobSeeker/edit";
        }
        else
        {
            try
            {
                processData(jobSeeker);
            }
            catch (IllegalStateException |
                    IOException e)
            {
                System.out.println(e.getMessage());
            }
            redirectAttributes.addFlashAttribute("info", "alert.success.new");
            jobSeekerService.update(jobSeeker);
            return "redirect:/jobSeeker/" + jobSeeker.getId() + "/show";
        }
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String deleteAction(final JobSeeker jobSeeker, final ModelMap model)
    {
        jobSeekerService.deleteById(jobSeeker.getId());
        return "redirect:/jobSeeker/";
    }

    @ModelAttribute("secteurs")
    public Map<Long, String> populateSecteurDactiviteFields()
    {
        final Map<Long, String> results = new HashMap<>();
        final List<Secteur> secteurs = secteurService.findAll();
        for (Secteur secteur : secteurs)
        {
            results.put(secteur.getId(), secteur.getLibelle());
        }
        return results;
    }

    private void processData(JobSeeker jobSeeker)
            throws IllegalStateException,
            IOException
    {
        MultipartFile file = jobSeeker.getCvData();
        jobSeeker.setCv(file.getOriginalFilename());
        System.out.println(jobSeeker.getCv());
        processFileData(file, "documents");

        file = jobSeeker.getChequeData();
        jobSeeker.setCheque(file.getOriginalFilename());
        System.out.println(jobSeeker.getCheque());
        processFileData(file, "documents");
    }

    private String getSavedFileName(MultipartFile file, String uploadDir)
    {
        String webappRoot = servletContext.getRealPath("/");
        String relativeFolder = File.separator + "resources" + File.separator + "bootstrap" + File.separator
                + uploadDir + File.separator;
        String filename = webappRoot + relativeFolder + file.getOriginalFilename();
        System.out.println(filename);
        return filename;
    }

    private void processFileData(MultipartFile file, String uploadDir)
            throws IllegalStateException,
            IOException
    {

        String filename = getSavedFileName(file, uploadDir);
        file.transferTo(new File(filename));

    }

    public Page<JobSeeker> filterBySecteur(Page<JobSeeker> elementtToFindIn,
            String param)
    {
        List<JobSeeker> jobSeekers = new ArrayList<>();
        for (JobSeeker content : elementtToFindIn.getContent())
        {
            for (Secteur s : content.getSecteursDemploi())
            {
                if (s.getLibelle().equalsIgnoreCase(param))
                {
                    jobSeekers.add(content);
                }
            }
        }
        return new PageImpl<>(jobSeekers);
    }

    @ModelAttribute("LesStatuts")
    public Map<Long, String> populateStatusField()
    {
        Map<Long, String> statuts = new HashMap<>();
        statuts.put(1L, "Disponible");
        statuts.put(2L, "Deja Place");
        return statuts;
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
