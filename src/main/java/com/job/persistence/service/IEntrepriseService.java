/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.job.persistence.service;

import com.job.persistence.IOperations;
import com.job.persistence.model.Entreprise;
import org.springframework.data.domain.Page;

/**
 *
 * @author Brice GUEMKAM <briceguemkam@gmail.com>
 */
public interface IEntrepriseService extends IOperations<Entreprise>
{

    public Page<Entreprise> findByNom(String nom, int page, Integer size);

    public Page<Entreprise> search(String nom, String adresse, int page, Integer size);
}
