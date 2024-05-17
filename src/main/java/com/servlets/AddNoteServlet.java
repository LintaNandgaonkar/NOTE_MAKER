package com.servlets;

import java.io.IOException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entities.Notes;
import com.helper.FactoryProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class AddNoteServlet extends HttpServlet  {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		try {
			
			String title = req.getParameter("title");
			
			String content = req.getParameter("content");
			
			Notes notes = new Notes(title, content);
			
			SessionFactory factory = FactoryProvider.getFactory();
			
			Session session = factory.openSession();
			
			Transaction transaction = session.beginTransaction();
			
			
			session.persist(notes);
			
			transaction.commit();
			
			session.close();
			
			resp.sendRedirect("show_notes.jsp");
			
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
	}

}
