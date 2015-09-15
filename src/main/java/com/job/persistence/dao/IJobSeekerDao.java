package com.job.persistence.dao;

import com.job.persistence.model.JobSeeker;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/**
 *
 * @author Brice GUEMKAM <briceguemkam@gmail.com & (+237) 651-732-978>
 */
public interface IJobSeekerDao
        extends JpaSpecificationExecutor<JobSeeker>,
        JpaRepository<JobSeeker, Long>
{

    @Query("SELECT J FROM JobSeeker J WHERE J.nom LIKE :nom or J.prenom LIKE :nom")
    Page<JobSeeker> findByNom(@Param("nom") String nom, Pageable pageable);

    @Query("SELECT j FROM JobSeeker j WHERE j.nom LIKE :nom or j.prenom LIKE :nom AND j.numero LIKE :numero")
    Page<JobSeeker> findIt(@Param("nom") String nom,
            @Param("numero") String numero,
            Pageable pageable);

    @Query("SELECT j FROM JobSeeker j join j.secteursDemploi s WHERE j.nom LIKE :nom AND j.prenom LIKE :prenom"
            + " AND j.numero LIKE :numero AND s.id=:secteur AND j.statut LIKE :statut")
    Page<JobSeeker> searchJobSeeker(@Param("nom") String nom, @Param("prenom") String prenom,
            @Param("numero") String numero, @Param("secteur") long secteur,
            @Param("statut") String statut,
            Pageable pageable);

    @Query("SELECT j FROM JobSeeker j WHERE j.nom LIKE :nom AND j.prenom LIKE :prenom AND j.numero LIKE :numero AND j.statut LIKE :statut")
    Page<JobSeeker> searchJobSeeker(@Param("nom") String nom, @Param("prenom") String prenom,
            @Param("numero") String numero,
            @Param("statut") String statut,
            Pageable pageable);

}
