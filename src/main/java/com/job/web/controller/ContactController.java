package com.job.web.controller;

import com.job.persistence.model.Contact;
import com.job.persistence.service.IContactService;
import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
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
@RequestMapping("/adresse")
public class ContactController
{

    @Autowired
    private IContactService adresseService;

    @RequestMapping(value = "/{id}/show", method = RequestMethod.GET)
    public String ShowAction(@PathVariable("id") final Long id, final ModelMap model)
    {
        final Contact adresse = adresseService.findOne(id);
        model.addAttribute("adresse", adresse);
        return "adresse/show";
    }

    @RequestMapping(method = RequestMethod.GET)
    public String indexAction(final ModelMap model, final WebRequest webRequest)
    {
        final List<Contact> adresses = adresseService.findAll();
        model.addAttribute("adresses", adresses);
        return "adresse/index";
    }

    // write
    @RequestMapping(value = "/new", method = RequestMethod.GET)
    public String newAction(final ModelMap model)
    {
        model.addAttribute("adresse", new Contact());
        return "adresse/new";
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String createAction(@Valid final Contact adresse,
            final BindingResult result, final ModelMap model,
            final RedirectAttributes redirectAttributes)
    {
        if (result.hasErrors())
        {
            model.addAttribute("error", "error");
            model.addAttribute("adresse", adresse);
            return "adresse/new";
        }
        else
        {
            redirectAttributes.addFlashAttribute("info", "alert.success.new");
            adresseService.create(adresse);
            return "redirect:/adresse/" + adresse.getId() + "/show";
        }

    }

    @RequestMapping(value = "{id}/edit", method = RequestMethod.GET)
    public String editAction(@PathVariable("id") final Long id, final ModelMap model)
    {
        final Contact adresse = adresseService.findOne(id);
        model.addAttribute("adresse", adresse);
        return "adresse/edit";
    }

    @RequestMapping(value = "/{id}/update", method = RequestMethod.POST)
    public String updateAction(@Valid final Contact adresse,
            @PathVariable("id") final Long id, final BindingResult result,
            final ModelMap model, final RedirectAttributes redirectAttributes)
    {
        if (result.hasErrors())
        {
            model.addAttribute("error", "error");
            model.addAttribute("adresse", adresse);
            return "adresse/edit";
        }
        else
        {
            redirectAttributes.addFlashAttribute("info", "alert.success.new");
            adresseService.update(adresse);
            return "redirect:/adresse/" + adresse.getId() + "/show";
        }
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String deleteAction(final Contact adresse, final ModelMap model)
    {
        adresseService.deleteById(adresse.getId());
        return "redirect:/adresse/";
    }

}
