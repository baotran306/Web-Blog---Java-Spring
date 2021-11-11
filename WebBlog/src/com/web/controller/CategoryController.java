package com.web.controller;
import com.web.entity.Category;
import com.web.helper.Helper;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;
import javax.websocket.server.PathParam;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@Transactional
@RequestMapping("/category/")
public class CategoryController {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("index")
	public String showListCategory(ModelMap modelMap) {
		modelMap.addAttribute("categories", this.getListCategories());
		return "category/index";
		
	}
	
	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public void insertNewCategory(@ModelAttribute("category") Category category, ModelMap modelMap, HttpServletRequest request,
            HttpServletResponse response) {
		 //
		category.setTagCategory(Helper.convertTag(category.getNameCategory()));
		category.setIsDeleted(0);
		
		if(this.insertCategory(category)) {
			modelMap.addAttribute("message", "Thêm thành công");
		}
		else {
			modelMap.addAttribute("message", "Thêm thất bại");
		}
		modelMap.addAttribute("categories", this.getListCategories());
		try {
            response.sendRedirect(request.getContextPath() + "/category/index.htm");
        } catch (IOException e) {
            e.printStackTrace();
        }
//		return "category/index";
	}
	
	@RequestMapping(value = "update/{idCategory}.htm", params = "linkUpdate")
    public String getUpdateCategory(ModelMap modelMap, @PathVariable("idCategory") int idCategory){
        modelMap.addAttribute("category", this.getCategoryById(idCategory));
        return "category/update";
    }
	
	@RequestMapping(value = "update", method=RequestMethod.POST)
	public void updateCategory(ModelMap modelMap, @ModelAttribute("category") Category category, HttpServletRequest request,
            HttpServletResponse response) {
		category.setIsDeleted(0);
		category.setTagCategory(Helper.convertTag(category.getNameCategory()));
		if(this.updateCategory(category)) {
			modelMap.addAttribute("message", "Cập nhật thành công");
		}
		else {
			modelMap.addAttribute("message", "Cập nhật thất bại");
		}
		modelMap.addAttribute("categories", this.getListCategories());
		try {
            response.sendRedirect(request.getContextPath() + "/category/index.htm");
        } catch (IOException e) {
            e.printStackTrace();
        }
	}
	
	@RequestMapping(value = "delete/{idCategory}.htm", params = "linkDelete")
	public void deleteCategory(ModelMap modelMap, @PathVariable("idCategory") int idCategory, HttpServletRequest request,
			HttpServletResponse response) {
		if(deleteCategory(idCategory)) {
			modelMap.addAttribute("message", "Xóa thành công");
		}
		else {
			modelMap.addAttribute("message", "Xóa thất bại");
		}

		modelMap.addAttribute("categories", this.getListCategories());
		
		try {
            response.sendRedirect(request.getContextPath() + "/category/index.htm");
        } catch (IOException e) {
            e.printStackTrace();
        }
	}
	
	public List<Category> getListCategories(){	
		Session session = factory.getCurrentSession();
		String hql = "FROM Category where isDeleted = 0";
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
	
	public boolean insertCategory(Category category) {
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			session.save(category);
			transaction.commit();
			return true;
		}
		catch(Exception ex) {
			transaction.rollback();
			return false;
		}
		finally {
			session.close();
		}
	}
	
	public boolean updateCategory(Category category) {
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			session.update(category);
			transaction.commit();
			return true;
		}
		catch(Exception ex) {
			transaction.rollback();
			return false;
		}
		finally {
			session.close();
		}
	}
	
	public boolean deleteCategory(int idCategory) {
		Session session = factory.openSession();
    	Transaction transaction = null;
    	try{
    		transaction = session.beginTransaction();
            String hql = "UPDATE Category set isDeleted = 1 where idCategory = :idCategory";
            Query query = session.createQuery(hql);
            query.setParameter("idCategory", idCategory);
            query.executeUpdate();
            transaction.commit();
            return true;
        }
        catch (Exception e){
            if(transaction != null) {
            	transaction.rollback();
            };
            return false;
        }
        finally {
            session.close();
        }
	}
}
