package kr.co.goodee39.vo;

public class NoticeVO {
	private int num;
	private String title;
	private String content;
	private String date;
	private String name;
	private String bdiv;
	private String del;
	private String report;
	private String state;
	private int start;
	private int count;
	
	public NoticeVO() {
		this.start = 0;
		this.count = 10;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getDel() {
		return del;
	}
	public void setDel(String del) {
		this.del = del;
	}
	public String getReport() {
		return report;
	}
	public void setReport(String report) {
		this.report = report;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBdiv() {
		return bdiv;
	}
	public void setBdiv(String bdiv) {
		this.bdiv = bdiv;
	}

	
}
