package com.job.persistence.dao;

import com.job.persistence.model.Secteur;
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
public interface ISecteurDao
        extends JpaRepository<Secteur, Long>,
                JpaSpecificationExecutor<Secteur>
{

    @Query("SELECT s FROM Secteur s WHERE s.libelle = :libelle")
    Secteur retrieveByName(@Param("libelle") String libelle);
    
     @Query("SELECT s FROM Secteur s WHERE s.libelle LIKE :libelle")
    Page<Secteur> findByName(@Param("libelle") String libelle, Pageable pageable);
}
