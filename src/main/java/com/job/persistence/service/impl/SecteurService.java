package com.job.persistence.service.impl;

import com.job.persistence.dao.ISecteurDao;
import com.job.persistence.model.Secteur;
import com.job.persistence.service.ISecteurService;
import com.job.persistence.service.common.AbstractService;
import com.google.common.collect.Lists;
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
@Service("secteurService")
public class SecteurService
        extends AbstractService<Secteur>
        implements ISecteurService
{

    @Autowired
    ISecteurDao secteurDao;

    public SecteurService()
    {
        super();
    }

    @Override
    public Secteur retrieveByName(String libelle)
    {
        return secteurDao.retrieveByName(libelle);
    }

    @Override
    protected PagingAndSortingRepository<Secteur, Long> getDao()
    {
        return secteurDao;
    }

    @Override
    public Secteur create(Secteur entity)
    {
        return secteurDao.save(entity);
    }

    @Override
    public List<Secteur> findAll()
    {
        return Lists.newArrayList(getDao().findAll());
    }

    @Override
    public Secteur findOne(long id)
    {
        return super.findOne(id);
    }

    @Override
    public Secteur update(Secteur entity)
    {
        Secteur toUpdate = secteurDao.findOne(entity.getId());
        toUpdate.setLibelle(entity.getLibelle());
        return toUpdate;
    }

    @Override
    public Page<Secteur> findByName(String libelle, PageRequest pageRequest) {
        if("".equals(libelle)){
            System.out.println("ici");
         return super.findPaginated(pageRequest.getPageNumber(), pageRequest.getPageSize());
        }else{
            System.out.println("ici");
        return secteurDao.findByName(libelle, pageRequest);
        }
    }

}
