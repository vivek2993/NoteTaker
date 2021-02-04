 package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entities.Note;
import com.factory.FactoryProvider;

public class NoteSaveServlet extends HttpServlet
   {
	private static final long serialVersionUID = 1L;
  
    public NoteSaveServlet() {
        super();
      
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			         throws ServletException, IOException 
	{     
		try 
		{	             
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			//call the constructor
			Note note=new Note(title, content, new Date());
			
			//hibernate save
			SessionFactory factory = FactoryProvider.getFactory();
			Session session = factory.openSession();
 			Transaction tx=session.beginTransaction();
			session.save(note);
			tx.commit();
			session.close();
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.println("<h1>Data is saved to database</h1>");
			out.println("<h1><a href='showNotes.jsp'>Show Notes</a></h1>");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
