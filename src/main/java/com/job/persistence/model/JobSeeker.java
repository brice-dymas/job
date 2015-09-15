package com.job.persistence.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import javax.persistence.Entity;
import static javax.persistence.FetchType.EAGER;
import static javax.persistence.FetchType.LAZY;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Transient;
import javax.validation.Valid;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

/**
 *
 * @author Brice GUEMKAM <briceguemkam@gmail.com & (+237) 651-732-978>
 */
@Entity
public class JobSeeker
        implements Serializable
{

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    protected Long id;

    @NotBlank(message = "{blank.message}")
    private String nom;

    private String numero;

    @NotBlank(message = "{blank.message}")
    private String prenom;

    @NotBlank(message = "{blank.message}")
    private String cni;

    @NotBlank(message = "{blank.message}")
    private String telephone;

    @Email
    private String email;

    private String cv;

    @Transient
    private CommonsMultipartFile cvData;

    private String cheque;

    @Transient
    private CommonsMultipartFile chequeData;

    @ManyToMany(targetEntity = Secteur.class, fetch = EAGER)
    private List<Secteur> secteursDemploi;

    @OneToMany(fetch = LAZY, targetEntity = Contact.class)
    @Valid
    private List<Contact> contacts;

    public JobSeeker()
    {

        this.secteursDemploi = new ArrayList<>();
        this.contacts = new ArrayList<>();
    }

    public String getNumero()
    {
        return numero;
    }

    public void setNumero(String numero)
    {
        this.numero = numero;
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
        final JobSeeker other = (JobSeeker) obj;
        if (!Objects.equals(this.id, other.id))
        {
            return false;
        }
        if (!Objects.equals(this.nom, other.nom))
        {
            return false;
        }
        if (!Objects.equals(this.prenom, other.prenom))
        {
            return false;
        }
        if (!Objects.equals(this.cni, other.cni))
        {
            return false;
        }
        return true;
    }

    public String getCheque()
    {
        return cheque;
    }

    public void setCheque(String cheque)
    {
        this.cheque = cheque;
    }

    public CommonsMultipartFile getChequeData()
    {
        return chequeData;
    }

    public void setChequeData(CommonsMultipartFile chequeData)
    {
        this.chequeData = chequeData;
    }

    public String getCni()
    {
        return cni;
    }

    public void setCni(String cni)
    {
        this.cni = cni;
    }

    public List<Contact> getContacts()
    {
        return contacts;
    }

    public void setContacts(List<Contact> contacts)
    {
        this.contacts = contacts;
    }

    public String getCv()
    {
        return cv;
    }

    public void setCv(String cv)
    {
        this.cv = cv;
    }

    public CommonsMultipartFile getCvData()
    {
        return cvData;
    }

    public void setCvData(CommonsMultipartFile cvData)
    {
        this.cvData = cvData;
    }

    public String getEmail()
    {
        return email;
    }

    public void setEmail(String email)
    {
        this.email = email;
    }

    public Long getId()
    {
        return id;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public String getNom()
    {
        return nom;
    }

    public void setNom(String nom)
    {
        this.nom = nom;
    }

    public String getPrenom()
    {
        return prenom;
    }

    public void setPrenom(String prenom)
    {
        this.prenom = prenom;
    }

    public List<Secteur> getSecteursDemploi()
    {
        return secteursDemploi;
    }

    public void setSecteursDemploi(List<Secteur> secteursDemploi)
    {
        this.secteursDemploi = secteursDemploi;
    }

    public String getTelephone()
    {
        return telephone;
    }

    public void setTelephone(String telephone)
    {
        this.telephone = telephone;
    }

    @Override
    public int hashCode()
    {
        int hash = 3;
        hash = 41 * hash + Objects.hashCode(this.id);
        hash = 41 * hash + Objects.hashCode(this.nom);
        hash = 41 * hash + Objects.hashCode(this.prenom);
        hash = 41 * hash + Objects.hashCode(this.cni);
        return hash;
    }

}
