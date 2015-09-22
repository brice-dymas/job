/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.job.persistence.service.impl;

import com.job.persistence.dao.IEntrepriseDao;
import com.job.persistence.dao.IJobSeekerDao;
import com.job.persistence.dao.IStageDao;
import com.job.persistence.model.Entreprise;
import com.job.persistence.model.JobSeeker;
import com.job.persistence.model.Stage;
import com.job.persistence.service.IStageService;
import com.job.persistence.service.common.AbstractService;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Service;

/**
 *
 * @author Brice GUEMKAM <briceguemkam@gmail.com>
 */
@Service("stageService")
public class StageService extends AbstractService<Stage> implements IStageService
{

    @Autowired
    IStageDao stageDao;

    @Autowired
    IEntrepriseDao entrepriseDao;
    @Autowired
    IJobSeekerDao jobSeekerDao;

    @Override
    protected PagingAndSortingRepository<Stage, Long> getDao()
    {
        return stageDao;
    }

    @Override
    public Stage create(Stage stage)
    {
        final Entreprise entreprise = entrepriseDao.findOne(stage.getEntreprise().getId());
        final JobSeeker jobSeeker = jobSeekerDao.findOne(stage.getJobSeeker().getId());
        if (stage.getDateFin().after(new Date()))
        {
            jobSeeker.setStatut("Indisponible");
            jobSeekerDao.save(jobSeeker);
        }
        stage.setJobSeeker(jobSeeker);
        stage.setEntreprise(entreprise);
        return stageDao.save(stage);
    }

    @Override
    public Stage update(Stage stage)
    {
        final Entreprise entreprise = entrepriseDao.findOne(stage.getEntreprise().getId());
        final JobSeeker jobSeeker = jobSeekerDao.findOne(stage.getJobSeeker().getId());
        final Stage toUpdate = stageDao.findOne(stage.getId());
        toUpdate.setEntreprise(entreprise);
        toUpdate.setJobSeeker(jobSeeker);
        toUpdate.setDateDebut(stage.getDateDebut());
        toUpdate.setDateFin(stage.getDateFin());
        toUpdate.setObservation(stage.getObservation());
        toUpdate.setStatut(stage.getStatut());
        toUpdate.setTauxHoraire(stage.getTauxHoraire());
        toUpdate.setNombreDheureParJour(stage.getNombreDheureParJour());
        if (stage.getDateFin().after(new Date()))
        {
            jobSeeker.setStatut("Indisponible");
            jobSeekerDao.save(jobSeeker);
        }
        else
        {
            jobSeeker.setStatut("Disponible");
            jobSeekerDao.save(jobSeeker);
        }
        stage.setJobSeeker(jobSeeker);
        stage.setEntreprise(entreprise);
        return stageDao.save(stage);
    }

    @Override
    public Page<Stage> search(long idEntreprise, String nomChercheur, String prenomChercheur, String statut, Date dateDebut, Date dateFin, int page, Integer size)
    {
        String param = "idEntre=" + idEntreprise + " nom=" + nomChercheur + " statut=" + statut + " dateDebut=" + dateDebut + " dateFin=" + dateFin;
        System.out.println("dans la couche service voici les param \n" + param);
        if (idEntreprise == -1)
        {
            return stageDao.search("%" + nomChercheur + "%", "%" + statut + "%", dateDebut, dateFin, new PageRequest(page, size));
        }
        else
        {
            return stageDao.search(idEntreprise, "%" + nomChercheur + "%", "%" + statut + "%", dateDebut, dateFin, new PageRequest(page, size));
        }

    }

}
