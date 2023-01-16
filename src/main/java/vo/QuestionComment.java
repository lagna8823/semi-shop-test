package vo;

public class QuestionComment {
	private int commentCode;
	private int questionCode;
	private String empId;
	private String commentMemo;
	private String createdate;
	
	public QuestionComment() {
		super();
	}
	
	public QuestionComment(int commentCode, int questionCode, String empId, String commentMemo, String createdate) {
		super();
		this.commentCode = commentCode;
		this.questionCode = questionCode;
		this.empId = empId;
		this.commentMemo = commentMemo;
		this.createdate = createdate;
	}

	@Override
	public String toString() {
		return "QuestionComment [commentCode=" + commentCode + ", questionCode=" + questionCode + ", empId=" + empId
				+ ", commentMemo=" + commentMemo + ", createdate=" + createdate + "]";
	}

	public int getCommentCode() {
		return commentCode;
	}

	public void setCommentCode(int commentCode) {
		this.commentCode = commentCode;
	}

	public int getQuestionCode() {
		return questionCode;
	}

	public void setQuestionCode(int questionCode) {
		this.questionCode = questionCode;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public String getCommentMemo() {
		return commentMemo;
	}

	public void setCommentMemo(String commentMemo) {
		this.commentMemo = commentMemo;
	}

	public String getCreatedate() {
		return createdate;
	}

	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	
	
}
