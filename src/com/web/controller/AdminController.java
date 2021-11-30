package com.web.controller;

import com.web.SendMail.Mailer;
import com.web.entity.UserAdmin;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import java.io.IOException;
import java.util.List;
import java.util.Random;

@Transactional
@Controller
@RequestMapping("/admin/")
public class AdminController {

    @Autowired
    Mailer mailer;
    
    @Autowired
    SessionFactory sessionFactory;

    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String showLogin(){
        return "admin/login";
    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(@ModelAttribute("admin") UserAdmin admin, ModelMap modelMap, HttpServletRequest request,
                        HttpServletResponse response, HttpSession session){
        if (checkLoginAdmin(admin.getUsername(), admin.getPassword())){
            try {
            	session.setAttribute("username", admin.getUsername());
                response.sendRedirect(request.getContextPath() + "/blog/create.htm");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        modelMap.addAttribute("message", "Sai tên đăng nhập hoặc mật khẩu");
        return "admin/login";
    }
    
    @RequestMapping("logout")
    public String Logout(HttpSession session) {
    	session.removeAttribute("username");
    	return "redirect:/admin/login";
    }

    @RequestMapping(value = "verify-email", params = "verifyEmail")
    public String showFormVerifyEmail(){
        return "admin/check-own-account";
    }

    @RequestMapping(value = "check-own-account", method = RequestMethod.POST)
    public String SendVerifyNumber(@RequestParam("username") String username, @RequestParam("email") String email,
                                   ModelMap modelMap, HttpServletRequest request, HttpServletResponse response){

        if (checkOwnAccount( username, email)){
            int verifyNumber = generateRandomVerifyNumber();
            System.out.println(verifyNumber);
            HttpSession session = request.getSession();
            sendMailVerifyNumber(email, verifyNumber);
            session.setAttribute("email", email);
            session.setAttribute("username", username);
            session.setAttribute("verifyNumber", verifyNumber);
            return "admin/verify-email";
        }
        modelMap.addAttribute("message", "Tài khoản và email không khớp nhau");
        return "admin/check-own-account";
    }

    @RequestMapping(value = "check-verify-number", params = "btnSubmit")
    public String showReset(HttpSession session, @RequestParam("inputVerifyNumber") String input, ModelMap modelMap){
        String verifyNumber = session.getAttribute("verifyNumber").toString();
        if(input.equals(verifyNumber)){
            return "admin/reset-password";
        }
        modelMap.addAttribute("message", "Sai mã xác thực");
        return "admin/verify-email";
    }

    @RequestMapping(value = "check-verify-number", params = "btnSendMail")
    public String sendMail(HttpSession session){
        String email = session.getAttribute("email").toString();
        int newVerifyNumber = generateRandomVerifyNumber();
        session.setAttribute("verifyNumber", newVerifyNumber);
        sendMailVerifyNumber(email, newVerifyNumber);
        System.out.println(email);
        System.out.println(newVerifyNumber);
        return "admin/verify-email";
    }
    
    @RequestMapping(value = "change-password", method = RequestMethod.GET)
    public String goPageChangePassword(){
        return "admin/reset-password";
    }
    
    @RequestMapping(value = "change-password", method = RequestMethod.POST)
    public String changeNewPassword(@RequestParam("newPassword") String newPassword, HttpSession session,
            ModelMap modelMap){
    	String username = session.getAttribute("username").toString();
        if(updatePassword(username, newPassword)){
            return "admin/login";
        }
        else{
            modelMap.addAttribute("message", "Đổi mật khẩu thất bại!");
            System.out.println(username);
            return "admin/reset-password";
        }
    }

    @RequestMapping(value = "reset-password", method = RequestMethod.POST)
    public String changePassword(@RequestParam("newPassword") String newPassword, HttpSession session,
                                 ModelMap modelMap){
        String username = session.getAttribute("username").toString();
        if(updatePassword(username, newPassword)){
            return "admin/login";
        }
        else{
            modelMap.addAttribute("message", "Đổi mật khẩu thất bại!");
            System.out.println(username);
            return "admin/reset-password";
        }

    }


    public boolean checkLoginAdmin(String username, String password){
    	Session session = sessionFactory.getCurrentSession();
    	String hql = "FROM UserAdmin where username = :username and password = :password";
    	Query query = session.createQuery(hql);
    	query.setParameter("username", username);
    	query.setParameter("password", password);
        List<UserAdmin> user = query.list();
        if(user.size() != 0) {
        	return true;
        }
        return false;
    }

    public boolean checkOwnAccount(String username, String email){
    	Session session = sessionFactory.getCurrentSession();
    	String hql = "FROM UserAdmin where username = :username and email = :email";
    	Query query = session.createQuery(hql);
    	query.setParameter("username", username);
    	query.setParameter("email", email);
        List<UserAdmin> user = query.list();
        if(user.size() != 0) {
        	return true;
        }
        return false;
    }

    public int generateRandomVerifyNumber(){
        int ans;
        Random random = new Random();
        ans = random.nextInt(999999) + 100000;
        return ans;
    }

    public boolean updatePassword(String username, String password){
    	Session session = sessionFactory.openSession();
    	Transaction transaction = null;
    	try{
    		transaction = session.beginTransaction();
            String hql = "UPDATE UserAdmin set password = :password where username = :username";
            Query query = session.createQuery(hql);
            query.setParameter("username", username);
            query.setParameter("password", password);
            int result = query.executeUpdate();
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

    public void sendMailVerifyNumber(String to, int verifyNumber){
        try {
            String subject = "Xác thực tài khoản BHT BLOG";
            String verify_string = String.format("Mã xác thực của bạn là  %d.", verifyNumber);
            String body = verify_string + "\n" + "Vui lòng nhập đúng mã xác thực để tiếp tục.\n"
                    + "Hãy bỏ qua tin nhắn này và bảo mật tài khoản của bạn nếu không phải bạn thực hiện tác vụ trên.";
            mailer.send("BHT_BLOG", to, subject, body);
        }
        catch (Exception ex){
            System.out.println(ex);
        }
    }
}
