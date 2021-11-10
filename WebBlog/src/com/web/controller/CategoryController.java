package com.web.controller;
import com.web.entity.Category;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Transactional
@RequestMapping("/category/")
public class CategoryController {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("list")
	public String showListCategory(ModelMap modelMap) {
		modelMap.addAttribute("categories", this.getListCategories());
		return "category/listCategory";
	}
	
	public List<Category> getListCategories(){
		Session session = factory.getCurrentSession();
		String hql = "FROM Category";
		Query query = session.createQuery(hql);
		List<Category> list = query.list();
		return list;
	}
	
	public Category getCategoryById(int idCategory) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Category where idCategory = :idCategory";
		Query query = session.createQuery(hql);
		query.setParameter("idCategory", idCategory);
		Category category = (Category)query.list().get(0);
		return category;
	}
	
	public Category getCategoryByTag(String tagCategory) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Category where tagCategory = :tagCategory";
		Query query = session.createQuery(hql);
		query.setParameter("tagCategory", tagCategory);
		Category category = (Category)query.list().get(0);
		return category;
	}
}
