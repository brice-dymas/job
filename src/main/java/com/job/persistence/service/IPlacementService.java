/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.job.persistence.service;

import com.job.persistence.IOperations;
import com.job.persistence.model.Placement;
import java.util.Date;
import org.springframework.data.domain.Page;

/**
 *
 * @author Brice GUEMKAM <briceguemkam@gmail.com>
 */
public interface IPlacementService extends IOperations<Placement>
{

    Page<Placement> search(long idEntreprise,
            String nomChercheur, String prenomChercheur, String statut,
            Date dateDebut, Date dateFin, int page, Integer size);

    Page<Placement> filterbyJobSeekerID(final long id, long idEntreprise,
            Date dateDebut, Date dateFin, int page, Integer size);

    Page<Placement> filterbyEntrepriseID(final long id, String nomChercheur,
            String statut, int page, Integer size);
}
