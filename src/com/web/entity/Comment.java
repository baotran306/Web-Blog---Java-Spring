package com.web.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "Comment")
public class Comment {
	@Id
	@GeneratedValue
	@Column(name="IdComment")
	private long idComment;
	
	@Column(name="ContentComment")
	private String contentComment;
	
	@Column(name="NameComment")
	@NotNull(message = "không được để trống bình luận")
	private String nameComment;
	
	@ManyToOne
	@JoinColumn(name="IdBlog")
	private Blog blog;

	public Comment(long idComment, String contentComment, String nameComment, Blog blog) {
		super();
		this.idComment = idComment;
		this.contentComment = contentComment;
		this.nameComment = nameComment;
		this.blog = blog;
	}

	public long getIdComment() {
		return idComment;
	}

	public void setIdComment(long idComment) {
		this.idComment = idComment;
	}

	public String getContentComment() {
		return contentComment;
	}

	public void setContentComment(String contentComment) {
		this.contentComment = contentComment;
	}

	public String getNameComment() {
		return nameComment;
	}

	public void setNameComment(String nameComment) {
		this.nameComment = nameComment;
	}

	public Blog getBlog() {
		return blog;
	}

	public void setBlog(Blog blog) {
		this.blog = blog;
	}

	public Comment() {
		super();
	}
	
	
}
