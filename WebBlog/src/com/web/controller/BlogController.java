package com.web.controller;

import com.web.entity.Blog;
import com.web.entity.Category;
import com.web.helper.Helper;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.RequestMapping;

import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

@Controller
@Transactional
@RequestMapping("/blog")
public class BlogController {
    
	@Autowired
	SessionFactory sessionFactory;
    @RequestMapping("/index")
    public String index(ModelMap theModelMap)
    {
        return "blog/index";
    }
    
    @RequestMapping(value = "create", method = RequestMethod.GET)
    public String create(ModelMap modelMap)
    {
        Blog blog = new Blog();
        modelMap.addAttribute("blog",blog);
        return "blog/create";
    }
    @RequestMapping(value = "create", method = RequestMethod.POST)
    public String create(@ModelAttribute("blog") Blog blog, ModelMap model, HttpServletRequest request)
    {
    	int idCategory = Integer.parseInt(request.getParameter("idCategory"));
    	blog.setCategory(getCategoryById(idCategory));
    	blog.setTagBlog(Helper.convertTag(blog.getTitle()));
    	blog.setDateCreated(Calendar.getInstance().getTime());
    	blog.setViews(0);
    	
        Session session = sessionFactory.openSession();
        Transaction t = session.beginTransaction();
        try{
        	session.save(blog);
        	t.commit();
        	model.addAttribute("message","Thành công");
        	
        }catch (Exception e) {
			
        	t.rollback();
        	e.printStackTrace();
        	model.addAttribute("blog",blog);
        	model.addAttribute("message","Thất bại");
		}
        return "blog/create";
    }

    @ModelAttribute("categories")
    public List<Category> getCategories()
    {
    	Session currentSession = sessionFactory.getCurrentSession();
        Query query = currentSession.createQuery("from Category where isDeleted = 0");
        List<Category> categories = query.list();
        return categories;
    }

    public Category getCategoryById(int idCategory) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM Category where idCategory = :idCategory";
		Query query = session.createQuery(hql);
		query.setParameter("idCategory", idCategory);
		Category category = (Category)query.list().get(0);
		return category;
	}

}
