package com.job.persistence.service.impl;

import com.job.persistence.dao.IAdresseDao;
import com.job.persistence.dao.IJobSeekerDao;
import com.job.persistence.dao.ISecteurDao;
import com.job.persistence.model.Contact;
import com.job.persistence.model.JobSeeker;
import com.job.persistence.model.Secteur;
import com.job.persistence.service.IJobSeekerService;
import com.job.persistence.service.common.AbstractService;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Service;

/**
 *
 * @author Brice GUEMKAM <briceguemkam@gmail.com & (+237) 651-732-978>
 */
@Service("jobSeekerService")
public class JobSeekerService
        extends AbstractService<JobSeeker>
        implements IJobSeekerService
{

    @Autowired
    IJobSeekerDao dao;

    @Autowired
    IAdresseDao adresseDao;

    @Autowired
    ISecteurDao secteurDao;

    @Override
    public Page<JobSeeker> findByNom(String nom, int page, Integer size)
    {
        if (nom.length() <= 0)
        {
            return dao.findAll(new PageRequest(page, size));
        }
        else
        {
            System.out.println("ici daoJob param=" + nom);
            return dao.findByNom("%" + nom + "%", new PageRequest(page, size));
        }

    }

    @Override
    public Page<JobSeeker> findIt(String nomJobSeeker, String numeroJobSeeker,
            int page, Integer size)
    {
        return dao.findIt(nomJobSeeker, numeroJobSeeker, new PageRequest(page, size));
    }

    @Override
    public Page<JobSeeker> search(String nomJobSeeker, String prenomJobSeeker, String numeroJobSeeker,
            long secteur, String statut, int page, Integer size)
    {
        if (secteur == -1)
        {
            return dao.searchJobSeeker("%" + nomJobSeeker + "%", "%" + prenomJobSeeker + "%", "%" + numeroJobSeeker + "%", statut + "%", new PageRequest(page, size));
        }
        else
        {
            return dao.searchJobSeeker("%" + nomJobSeeker + "%", "%" + prenomJobSeeker + "%", "%" + numeroJobSeeker + "%", secteur, statut + "%", new PageRequest(page, size));
        }
    }

    @Override
    public Page<JobSeeker> findPaginated(String query, int i, Integer size)
    {
        if (query == null)
        {
            System.out.println("Query = " + query);
            return super.findPaginated(i, size);
        }
        else
        {
            System.out.println("Not null Query = " + query);
            return dao.findByNom('%' + query + '%', new PageRequest(i, size));
        }
    }

    @Override
    public JobSeeker create(JobSeeker entity)
    {
        List<Contact> adresses = entity.getContacts();
        List<Contact> createAdresses = new ArrayList<>();
        List<Secteur> secteurs = new ArrayList();
        if (entity.getSecteursDemploi().size() > 0)
        {
            for (Secteur secteur : entity.getSecteursDemploi())
            {
                secteurs.add(secteurDao.findOne(secteur.getId()));
            }
        }
        entity.setSecteursDemploi(secteurs);
        if (adresses.size() > 0)
        {
            for (Contact adresse : adresses)
            {
                adresseDao.save(adresse);
                createAdresses.add(adresse);
            }
        }
        entity.setContacts(createAdresses);

        String timeString = String.valueOf(new Date().getTime());
        String numero = entity.getNom().substring(0, 3);
        numero += entity.getPrenom().substring(0, 1);
        numero += timeString.substring(timeString.length() - 4, timeString.length());
        entity.setNumero(numero.toUpperCase());

        return dao.save(entity);
    }

    /**
     * *
     * @param nomJobSeeker
     * @param nomSecteurDactivite
     * @param page
     * @param size
     * <p>
     * @return
     * <p>
     * @Override public Page<JobSeeker> findWithSecteurDactivite(String
     * nomJobSeeker, String nomSecteurDactivite, int page, Integer size) {
     * List<Secteur> secteurs = secteurDao.findAll(); List<JobSeeker> maListe =
     * dao.findAll(); Page<JobSeeker> jobSeekers; jobSeekers = new
     * PageImpl(maListe); jobSeekers.getContent().removeAll(maListe);
     * <p>
     * for (JobSeeker jobSeeker : maListe) { if
     * (jobSeeker.getNom().contains(nomJobSeeker)) { for (Secteur secteur :
     * jobSeeker.getSecteursDemploi()) { if
     * (secteur.getLibelle().equalsIgnoreCase(nomSecteurDactivite)) {
     * jobSeekers.getContent().add(jobSeeker); } } } } return jobSeekers;
     * <p>
     * }
     *
     */
    @Override
    public Page<JobSeeker> findWithSecteurDactivite(String nomJobSeeker,
            String nomSecteurDactivite, int page, Integer size)
    {
        return dao.findByNom(nomJobSeeker, new PageRequest(page, size));
    }

    @Override
    public JobSeeker findWithoutAdress(long id)
    {
        return null;
    }

    @Override
    public JobSeeker update(JobSeeker entity)
    {
        return super.update(entity);
    }

    @Override
    protected PagingAndSortingRepository<JobSeeker, Long> getDao()
    {
        return dao;
    }

}
