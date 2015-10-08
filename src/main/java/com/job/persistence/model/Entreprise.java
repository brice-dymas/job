/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
 * @author sando
 */
@Entity
public class Entreprise implements Serializable
{

    /**
     * C'est pas grave tu vas regarder Parlons plus de Job On vas ajouté le
     * champs état a demandeur Pour savoir s'il est placé ou pas Un employé
     * pourra être pplacé dans une dans une entreprise sur une période Il va
     * recevoir une appréciation à la fin de son placement Et durant son
     * placement il y'aura des comentaires qui devront être fait sur lui Bon il
     * devra fournir plusieurs document avec des dates de validités, et il
     * faudra alertés lorsque ces dates arrives à expirations. Le dernier ci moi
     * je vais le faire Faisons d'abord l'autre ci entierement avant de regarder
     * les autres tâches /**
     */
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    protected Long id;

    @NotBlank(message = "{blank.message}")
    private String nom;

    @NotBlank(message = "{blank.message}")
    private String boitePostale;

    @NotBlank(message = "{blank.message}")
    private String telephone;

    @NotBlank(message = "{blank.message}")
    private String adresse;

    @NotBlank(message = "{blank.message}")
    private String contact;

    @NotBlank(message = "{blank.message}")
    private String numeroPersonneAContacter;

    public Entreprise()
    {
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

    public String getNumeroPersonneAContacter()
    {
        return numeroPersonneAContacter;
    }

    public void setNumeroPersonneAContacter(String numeroPersonneAContacter)
    {
        this.numeroPersonneAContacter = numeroPersonneAContacter;
    }

    public String getBoitePostale()
    {
        return boitePostale;
    }

    public void setBoitePostale(String boitePostale)
    {
        this.boitePostale = boitePostale;
    }

    public String getTelephone()
    {
        return telephone;
    }

    public void setTelephone(String telephone)
    {
        this.telephone = telephone;
    }

    public String getAdresse()
    {
        return adresse;
    }

    public void setAdresse(String adresse)
    {
        this.adresse = adresse;
    }

    public String getContact()
    {
        return contact;
    }

    public void setContact(String contact)
    {
        this.contact = contact;
    }

    @Override
    public int hashCode()
    {
        int hash = 7;
        hash = 67 * hash + Objects.hashCode(this.id);
        hash = 67 * hash + Objects.hashCode(this.nom);
        hash = 67 * hash + Objects.hashCode(this.boitePostale);
        hash = 67 * hash + Objects.hashCode(this.telephone);
        hash = 67 * hash + Objects.hashCode(this.adresse);
        hash = 67 * hash + Objects.hashCode(this.contact);
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
        final Entreprise other = (Entreprise) obj;
        if (!Objects.equals(this.id, other.id))
        {
            return false;
        }
        if (!Objects.equals(this.nom, other.nom))
        {
            return false;
        }
        if (!Objects.equals(this.boitePostale, other.boitePostale))
        {
            return false;
        }
        if (!Objects.equals(this.telephone, other.telephone))
        {
            return false;
        }
        if (!Objects.equals(this.adresse, other.adresse))
        {
            return false;
        }
        if (!Objects.equals(this.contact, other.contact))
        {
            return false;
        }
        return true;
    }

}
