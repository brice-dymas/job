package com.job.web.controller;

import com.job.persistence.dao.IJobSeekerDao;
import com.job.persistence.model.Contact;
import com.job.persistence.model.JobSeeker;
import com.job.persistence.model.Secteur;
import com.job.persistence.service.IContactService;
import com.job.persistence.service.IJobSeekerService;
import com.job.persistence.service.ISecteurService;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import javax.servlet.ServletContext;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
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

    public TreeMap<String, String> getBreadcrumb()
    {
        final TreeMap<String, String> breadcrumb = new TreeMap<String, String>();
        breadcrumb.put("breadcrumb.jobSeeker.index", "/job/jobSeeker/");
        return breadcrumb;
    }

    @Autowired
    IJobSeekerDao dao;

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
            final ModelMap model)
    {
        final JobSeeker jobSeeker = jobSeekerService.findOne(id);
        model.addAttribute("jobSeeker", jobSeeker);
        final TreeMap<String, String> breadcrumb = getBreadcrumb();
        breadcrumb.put("breadcrumb.jobSeeker.show", "");
        model.addAttribute("breadcrumbs", breadcrumb);
        return "jobSeeker/show";
    }

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String indexAction(final ModelMap model, final WebRequest webRequest)
    {

        final Integer page = webRequest.getParameter("page") != null
                             ? Integer.valueOf(webRequest.getParameter("page"))
                             : 0;
        final Integer size = webRequest.getParameter("size") != null
                             ? Integer.valueOf(webRequest.getParameter("size"))
                             : 20;

        final Page<JobSeeker> resultPage = dao.findAll(new PageRequest(page, size));

        final TreeMap<String, String> breadcrumb = getBreadcrumb();
        breadcrumb.put("breadcrumb.jobSeeker.index", "");
        model.addAttribute("breadcrumbs", breadcrumb);

        model.addAttribute("page", page);
        model.addAttribute("Totalpage", resultPage.getTotalPages());
        model.addAttribute("size", size);
        model.addAttribute("jobSeekers", resultPage.getContent());
        return "jobSeeker/index";
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String searchAction(final ModelMap model, final WebRequest webRequest)
    {
        System.out.println("dans search.jsp");

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
        final Integer page = webRequest.getParameter("page") != null
                             ? Integer.valueOf(webRequest.getParameter("page"))
                             : 0;
        final Integer size = webRequest.getParameter("size") != null
                             ? Integer.valueOf(webRequest.getParameter("size"))
                             : 20;

        System.out.println("Les parametres de recherche sont nom=" + nom + " secteur=" + secteur + " numéro=" + numero + " size=" + size);
        //Page<JobSeeker> resultPage = dao.findAll(new PageRequest(page, size));
         Page<JobSeeker> resultPage = jobSeekerService.search(nom, prenom, numero, secteur, page, size);
        System.out.println("taille resultPage is empty ? = " + resultPage.getContent().isEmpty());

//        List<JobSeeker> jobSeekers = new ArrayList<>();
//        if (nom.length() > 0 && secteur.length() > 0)
//        {
//            System.out.println("les deux parametres existent");
//            resultPage = dao.findIt("%" + nom + "%", "%" + numero + "%", new PageRequest(page, size));
//            resultPage = filterBySecteur(resultPage, secteur);
//        }
//        else
//        {
//            System.out.println("un seul parametre est donné");
//            if (secteur.length() > 0)
//            {
//                resultPage = filterBySecteur(resultPage, secteur);
//            }
//            if (nom.length() > 0 | numero.length() > 0)
//            {
//                resultPage = dao.findIt("%" + nom + "%", "%" + numero + "%", new PageRequest(page, size));
//            }
//        }

        final TreeMap<String, String> breadcrumb = getBreadcrumb();
        breadcrumb.put("breadcrumb.jobSeeker.index", "");
        model.addAttribute("breadcrumbs", breadcrumb);

        model.addAttribute("querynom", nom);
        model.addAttribute("queryprenom", prenom);
        model.addAttribute("querynumero", numero);
        model.addAttribute("querysecteur", secteur);
        model.addAttribute("page", page);
        model.addAttribute("Totalpage", resultPage.getTotalPages());
        model.addAttribute("size", size);
        model.addAttribute("jobSeekers", resultPage.getContent());
        return "jobSeeker/search";
    }

    // write
    @RequestMapping(value = "/new", method = RequestMethod.GET)
    public String newAction(final ModelMap model)
    {
        JobSeeker job = new JobSeeker();
        job.getSecteursDemploi().add(new Secteur());
        job.getContacts().add(new Contact());
        model.addAttribute("jobSeeker", job);
        final TreeMap<String, String> breadcrumb = getBreadcrumb();
        breadcrumb.put("breadcrumb.jobSeeker.new", "");
        model.addAttribute("breadcrumbs", breadcrumb);
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
        final TreeMap<String, String> breadcrumb = getBreadcrumb();
        breadcrumb.put("breadcrumb.jobSeeker.edit", "");
        model.addAttribute("breadcrumbs", breadcrumb);
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
}
