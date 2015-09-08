package com.job.persistence.service.impl;

import com.google.common.collect.Lists;
import com.job.persistence.dao.IAdresseDao;
import com.job.persistence.model.Contact;
import com.job.persistence.service.IContactService;
import com.job.persistence.service.common.AbstractService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Brice GUEMKAM <briceguemkam@gmail.com & (+237) 651-732-978>
 */
@Service("adresseService")
@Transactional
public class ContactService
        extends AbstractService<Contact>
        implements IContactService
{

    @Autowired
    IAdresseDao adresseDao;

    @Override
    protected PagingAndSortingRepository<Contact, Long> getDao()
    {
        return adresseDao;
    }

    @Override
    public List<Contact> findAll()
    {
        return Lists.newArrayList(getDao().findAll());
    }

//
    @Override
    public Contact update(Contact entity)
    {
        Contact toUpdate = adresseDao.findOne(entity.getId());
        toUpdate.setAdresse(entity.getAdresse());
        toUpdate.setAdresse(entity.getAdresse());
        toUpdate.setTypeAdresse(entity.getTypeAdresse());
        return adresseDao.save(toUpdate);
    }

}
