package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Transaction;
import org.hibernate.Session;

import com.entities.Note;
import com.factory.FactoryProvider;

public class Delete extends HttpServlet
{
	private static final long serialVersionUID = 1L;
  
    public Delete() 
    {
        super();
     
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		try 
		{
			int id=Integer.parseInt(request.getParameter("id"));
			Session s=FactoryProvider.getFactory().openSession();
			Transaction tx=s.beginTransaction();
			
			//loading the object
			Note note=s.get(Note.class,id);
			
			s.delete(note);
			tx.commit();
			s.close();
			
			response.sendRedirect("showNotes.jsp");
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		
	}


}
