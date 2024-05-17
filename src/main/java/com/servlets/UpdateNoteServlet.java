package com.servlets;

import java.io.IOException;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Notes;
import com.helper.FactoryProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/update")
public class UpdateNoteServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			int id = Integer.parseInt(req.getParameter("id"));
			
			String title = req.getParameter("titleupdate");
			
			
			String content = req.getParameter("contentupdate");
			
			//System.out.println(title);
			
			//System.out.println(content);
			
			
			Session session = FactoryProvider.getFactory().openSession();
			
			Notes notes = session.get(Notes.class, id);
			
			Transaction beginTransaction = session.beginTransaction();
			
			
			notes.setId(id);
			
			notes.setTitle(title);
			
			notes.setContent(content);
			
			
			session.persist(notes);
			
			beginTransaction.commit();
			
			session.close();
			
			resp.sendRedirect("show_notes.jsp");
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
