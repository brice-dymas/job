/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.job.persistence.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OrderColumn;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

/**
 *
 * @author Brice GUEMKAM <briceguemkam@gmail.com>
 */
@Entity
public class Document implements Serializable
{

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @NotNull
    private boolean perimer;

    @ManyToOne(targetEntity = TypeDocument.class, optional = false)
    TypeDocument typeDocument;

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyy")
    private Date dateExpiration;

    private String file;

    @Transient
    private CommonsMultipartFile fileData;

    @ElementCollection(fetch = FetchType.EAGER)
    @OrderColumn(name = "order_files")
    private List<String> files;

    public Document()
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

    public List<String> getFiles()
    {
        return files;
    }

    public void setFiles(List<String> files)
    {
        this.files = files;
    }

    public boolean isPerimer()
    {
        return perimer;
    }

    public void setPerimer(boolean perimer)
    {
        this.perimer = perimer;
    }

    public TypeDocument getTypeDocument()
    {
        return typeDocument;
    }

    public void setTypeDocument(TypeDocument typeDocument)
    {
        this.typeDocument = typeDocument;
    }

    public Date getDateExpiration()
    {
        return dateExpiration;
    }

    public void setDateExpiration(Date dateExpiration)
    {
        this.dateExpiration = dateExpiration;
    }

    public String getFile()
    {
        return file;
    }

    public void setFile(String file)
    {
        this.file = file;
    }

    public CommonsMultipartFile getFileData()
    {
        return fileData;
    }

    public void setFileData(CommonsMultipartFile fileData)
    {
        this.fileData = fileData;
    }

    public void addFile(String file)
    {
        this.files.add(file);
    }

    @Override
    public int hashCode()
    {
        int hash = 3;
        hash = 29 * hash + Objects.hashCode(this.id);
        hash = 29 * hash + (this.perimer ? 1 : 0);
        hash = 29 * hash + Objects.hashCode(this.typeDocument);
        hash = 29 * hash + Objects.hashCode(this.dateExpiration);
        hash = 29 * hash + Objects.hashCode(this.file);
        hash = 29 * hash + Objects.hashCode(this.fileData);
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
        final Document other = (Document) obj;
        if (!Objects.equals(this.id, other.id))
        {
            return false;
        }
        if (this.perimer != other.perimer)
        {
            return false;
        }
        if (!Objects.equals(this.typeDocument, other.typeDocument))
        {
            return false;
        }
        if (!Objects.equals(this.dateExpiration, other.dateExpiration))
        {
            return false;
        }
        if (!Objects.equals(this.file, other.file))
        {
            return false;
        }
        if (!Objects.equals(this.fileData, other.fileData))
        {
            return false;
        }
        return true;
    }

}
