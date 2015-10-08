/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.job.persistence.service.impl;

import com.job.persistence.dao.IEntrepriseDao;
import com.job.persistence.model.Entreprise;
import com.job.persistence.service.IEntrepriseService;
import com.job.persistence.service.common.AbstractService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Service;

/**
 *
 * @author Brice GUEMKAM <briceguemkam@gmail.com>
 */
@Service("entrepriseService")
public class EntrepriseService extends AbstractService<Entreprise> implements IEntrepriseService
{

    @Autowired
    IEntrepriseDao entrepriseDao;

    @Override
    protected PagingAndSortingRepository<Entreprise, Long> getDao()
    {
        return entrepriseDao;
    }

    @Override
    public Page<Entreprise> findByNom(String nom, int page, Integer size)
    {
        return entrepriseDao.findByNom(nom, new PageRequest(page, size));
    }

    @Override
    public Page<Entreprise> search(String nom, String adresse, int page, Integer size)
    {
        return entrepriseDao.search(nom, adresse, new PageRequest(page, size));
    }

    @Override
    public Entreprise update(Entreprise entity)
    {
        Entreprise entreprise = entrepriseDao.findOne(entity.getId());
        entreprise.setAdresse(entity.getAdresse());
        entreprise.setBoitePostale(entity.getBoitePostale());
        entreprise.setContact(entity.getContact());
        entreprise.setNom(entity.getNom());
        entreprise.setNumeroPersonneAContacter(entity.getNumeroPersonneAContacter());
        entreprise.setTelephone(entity.getTelephone());
        return entrepriseDao.save(entreprise);
    }

}
