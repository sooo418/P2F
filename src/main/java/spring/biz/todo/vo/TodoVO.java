package spring.biz.todo.vo;

public class TodoVO {
	private int tseq;
	private String tcontent;
	private String latitude;
	private String longitude;
	private String tododate;
	private int priority;
	private String sharing;
	private String id;
	
	public TodoVO() {
	}

	public TodoVO(int tseq, String tcontent, String latitude, String longitude, String tododate, int priority,
			String sharing, String id) {
		super();
		this.tseq = tseq;
		this.tcontent = tcontent;
		this.latitude = latitude;
		this.longitude = longitude;
		this.tododate = tododate;
		this.priority = priority;
		this.sharing = sharing;
		this.id = id;
	}

	public int getTseq() {
		return tseq;
	}

	public void setTseq(int tseq) {
		this.tseq = tseq;
	}

	public String getTcontent() {
		return tcontent;
	}

	public void setTcontent(String tcontent) {
		this.tcontent = tcontent;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public String getTododate() {
		return tododate;
	}

	public void setTododate(String tododate) {
		this.tododate = tododate;
	}

	public int getPriority() {
		return priority;
	}

	public void setPriority(int priority) {
		this.priority = priority;
	}

	public String getSharing() {
		return sharing;
	}

	public void setSharing(String sharing) {
		this.sharing = sharing;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "TodoVO [tseq=" + tseq + ", tcontent=" + tcontent + ", latitude=" + latitude + ", longitude=" + longitude
				+ ", tododate=" + tododate + ", priority=" + priority + ", sharing=" + sharing + ", id=" + id + "]";
	}
	
	
	
}

