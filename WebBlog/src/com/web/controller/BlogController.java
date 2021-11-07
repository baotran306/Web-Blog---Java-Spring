package com.web.controller;

import com.web.entity.Blog;
import com.web.entity.Category;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

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
    public String create(@ModelAttribute("blog") Blog blog)
    {

        System.out.println(blog.toString());
        return "blog/create";
    }

    @ModelAttribute("categories")
    public List<Category> getCategories()
    {
    	Session currentSession = sessionFactory.getCurrentSession();
        Query query = currentSession.createQuery("from Category");
        List<Category> categories = query.list();
        return categories;
    }


}
