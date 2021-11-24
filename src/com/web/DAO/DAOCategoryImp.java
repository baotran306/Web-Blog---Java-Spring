//package com.web.DAO;
//
//import com.web.entity.Blog;
//import com.web.entity.Category;
//import org.hibernate.Session;
//import org.hibernate.SessionFactory;
//import org.hibernate.Query;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Repository;
//
//import java.util.List;
//
//@Repository
//public class DAOCategoryImp implements  DAOCategory{
//    @Autowired
////    private SessionFactory sessionFactory;
//    @Override
//    public List<Category> getListCategory() {
//        Session currentSession = sessionFactory.getCurrentSession();
//        Query query = currentSession.createQuery("from Category");
//        List<Category> categories = query.list();
//        return categories;
//    }
//}
