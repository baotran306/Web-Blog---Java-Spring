package com.web.entity;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import java.util.Collection;
import java.util.Date;

@Entity
@Table(name = "Blog")
public class Blog {
    @Id
    @GeneratedValue
    @Column(name = "Id")
    private int id ;
    
    @Column(name = "Title")
    private String title;
    
    @Column(name = "ContentBlog")
    private String contentBlog;
    
    @Column(name = "TagBlog")
    private String tagBlog;
    
//    @Column(name = "IdCategory")
//    private int idCategory;
    
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd/MM/yyyy HH:mm:ss")
    @Column(name = "DateCreated")
    private Date dateCreated;
    
    @Column(name = "Views")
    private long views;
    
    @ManyToOne
    @JoinColumn(name="IdCategory")
    private Category category;
    
    @OneToMany(mappedBy="blog", fetch=FetchType.EAGER)
    private Collection<Comment> comment;
    
    
    

	public Collection<Comment> getComment() {
		return comment;
	}

	public void setComment(Collection<Comment> comment) {
		this.comment = comment;
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

	public String getTagBlog() {
		return tagBlog;
	}

	public void setTagBlog(String tagBlog) {
		this.tagBlog = tagBlog;
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

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Blog() {
		super();
	}
	
	@Override
	public String toString() {
		return "Blog [id=" + id + ", title=" + title + ", contentBlog=" + contentBlog + ", tagBlog=" + tagBlog
				+ ", dateCreated=" + dateCreated + ", views=" + views + ", category=" + category + ", comment="
				+ comment + "]";
	}

	public Blog(int id, String title, String contentBlog, String tagBlog, Date dateCreated, long views,
			Category category, Collection<Comment> comment) {
		super();
		this.id = id;
		this.title = title;
		this.contentBlog = contentBlog;
		this.tagBlog = tagBlog;
		this.dateCreated = dateCreated;
		this.views = views;
		this.category = category;
		this.comment = comment;
	}

}
