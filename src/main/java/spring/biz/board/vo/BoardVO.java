package spring.biz.board.vo;

import org.springframework.web.multipart.MultipartFile;

public class BoardVO {
	private int bseq;//p.key
	private String bcontent;
	private String latitude;
	private String longitude;
	private String regdate;
	private String img;
	private String open;
	private int cntlike;
	private String id;
	
	private String ThumbImg;
	private MultipartFile uploadFile;
	
	//생성자
	


	public String getThumbImg() {
		return ThumbImg;
	}
	public void setThumbImg(String thumbImg) {
		ThumbImg = thumbImg;
	}
	
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	
	public BoardVO() {
		super();
	}
	public BoardVO(int bseq, String bcontent, String latitude, String longitude, String regdate, String img,
			String open, int cntlike, String id) {
		super();
		this.bseq = bseq;
		this.bcontent = bcontent;
		this.latitude = latitude;
		this.longitude = longitude;
		this.regdate = regdate;
		this.img = img;
		this.open = open;
		this.cntlike = cntlike;
		this.id = id;
		
		
	}
	//getter, setter
	public int getBseq() {
		return bseq;
	}
	public void setBseq(int bseq) {
		this.bseq = bseq;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
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

	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getOpen() {
		return open;
	}
	public void setOpen(String open) {
		this.open = open;
	}
	public int getCntlike() {
		return cntlike;
	}
	public void setCntlike(int cntlike) {
		this.cntlike = cntlike;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "BoardVO [bseq=" + bseq + ", bcontent=" + bcontent + ", latitude=" + latitude + ", longitude="
				+ longitude + ", regdate=" + regdate + ", img=" + img + ", open=" + open + ", cntlike=" + cntlike
				+ ", id=" + id + "]";
	}
	
	//toString
	
	
	
	
	
}
