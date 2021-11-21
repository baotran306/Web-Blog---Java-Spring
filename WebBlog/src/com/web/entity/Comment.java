package com.web.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Comment")
public class Comment {
	@Id
	@GeneratedValue
	@Column(name = "idComment")
	private int idComment;
	@Column(name="ContentBlog")
	private String ContentBlog;
	@Column(name="NameComment")
	private String NameComment;
	@Column(name="idBlog")
	private int idBlog;
	
	
	public Comment() {
		
	}
	public Comment(int idComment, String contentBlog, String nameComment, int idBlog) {
		this.idComment = idComment;
		this.ContentBlog = contentBlog;
		this.NameComment = nameComment;
		this.idBlog = idBlog;
	}
	public int getIdComment() {
		return idComment;
	}
	public void setIdComment(int idComment) {
		this.idComment = idComment;
	}
	public String getContentBlog() {
		return ContentBlog;
	}
	public void setContentBlog(String contentBlog) {
		this.ContentBlog = contentBlog;
	}
	public String getNameComment() {
		return NameComment;
	}
	public void setNameComment(String nameComment) {
		this.NameComment = nameComment;
	}
	public int getIdBlog() {
		return idBlog;
	}
	public void setIdBlog(int idBlog) {
		this.idBlog = idBlog;
	}
	
	
	
}
