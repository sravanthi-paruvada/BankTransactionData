package Transaction;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Transaction")
public class Transaction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "root");
		Statement stmt =con.createStatement(); 
		String que = "select balanceAmount from TransactionDetails2 ORDER BY id DESC LIMIT 1";
		ResultSet resultset1 = stmt.executeQuery(que);
				int total;
		resultset1.next();
		 int amount= resultset1.getInt(1)-1000;
		String que1 = "update transaction SET balanceAmount = ' " + amount + " ' ORDER BY id DESC LIMIT 1";
		 total= stmt.executeUpdate(que1);
         if(total>0)
			{
	  			response.setContentType("text/html");
				PrintWriter pw=response.getWriter();
				pw.println("<script type=\"text/javascript\">");
				pw.println("alert('transaction succesful');");
			    pw.println("</script>");
				RequestDispatcher rd=request.getRequestDispatcher("transactiondata.jsp");
				rd.include(request, response);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}

}
}
