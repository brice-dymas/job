package com.job.persistence.model;

import java.io.Serializable;
import java.util.Objects;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.AUTO;
import javax.persistence.Id;

/**
 *
 * @author Brice GUEMKAM <briceguemkam@gmail.com & (+237) 651-732-978>
 */
@Entity
public class Contact
        implements Serializable
{

    @Id
    @GeneratedValue(strategy = AUTO)
    private long id;

    private String adresse;

    private String typeAdresse;

    public Contact()
    {
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
        final Contact other = (Contact) obj;
        if (this.id != other.id)
        {
            return false;
        }
        if (!Objects.equals(this.adresse, other.adresse))
        {
            return false;
        }
        if (!Objects.equals(this.typeAdresse, other.typeAdresse))
        {
            return false;
        }
        return true;
    }

    public long getId()
    {
        return id;
    }

    public void setId(long id)
    {
        this.id = id;
    }

    public String getAdresse()
    {
        return adresse;
    }

    public void setAdresse(String adresse)
    {
        this.adresse = adresse;
    }

    public String getTypeAdresse()
    {
        return typeAdresse;
    }

    public void setTypeAdresse(String typeAdresse)
    {
        this.typeAdresse = typeAdresse;
    }

    @Override
    public int hashCode()
    {
        int hash = 7;
        hash = 89 * hash + (int) (this.id ^ (this.id >>> 32));
        hash = 89 * hash + Objects.hashCode(this.adresse);
        hash = 89 * hash + Objects.hashCode(this.typeAdresse);
        return hash;
    }

}
