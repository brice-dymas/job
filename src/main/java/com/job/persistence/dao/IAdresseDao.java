package com.job.persistence.dao;

import com.job.persistence.model.Contact;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 *
 * @author Brice GUEMKAM <briceguemkam@gmail.com & (+237) 651-732-978>
 */
public interface IAdresseDao
        extends JpaRepository<Contact, Long>,
                JpaSpecificationExecutor<Contact>
{

//    @Query("SELECT a FROM Adresse a WHERE a.email LIKE :email")
//    List<Contact> retrieveByEmail(@Param("email") String email);
//    @Query("SELECT a FROM Contact a WHERE a.email LIKE :email")
//    List<Adresse> retrieveByJobSeeker(@Param("email") String email);
}
