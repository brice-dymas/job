/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.job.persistence.model;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author Brice GUEMKAM <briceguemkam@gmail.com>
 */
@Entity
//@NamedQueries({
//    @NamedQuery(name = "s",query = )
//})
public class Stage implements Serializable
{

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")

    private Date dateDebut;

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")

    private Date dateFin;

    @NotBlank(message = "{blank.message}")
    private String observation;

    @NotBlank(message = "{blank.message}")
    @Size(max = 255, min = 8, message = "Veuillez choisir un statut")
    private String statut;

    @ManyToOne(targetEntity = JobSeeker.class, optional = false)
    private JobSeeker jobSeeker;

    @ManyToOne(targetEntity = Entreprise.class, optional = false)
    private Entreprise entreprise;

    public Stage()
    {
    }

    public long getId()
    {
        return id;
    }

    public void setId(long id)
    {
        this.id = id;
    }

    public Date getDateDebut()
    {
        return dateDebut;
    }

    public void setDateDebut(Date dateDebut)
    {
        this.dateDebut = dateDebut;
    }

    public Date getDateFin()
    {
        return dateFin;
    }

    public void setDateFin(Date dateFin)
    {
        this.dateFin = dateFin;
    }

    public String getObservation()
    {
        return observation;
    }

    public void setObservation(String observation)
    {
        this.observation = observation;
    }

    public JobSeeker getJobSeeker()
    {
        return jobSeeker;
    }

    public void setJobSeeker(JobSeeker jobSeeker)
    {
        this.jobSeeker = jobSeeker;
    }

    public Entreprise getEntreprise()
    {
        return entreprise;
    }

    public void setEntreprise(Entreprise entreprise)
    {
        this.entreprise = entreprise;
    }

    public String getStatut()
    {
        return statut;
    }

    public void setStatut(String statut)
    {
        this.statut = statut;
    }

    @Override
    public int hashCode()
    {
        int hash = 5;
        hash = 17 * hash + (int) (this.id ^ (this.id >>> 32));
        hash = 17 * hash + Objects.hashCode(this.dateDebut);
        hash = 17 * hash + Objects.hashCode(this.dateFin);
        hash = 17 * hash + Objects.hashCode(this.observation);
        hash = 17 * hash + Objects.hashCode(this.jobSeeker);
        hash = 17 * hash + Objects.hashCode(this.entreprise);
        return hash;
    }

    @Override
    public boolean equals(Object obj)
    {
        if (obj == null)
        {
            return false;
        }
        if (getClass() != obj.getClass())
        {
            return false;
        }
        final Stage other = (Stage) obj;
        if (this.id != other.id)
        {
            return false;
        }
        if (!Objects.equals(this.dateDebut, other.dateDebut))
        {
            return false;
        }
        if (!Objects.equals(this.dateFin, other.dateFin))
        {
            return false;
        }
        if (!Objects.equals(this.observation, other.observation))
        {
            return false;
        }
        if (!Objects.equals(this.jobSeeker, other.jobSeeker))
        {
            return false;
        }
        if (!Objects.equals(this.entreprise, other.entreprise))
        {
            return false;
        }
        return true;
    }

}
