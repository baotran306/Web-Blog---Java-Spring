package com.web.entity;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import java.util.Date;

public class Blog {
    @Id
    @GeneratedValue
    private int id ;
    private String title;
    private String contentBlog ;
    private String tagBog ;
    private int idCategory ;
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date dateCreated;
    private long views;

    public Blog(int id, String title, String contentBlog, String tagBog, int idCategory, Date dateCreated, long views) {
        this.id = id;
        this.title = title;
        this.contentBlog = contentBlog;
        this.tagBog = tagBog;
        this.idCategory = idCategory;
        this.dateCreated = dateCreated;
        this.views = views;
    }

    public Blog() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContentBlog() {
        return contentBlog;
    }

    public void setContentBlog(String contentBlog) {
        this.contentBlog = contentBlog;
    }

    public String getTagBog() {
        return tagBog;
    }

    public void setTagBog(String tagBog) {
        this.tagBog = tagBog;
    }

    public int getIdCategory() {
        return idCategory;
    }

    public void setIdCategory(int idCategory) {
        this.idCategory = idCategory;
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    public long getViews() {
        return views;
    }

    public void setViews(long views) {
        this.views = views;
    }

    @Override
    public String toString() {
        return "Blog{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", contentBlog='" + contentBlog + '\'' +
                ", tagBog='" + tagBog + '\'' +
                ", idCategory=" + idCategory +
                ", dateCreated=" + dateCreated +
                ", views=" + views +
                '}';
    }
}
