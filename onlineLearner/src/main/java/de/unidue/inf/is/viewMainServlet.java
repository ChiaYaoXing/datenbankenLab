package de.unidue.inf.is;

import de.unidue.inf.is.domain.Course;
import de.unidue.inf.is.domain.User;
import de.unidue.inf.is.stores.RegisterStore;
import de.unidue.inf.is.stores.StoreException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;


public final class viewMainServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try(RegisterStore registerStore = new RegisterStore()){
            User user = (User) request.getSession().getAttribute("user");
            List<Course> courses =  registerStore.getRegisteredCourses(user.getUid());
            List<Course> availableCourses =  registerStore.getNonRegisteredCourses(user.getUid());
            registerStore.complete();
            request.setAttribute("numberOfColumns", courses.size());
            request.setAttribute("availableCourses", availableCourses);
            request.setAttribute("courses", courses);
        } catch (Exception e){
            throw new StoreException(e);
        }
        request.getRequestDispatcher("/view_main.ftl").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {

        String kid = request.getParameter("courseID");

        if (null != kid && !kid.isEmpty()) {

//            synchronized (userList) {
//                userList.add(new User(firstname, lastname));
//            }
            short courseID = Short.valueOf(kid);
            System.out.println(kid);
            HttpSession session = request.getSession();
//
//            try {
//                userStore = new UserStore();
//                userStore.addUser(user);
//                userStore.complete();
//                userStore.addUid(user);
//
//
//            } catch(Exception e){
//                throw new StoreException(e);
//            }
//            finally {
//                if(userStore != null) userStore.close();
//                session.setAttribute("user", user);
//            }

        }
//        request.getRequestDispatcher("onlineLearner").forward(request, response);
        response.sendRedirect("view_main");
//        doGet(request, response);
    }

}