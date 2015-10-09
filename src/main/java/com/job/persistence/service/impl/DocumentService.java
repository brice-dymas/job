/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.job.persistence.service.impl;

import com.job.persistence.dao.IDocumentDao;
import com.job.persistence.model.Document;
import com.job.persistence.service.IDocumentService;
import com.job.persistence.service.common.AbstractService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Service;

/**
 *
 * @author Brice GUEMKAM <briceguemkam@gmail.com>
 */
@Service("documentService")
public class DocumentService extends AbstractService<Document> implements IDocumentService
{

    @Autowired
    IDocumentDao documentDao;

    @Override
    protected PagingAndSortingRepository<Document, Long> getDao()
    {
        return documentDao;
    }

}
