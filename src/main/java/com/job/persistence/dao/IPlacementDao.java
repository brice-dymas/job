/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.job.persistence.dao;

import com.job.persistence.model.Placement;
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
public interface IPlacementDao extends JpaRepository<Placement, Long>, JpaSpecificationExecutor<Placement>
{

    // This works!
    @Query("SELECT S FROM Placement S JOIN S.entreprise E WHERE E.id=:idEntreprise "
            + " AND S.jobSeeker.nom LIKE :nom AND S.statut LIKE :statut "
            + " AND S.dateDebut BETWEEN :dateDebut  AND :dateFin ")
    Page<Placement> search(@Param("idEntreprise") long idEntreprise,
            @Param("nom") String nomChercheur,
            @Param("statut") String statut, @Param("dateDebut") Date dateDebut,
            @Param("dateFin") Date dateFin, Pageable pageable);

    @Query("SELECT P FROM Placement P JOIN P.entreprise E WHERE P.jobSeeker.id=:id "
            + " AND E.id=:idEntreprise AND P.dateDebut BETWEEN :dateDebut  AND :dateFin")
    Page<Placement> filterbyJobSeekerID(@Param("id") final long id, @Param("idEntreprise") final long idEntreprise,
            @Param("dateDebut") Date dateDebut, @Param("dateFin") Date dateFin, Pageable pagable);

    @Query("SELECT P FROM Placement P JOIN P.jobSeeker J WHERE J.id=:id "
            + " AND P.dateDebut BETWEEN :dateDebut  AND :dateFin")
    Page<Placement> filterbyJobSeekerID(@Param("id") final long id, @Param("dateDebut") Date dateDebut,
            @Param("dateFin") Date dateFin, Pageable pagable);

    @Query("SELECT P FROM Placement P JOIN P.jobSeeker J WHERE P.entreprise.id=:id "
            + " AND J.nom LIKE :nom AND P.statut LIKE :statut"
            + " AND P.dateDebut BETWEEN :dateDebut  AND :dateFin")
    Page<Placement> filterbyEntrepriseID(@Param("id") final long id, @Param("nom") String nomChercheur,
            @Param("statut") String statut, @Param("dateDebut") Date dateDebut,
            @Param("dateFin") Date dateFin, Pageable pagable);

    // This works!
    @Query("SELECT S FROM Placement S WHERE S.jobSeeker.nom LIKE :nom "
            + " AND S.statut LIKE :statut  "
            + " AND S.dateDebut BETWEEN :dateDebut  AND :dateFin")
    Page<Placement> search(@Param("nom") String nomChercheur,
            @Param("statut") String statut, @Param("dateDebut") Date dateDebut,
            @Param("dateFin") Date dateFin, Pageable pageable);
}
