/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.job.persistence.dao;

import com.job.persistence.model.TypeDocument;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 *
 * @author Brice GUEMKAM <briceguemkam@gmail.com>
 */
public interface ITypeDocumentDao extends JpaRepository<TypeDocument, Long>, JpaSpecificationExecutor<TypeDocument>
{

}
