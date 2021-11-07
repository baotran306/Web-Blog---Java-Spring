//package com.web.DAO;
//import com.web.entity.Blog;
//import org.hibernate.Session;
//import org.hibernate.SessionFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.hibernate.Query;
//import org.springframework.stereotype.Repository;
//
//import java.util.List;
//
//@Repository
//public class DAOBlogImp implements DAOBlog {
//    @Autowired
//    SessionFactory sessionFactory;
//
//    @Override
//    public List<Blog> getListBlog() {
//        Session currentSession = sessionFactory.getCurrentSession();
//        Query  query = currentSession.createQuery("FORM Blog");      
//        List<Blog> blogs = query.list();
//        return blogs;
//    }
//    @Override
//    public Blog getBlogByTag(String tag)
//    {
//        Session currentSession = sessionFactory.getCurrentSession();
//        Query  query = currentSession.createQuery(" from Blog b where b.TagBlog = :tag");
//        query.setParameter("tag",tag);
//        List<Blog> blogs = query.list();
//        if(blogs.size() > 0)
//            return blogs.get(0);
//        else
//            return null;
//
//    }
//
//    @Override
//    public List<Blog> getListBlogByCategory(String tagCategory) {
//        Session currentSession = sessionFactory.getCurrentSession();
//        Query query = currentSession.createQuery(" from Blog b where b.TagBlog = :tagCategory");
//        query.setParameter("tagCategory",tagCategory);
//        List<Blog> blogs = query.list();
//        return blogs;
//    }
//}
