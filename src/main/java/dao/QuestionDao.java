package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.Customer;
import vo.Question;

public class QuestionDao {
	
	// removeQuestion (문의글 삭제) 답변 달리기 전까지만 가능
	// 사용하는 곳 : modifyQuestionController	
	public int modifyQuestion(Connection conn, Customer loginCustomer, int questionCode) throws Exception {
		int resultRow = 0;
		String sql = "";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, loginCustomer.getCustomerId());
		stmt.setInt(2, questionCode);
		resultRow = stmt.executeUpdate();
		stmt.close();
		return resultRow;
	}
		
	// removeQuestion (문의글 삭제) 답변 달리기 전까지만 가능
	// 사용하는 곳 : removeQuestionController	
	public int removeQuestion(Connection conn, Customer loginCustomer, int questionCode) throws Exception {
		int resultRow = 0;
		String sql = "DELETE q "
				+ " FROM question q "
				+ "		INNER JOIN orders o "
				+ "		ON q.orders_code = o.order_code "
				+ "WHERE q.question_code = ? AND o.customer_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, questionCode);
		stmt.setString(2, loginCustomer.getCustomerId());
		resultRow = stmt.executeUpdate();
		stmt.close();
		return resultRow;
	}
	
	// addQuestion (문의글 추가)
	// 사용하는 곳 : addQuestionController	
	public int addQuestion(Connection conn, Question addQuestion) throws Exception {
		int resultRow=0;
		String sql = "INSERT INTO question (orders_code, category, question_memo, createdate)"
				+ " VALUES(?,?,?,now())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, addQuestion.getOrderCode());
		stmt.setString(2, addQuestion.getCategory());
		stmt.setString(3, addQuestion.getQuestionMemo());
		resultRow = stmt.executeUpdate();
		return resultRow;
	}

	
	
	// addQuestion (ordersCode조회)
	// 사용하는 곳 : addQuestionController	
	public ArrayList<Question> selectOrdersCode(Connection conn, Customer loginCustomer) throws Exception{
		ArrayList<Question> list = null;
		String sql = "SELECT orders_code ordersCode"
				+ "	 FROM question q"
				+ "		 INNER JOIN orders o"
				+ "		 ON q.orders_code = o.order_code"
				+ "	 WHERE o.customer_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, loginCustomer.getCustomerId());
		ResultSet rs = stmt.executeQuery();
		list = new ArrayList<Question>();
	    while(rs.next()) {
	    	Question q = new Question();
	    	q.setOrderCode(rs.getInt("ordersCode"));
	    	list.add(q);

	    }
		return list;
	}
	
	
	// questionList 출력
	// 사용하는 곳 : questionListController
	public ArrayList<Question> selectQuestionListByPage(Connection conn, int beginRow, int rowPerPage) throws Exception {
		ArrayList<Question> list= new ArrayList<Question>();
		String sql = "SELECT r.rnum rnum, r.question_code questionCode, r.orders_code ordersCode, r.category category, r.question_memo questionMemo, r.createdate createdate\r\n"
				+ "	FROM (SELECT ROW_NUMBER() OVER(ORDER BY createdate DESC) rnum, question_code, orders_code, category, question_memo, createdate FROM question) r \r\n"
				+ "WHERE rnum BETWEEN ? AND ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1,  beginRow);
		stmt.setInt(2,  rowPerPage);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Question q = new Question();
			q.setQuestionCode(rs.getInt("questionCode"));
			q.setOrderCode(rs.getInt("ordersCode"));
			q.setCategory(rs.getString("category"));
			q.setQuestionMemo(rs.getString("questionMemo"));
			q.setCreatedate(rs.getString("createdate"));
			list.add(q);
		}
		return list;
	}
	
	
	// questionList 페이징
	// 사용하는 곳 : questionListController
	public int count(Connection conn) throws Exception{
		int cnt = 0; // 전체 행의 수
		String sql = "SELECT COUNT(*) cnt FROM question";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
	    if(rs.next()) {
	    	cnt = rs.getInt("cnt");
	    }
		return cnt;
	}
}
