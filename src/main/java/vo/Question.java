package vo;

public class Question {
	private int questionCode;
	private int orderCode;
	private String category;
	private String questionMemo;
	private String createdate;
	
	public Question() {
		super();
	}

	public Question(int questionCode, int orderCode, String category, String questionMemo, String createdate) {
		super();
		this.questionCode = questionCode;
		this.orderCode = orderCode;
		this.category = category;
		this.questionMemo = questionMemo;
		this.createdate = createdate;
	}
	
	@Override
	public String toString() {
		return "Question [questionCode=" + questionCode + ", orderCode=" + orderCode + ", category=" + category
				+ ", questionMemo=" + questionMemo + ", createdate=" + createdate + "]";
	}
	
	public int getQuestionCode() {
		return questionCode;
	}

	public void setQuestionCode(int questionCode) {
		this.questionCode = questionCode;
	}

	public int getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(int orderCode) {
		this.orderCode = orderCode;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getQuestionMemo() {
		return questionMemo;
	}

	public void setQuestionMemo(String questionMemo) {
		this.questionMemo = questionMemo;
	}

	public String getCreatedate() {
		return createdate;
	}

	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
		
	
}
