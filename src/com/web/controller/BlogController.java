package com.web.controller;

import com.web.entity.Blog;
import com.web.entity.Category;
import com.web.helper.Helper;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import com.web.entity.Blog;
import com.web.entity.Category;
import com.web.entity.Comment;

@Controller
@Transactional
@RequestMapping("/blog/")
public class BlogController {

	@Autowired
	SessionFactory sessionFactory;

	@RequestMapping(value = "f/{categoryTag}.htm")
	public String index(@PathVariable("categoryTag") String tag,ModelMap modelMap) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM Category where tagCategory = :tagCategory";
		System.out.println(tag);
		Query query = session.createQuery(hql);		
		query.setParameter("tagCategory", tag);
		Category category = (Category)query.list().get(0);
		query = session.createQuery("FROM Blog where IdCategory = :idCategory");
		query.setParameter("idCategory", category.getIdCategory());
		List<Blog> blogs = query.list();
		modelMap.addAttribute("blogs", blogs);
		return "blog/category-detail";
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
		System.out.println(blog.getTitle());
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
			return "blog/manager";

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
	@RequestMapping(value = "delete/{tag}.htm", method = RequestMethod.GET)
	public String delete(@PathVariable("tag") String tag, ModelMap model) {	
		System.out.println("check");		
		Session session = sessionFactory.openSession();
        Transaction t = session.beginTransaction();
        String hql = "FROM Blog where tagBlog = :tagBlog";	
		try {
		Query query = session.createQuery(hql);
		query.setParameter("tagBlog", tag);
		Blog blog = (Blog) query.list().get(0);
		session.delete(blog);
		t.commit();
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			t.rollback();
		}
		return "redirect:/blog/manager.htm?page=1";

	}
	
	@RequestMapping(value = "manager", method = RequestMethod.GET)
	public String manager (ModelMap modelMap,@RequestParam("page")int getPage)
	{
		Optional<Integer> page = Optional.of(getPage);
		Optional<Integer> size = Optional.of(5);
	    int currentPage = page.orElse(0);
	    int pageSize = size.orElse(5);
		Page<Blog> pageBlog = findPaginBlog(PageRequest.of(currentPage-1,pageSize));	
		modelMap.addAttribute("blogs",pageBlog);
	    int totalPages = pageBlog.getTotalPages();
	    if (totalPages > 0) {
	       List<Integer> pageNumbers = IntStream.rangeClosed(1, totalPages)
	            .boxed()
	            .collect(Collectors.toList());
	        modelMap.addAttribute("pageNumbers", pageNumbers);
	     }
		
		return "blog/manager";
	}

	@RequestMapping(value = "t/{tag}.htm", method = RequestMethod.GET)
	public String info(@PathVariable("tag") String tag
			, ModelMap model,HttpServletRequest request,@RequestParam("page")int getPage) {
		Optional<Integer> page = Optional.of(getPage);
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
			model.addAttribute("blog",blog);
			Optional<Integer> size = Optional.of(10);
		    int currentPage = page.orElse(0);
		    int pageSize = size.orElse(10);
	    	System.out.println(blog.getComment().size());
		    if(blog.getComment().size()!=0) {
			Page<Comment> pageComment = findPaginComment(PageRequest.of(currentPage-1,pageSize),blog);	
			System.out.println("size: "+pageComment.getContent().size());
		    request.setAttribute("comments", pageComment);
		    model.addAttribute("pageComment",pageComment);
		        int totalPages = pageComment.getTotalPages();
		        if (totalPages > 0) {
		            List<Integer> pageNumbers = IntStream.rangeClosed(1, totalPages)
		                    .boxed()
		                    .collect(Collectors.toList());
		            model.addAttribute("pageNumbers", pageNumbers);
		        }
		    }
	    	query = session.createQuery("from Comment");
	    	List<Comment> comments = query.list();
	    	System.out.println(comments.get(comments.size()-1).getIdComment());
	    	model.addAttribute("idComment", comments.get(comments.size()-1).getIdComment());
			model.addAttribute("comment",new Comment());

		} catch (Exception e) {

			t.rollback();
		} finally {

			session.close();
		}

		model.addAttribute("blog", blog);
		return "comment/comment";

	}
	//@Transactional
	@ModelAttribute("categories")
	public List<Category> getCategories() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query query = currentSession.createQuery("from Category where isDeleted = 0");
		List<Category> categories = query.list();
		return categories;
	}
	
	//@Transactional
	public Category getCategoryById(int idCategory) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM Category where idCategory = :idCategory";
		Query query = session.createQuery(hql);
		query.setParameter("idCategory", idCategory);
		Category category = (Category) query.list().get(0);
		return category;
	}
	//@Transactional
	public Blog getBlogByTag(String tagBlog) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM Blog where tagBlog = :tagBlog";
		Query query = session.createQuery(hql);
		query.setParameter("tagBlog", tagBlog);
		Blog blog = (Blog) query.list().get(0);
		return blog;
	}

	//@Transactional
	public Blog getBlogById(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM Blog where id = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		Blog blog = (Blog) query.uniqueResult();
		return blog;
	}
	//@Transactional
	public List<Blog> getBlogs() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM Blog";
		Query query = session.createQuery(hql);
		return query.list();
	}

    
   // @Transactional
	/* @ModelAttribute("comments") */
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
    
    @RequestMapping(value="t/{tag}.htm",method=RequestMethod.POST)
    public String postCommentBox(@PathVariable("tag")String tag,ModelMap theModelMap,@ModelAttribute("comment") Comment comment) {
    	
    	//comment.setBlog();
    	System.out.println(comment.getBlog());
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
    	return "redirect:/blog/t/"+tag+".htm?page=1";
    }
    
    public Page<Comment> findPaginComment(Pageable pageable,Blog blog) {
        List<Comment> comments = new ArrayList<>();
        comments = blog.getComment();
        int pageSize = pageable.getPageSize();
        int currentPage = pageable.getPageNumber();
        int startItem = currentPage * pageSize;
        List<Comment> list;

        if (comments.size() < startItem) {
            list = Collections.emptyList();
        } else {
            int toIndex = Math.min(startItem + pageSize, comments.size());
            list = comments.subList(startItem, toIndex);
        }

        Page<Comment> commentPage
                = new PageImpl<Comment>(list, PageRequest.of(currentPage, pageSize), comments.size());

        return commentPage;
    }
    
    public Page<Blog> findPaginBlog(Pageable pageable) {
        List<Blog> blogs = new ArrayList<>();
        blogs = this.getBlogs();
        int pageSize = pageable.getPageSize();
        int currentPage = pageable.getPageNumber();
        int startItem = currentPage * pageSize;
        List<Blog> list;

        if (blogs.size() < startItem) {
            list = Collections.emptyList();
        } else {
            int toIndex = Math.min(startItem + pageSize, blogs.size());
            list = blogs.subList(startItem, toIndex);
        }

        Page<Blog> blocommentPage
                = new PageImpl<Blog>(list, PageRequest.of(currentPage, pageSize), blogs.size());

        return blocommentPage;
    }

}
