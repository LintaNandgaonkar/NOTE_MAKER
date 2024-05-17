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

@WebServlet("/logout")
public class DeleteNoteServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			int id =  Integer.parseInt(req.getParameter("id"));
			
			Session session = FactoryProvider.getFactory().openSession();
			
			Notes notes = session.get(Notes.class, id);
			
			Transaction beginTransaction = session.beginTransaction();
			
			session.remove(notes);
			
			beginTransaction.commit();
			
			session.close();
			
			resp.sendRedirect("show_notes.jsp");
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
