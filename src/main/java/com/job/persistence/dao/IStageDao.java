/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.job.persistence.dao;

import com.job.persistence.model.Stage;
import java.util.Date;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/**
 *
 * @author Brice GUEMKAM <briceguemkam@gmail.com>
 */
public interface IStageDao extends JpaRepository<Stage, Long>, JpaSpecificationExecutor<Stage>
{

    // This works!
    @Query("SELECT S FROM Stage S JOIN S.entreprise E WHERE E.id=:idEntreprise "
            + " AND S.jobSeeker.nom LIKE :nom AND S.statut LIKE :statut"
            + " AND S.dateDebut >= :dateDebut AND S.dateDebut <= :dateFin")
    Page<Stage> search(@Param("idEntreprise") long idEntreprise,
            @Param("nom") String nomChercheur,
            @Param("statut") String statut, @Param("dateDebut") Date dateDebut,
            @Param("dateFin") Date dateFin, Pageable pageable);

    // This works!
    @Query("SELECT S FROM Stage S WHERE S.jobSeeker.nom LIKE :nom "
            + " AND S.statut LIKE :statut AND S.dateDebut >= :dateDebut "
            + " AND S.dateDebut <= :dateFin")
    Page<Stage> search(@Param("nom") String nomChercheur,
            @Param("statut") String statut, @Param("dateDebut") Date dateDebut,
            @Param("dateFin") Date dateFin, Pageable pageable);
}
