/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.job.persistence.dao;

import com.job.persistence.model.Entreprise;
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
public interface IEntrepriseDao extends JpaRepository<Entreprise, Long>, JpaSpecificationExecutor<Entreprise>
{

    @Query("SELECT E FROM Entreprise E WHERE E.nom LIKE :nom")
    Page<Entreprise> findByNom(@Param("nom") String nom, Pageable pageable);

    @Query("SELECT E FROM Entreprise E WHERE E.nom LIKE :nom AND E.adresse LIKE :adresse")
    Page<Entreprise> search(@Param("nom") String nom, @Param("adresse") String adresse,
            Pageable pageable);
}
