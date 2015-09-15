package com.job.persistence.service;

import com.job.persistence.IOperations;
import com.job.persistence.model.JobSeeker;
import org.springframework.data.domain.Page;

/**
 *
 * @author Brice GUEMKAM <briceguemkam@gmail.com & (+237) 651-732-978>
 */
public interface IJobSeekerService
        extends IOperations<JobSeeker>
{

    public Page<JobSeeker> findByNom(String nom, int i, Integer size);

    public Page<JobSeeker> findIt(String nomJobSeeker, String numeroJobSeeker,
            int page, Integer size);

    public JobSeeker findWithoutAdress(long id);

    Page<JobSeeker> findWithSecteurDactivite(String nomJobSeeker,
            String nomSecteurDactivite, int page, Integer size);

    public Page<JobSeeker> findPaginated(String query, int page, Integer size);

    public Page<JobSeeker> search(String nomJobSeeker, String prenomJobSeeker, String numeroJobSeeker,
            long secteur, String statut, int page, Integer size);

}
