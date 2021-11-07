package com.web.entity;

import javax.persistence.*;
import javax.validation.constraints.Null;

@Entity
@Table(name = "Category")
public class Category {
    @Id
    @GeneratedValue
    @Column(name = "IdCategory")
    private int idCategory ;
    @Column(name = "NameCategory")
    private String nameCategory ;
    @Column(name = "TagCategory")
    private String tagCategory;
    @Column(name = "IdParent")
    @Null
    private Integer idParent;

    public Category() {
    }

    public Category(int idCategory, String nameCategory, String tagCategory, Integer idParent) {
        this.idCategory = idCategory;
        this.nameCategory = nameCategory;
        this.tagCategory = tagCategory;
        this.idParent = idParent;
    }

    public int getIdCategory() {
        return idCategory;
    }

    public void setIdCategory(int idCategory) {
        this.idCategory = idCategory;
    }

    public String getNameCategory() {
        return nameCategory;
    }

    public void setNameCategory(String nameCategory) {
        this.nameCategory = nameCategory;
    }

    public String getTagCategory() {
        return tagCategory;
    }

    public void setTagCategory(String tagCategory) {
        this.tagCategory = tagCategory;
    }

    public Integer getIdParent() {
        return idParent;
    }

    public void setIdParent(Integer idParent) {
        this.idParent = idParent;
    }
}
