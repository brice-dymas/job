/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.job.persistence.service.impl;

import com.job.persistence.dao.ITypeDocumentDao;
import com.job.persistence.model.TypeDocument;
import com.job.persistence.service.ITypeDocumentService;
import com.job.persistence.service.common.AbstractService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Service;

/**
 *
 * @author Brice GUEMKAM <briceguemkam@gmail.com>
 */
@Service("typeDocumentService")
public class TypeDocumentService extends AbstractService<TypeDocument> implements ITypeDocumentService
{

    @Autowired
    ITypeDocumentDao typeDocumentDao;

    @Override
    protected PagingAndSortingRepository<TypeDocument, Long> getDao()
    {
        return typeDocumentDao;
    }

    @Override
    public TypeDocument update(TypeDocument entity)
    {
        final TypeDocument typeDocument = typeDocumentDao.findOne(entity.getId());
        typeDocument.setNom(entity.getNom());
        return typeDocumentDao.save(typeDocument);
    }

}
