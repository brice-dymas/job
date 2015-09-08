package com.job.persistence.service;

import com.job.persistence.IOperations;
import com.job.persistence.model.Secteur;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

;

/**
 *
 * @author Brice GUEMKAM <briceguemkam@gmail.com & (+237) 651-732-978>
 */
public interface ISecteurService
        extends IOperations<Secteur>
{

    Secteur retrieveByName(String libelle);
    Page<Secteur> findByName(String libelle, PageRequest pageRequest);
}
