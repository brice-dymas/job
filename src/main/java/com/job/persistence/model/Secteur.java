package com.job.persistence.model;

import java.io.Serializable;
import java.util.Objects;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import org.hibernate.validator.constraints.NotBlank;

/**
 *
 * @author Brice GUEMKAM <briceguemkam@gmail.com & (+237) 651-732-978>
 */
@Entity
public class Secteur
        implements Serializable
{

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    /**
     * *
     * Nom du secteur d'activité
     */
    @NotBlank(message = "{blank.message}")
    private String libelle;

    public Secteur()
    {
    }

    public Secteur(long id, String libelle)
    {
        this.id = id;
        this.libelle = libelle;
    }

    public long getId()
    {
        return id;
    }

    public void setId(long id)
    {
        this.id = id;
    }

    public String getLibelle()
    {
        return libelle;
    }

    public void setLibelle(String libelle)
    {
        this.libelle = libelle;
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
        final Secteur other = (Secteur) obj;
        if (this.id != other.id)
        {
            return false;
        }
        if (!Objects.equals(this.libelle, other.libelle))
        {
            return false;
        }
        return true;
    }

    @Override
    public int hashCode()
    {
        int hash = 5;
        hash = 67 * hash + (int) (this.id ^ (this.id >>> 32));
        hash = 67 * hash + Objects.hashCode(this.libelle);
        return hash;
    }

}
