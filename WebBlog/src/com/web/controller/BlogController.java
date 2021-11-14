package com.web.controller;

import com.web.entity.Blog;
import com.web.entity.Category;
import com.web.helper.Helper;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.slf4j.LoggerFactory;
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
	public String index(ModelMap modelMap) {
		List<Blog> blogs = this.getBlogs();
		modelMap.addAttribute("blogs", blogs);
		return "blog/index";
	}
	

	@RequestMapping(value = "create", method = RequestMethod.GET)
	public String create(ModelMap modelMap) {
		Blog blog = new Blog();
		modelMap.addAttribute("blog", blog);
		return "blog/create";
	}

	@RequestMapping(value = "create", method = RequestMethod.POST)
	public String create(@ModelAttribute("blog") Blog blog, ModelMap model, HttpServletRequest request) {
		int idCategory = Integer.parseInt(request.getParameter("idCategory"));
		blog.setCategory(getCategoryById(idCategory));
		blog.setTagBlog(Helper.convertTag(blog.getTitle()));
		blog.setDateCreated(Calendar.getInstance().getTime());
		blog.setViews(0);

		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(blog);
			t.commit();
			model.addAttribute("message", "Thành công");

		} catch (Exception e) {

			t.rollback();
			e.printStackTrace();
			model.addAttribute("blog", blog);
			model.addAttribute("message", "Thất bại");
		}finally {
			session.close();
		}
		return "blog/create";
	}

	@RequestMapping(value = "update.htm", method = RequestMethod.POST)
	public String update(@ModelAttribute("blog") Blog blog, ModelMap model, HttpServletRequest request) {

		Blog oldBlog = getBlogById(blog.getId());
		if (oldBlog == null)
			return "not_found";

		blog.setTagBlog(Helper.convertTag(blog.getTitle()));

		// checkTagBlog
		Blog ckeckBlog = getBlogByTag(blog.getTagBlog());
		if (ckeckBlog != null) {
			if (ckeckBlog.getId() != blog.getId()) {
				model.addAttribute("blog", blog);
				model.addAttribute("message", "Tiêu đề không khả dụng");
				return "redirect:/blog/update/" + oldBlog.getTagBlog() + ".htm";

			}
		}

		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			String hql = "update  Blog set title = :title, tagBlog = :tagBlog, idCategory = :idCategory, contentBlog = :contentBlog where id = "
					+ String.valueOf(blog.getId());
			Query query = session.createQuery(hql);
			query.setParameter("title", blog.getTitle());
			query.setParameter("tagBlog", blog.getTagBlog());
			query.setParameter("idCategory", blog.getCategory().getIdCategory());
			query.setParameter("contentBlog", blog.getContentBlog());
			int a = query.executeUpdate();

			t.commit();
			model.addAttribute("message", "Thành công");
			return "blog/index";

		} catch (Exception e) {

			t.rollback();
			e.printStackTrace();
			model.addAttribute("blog", blog);
			model.addAttribute("message", "Thất bại");
			return "redirect:/blog/update/" + oldBlog.getTagBlog() + ".htm";
		} finally {

			session.close();

		}
		// return "blog/update";
	}

	@RequestMapping(value = "update/{tag}.htm", method = RequestMethod.GET)
	public String update(@PathVariable("tag") String tag, ModelMap model) {

		Blog blog = getBlogByTag(tag);
		if (blog == null)
			return "not_found";

		model.addAttribute("blog", blog);
		return "blog/update";

	}
	@RequestMapping(value = "manager", method = RequestMethod.GET)
	public String manager (ModelMap modelMap)
	{
		List<Blog> blogs = getBlogs();
		modelMap.addAttribute("blogs",blogs);
		return "blog/manager";
	}

	@RequestMapping(value = "{tag}.htm", method = RequestMethod.GET)
	public String info(@PathVariable("tag") String tag, ModelMap model) {

		Blog blog = getBlogByTag(tag);
		if (blog == null)
			return "not_found";

		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			String hql = "update  Blog set views = views + 1 where id = :id";

			Query query = session.createQuery(hql);
			query.setParameter("id", blog.getId());
			int a = query.executeUpdate();

			t.commit();
			model.addAttribute("message", "Thành công");

		} catch (Exception e) {

			t.rollback();
		} finally {

			session.close();
		}

		model.addAttribute("blog", blog);
		return "blog/info";

	}

	@ModelAttribute("categories")
	public List<Category> getCategories() {
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
		Category category = (Category) query.list().get(0);
		return category;
	}

	public Blog getBlogByTag(String tagBlog) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM Blog where tagBlog = :tagBlog";
		Query query = session.createQuery(hql);
		query.setParameter("tagBlog", tagBlog);
		Blog blog = (Blog) query.list().get(0);
		return blog;
	}

	public Blog getBlogById(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM Blog where id = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		Blog blog = (Blog) query.uniqueResult();
		return blog;
	}

	public List<Blog> getBlogs() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM Blog";
		Query query = session.createQuery(hql);
		return query.list();
	}

}
