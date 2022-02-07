package kr.co.goodee39.vo;

public class volunteerVO {

	private int num;
	private int mnum;
	private String id;
	private int bnum;
	private String careName;
	private int dateFrom;
	private int dateTo;
	private String createdate;
	private int start;
	private int count;
	
	public volunteerVO() {
		this.start = 0;
		this.count = 5;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getMnum() {
		return mnum;
	}

	public void setMnum(int mnum) {
		this.mnum = mnum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getBnum() {
		return bnum;
	}

	public void setBnum(int bnum) {
		this.bnum = bnum;
	}

	public String getCareName() {
		return careName;
	}

	public void setCareName(String careName) {
		this.careName = careName;
	}

	public int getDateFrom() {
		return dateFrom;
	}

	public void setDateFrom(int dateFrom) {
		this.dateFrom = dateFrom;
	}

	public int getDateTo() {
		return dateTo;
	}

	public void setDateTo(int dateTo) {
		this.dateTo = dateTo;
	}
	

	public String getCreatedate() {
		return createdate;
	}

	public void setCreatedate(String createdate) {
		this.createdate = createdate;
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
	
	
}
