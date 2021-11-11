package com.web.entity;

import java.util.Collection;

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
    private Integer idParent;
    @Column(name = "IsDeleted")
    private Integer isDeleted;
    
    @OneToMany(mappedBy = "category", fetch = FetchType.EAGER)
    private Collection<Blog> blog;
    

    public Category() {
    }



	public Category(int idCategory, String nameCategory, String tagCategory, Integer idParent, Integer isDeleted,
			Collection<Blog> blog) {
		super();
		this.idCategory = idCategory;
		this.nameCategory = nameCategory;
		this.tagCategory = tagCategory;
		this.idParent = idParent;
		this.isDeleted = isDeleted;
		this.blog = blog;
	}



	public Integer getIsDeleted() {
		return isDeleted;
	}



	public void setIsDeleted(Integer isDeleted) {
		this.isDeleted = isDeleted;
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

	public Collection<Blog> getBlog() {
		return blog;
	}

	public void setBlog(Collection<Blog> blog) {
		this.blog = blog;
	}
    
	
}
