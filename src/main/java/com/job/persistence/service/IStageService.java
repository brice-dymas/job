/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.job.persistence.service;

import com.job.persistence.IOperations;
import com.job.persistence.model.Stage;
import java.util.Date;
import org.springframework.data.domain.Page;

/**
 *
 * @author Brice GUEMKAM <briceguemkam@gmail.com>
 */
public interface IStageService extends IOperations<Stage>
{

    Page<Stage> search(long idEntreprise,
            String nomChercheur, String prenomChercheur, String statut,
            Date dateDebut, Date dateFin, int page, Integer size);
}
