package com.web.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.web.entity.Blog;
import com.web.entity.Category;
import com.web.entity.Comment;

@Controller
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
    public String create(@ModelAttribute("blog") Blog blog)
    {

        System.out.println(blog.toString());
        return "blog/create";
    }

    @Transactional
    @ModelAttribute("categories")
    public List<Category> getCategories()
    {
    	Session currentSession = sessionFactory.getCurrentSession();
        Query query = currentSession.createQuery("from Category");
        List<Category> categories = query.list();
        return categories;
    }
    
    @Transactional
    @ModelAttribute("comments")
    public List<Comment> getCommentList(HttpServletRequest request) {
    	Session currentSession = sessionFactory.getCurrentSession();
    	Query query = currentSession.createQuery("from Comment");
    	List<Comment> comments = query.list();
    	request.setAttribute("comments", comments);
    	return comments;  	
    }
    @RequestMapping(value="/comment",method=RequestMethod.GET)
    public String createCommentBox(ModelMap theModelMap) {
    	theModelMap.addAttribute("comment",new Comment());
    	return "comment/comment";
    }
    
    @RequestMapping(value="/comment",method=RequestMethod.POST)
    public String postCommentBox(ModelMap theModelMap,@ModelAttribute("comment") Comment comment) {
    	
    	comment.setIdBlog(1);
    	Session session = sessionFactory.openSession();
        Transaction t = session.beginTransaction();
        try{
        	session.save(comment);
        	t.commit();
        	theModelMap.addAttribute("message","Thành công");        	
        }catch (Exception e) {
			
        	t.rollback();
        	e.printStackTrace();
        	System.out.print("thaats bai");
        	theModelMap.addAttribute("blog",comment);
        	theModelMap.addAttribute("message","Thất bại");
		}
    	theModelMap.addAttribute("comment",new Comment());
    	return "redirect:/blog/comment.htm";
    }

}
