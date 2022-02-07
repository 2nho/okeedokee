package kr.co.goodee39.vo;

public class ReservationVO {
	
	private int rnum;
	private int mnum;
	private String reserName;
	private String content;
	private String reserDate;
	private String kindCd;
	private String sexCd;
	private String age;
	private String specialMark;
	private String processState;
	private String noticeSdt;
	private String happenPlace;
	private String dogImg;
	private String careNm;
	private String careAddr;
	private String careTel;
	private String chargeNm; 
	private String del;
	
	private int start;
	private int count;
	
	
	
	public ReservationVO() {
		this.start = 0;
		this.count = 10;
	}

	
	public int getRnum() {
		return rnum;
	}


	public void setRnum(int rnum) {
		this.rnum = rnum;
	}


	public int getMnum() {
		return mnum;
	}


	public void setMnum(int mnum) {
		this.mnum = mnum;
	}

	public String getReserName() {
		return reserName;
	}


	public void setReserName(String reserName) {
		this.reserName = reserName;
	}


	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReserDate() {
		return reserDate;
	}

	public void setReserDate(String reserDate) {
		this.reserDate = reserDate;
	}

	public String getKindCd() {
		return kindCd;
	}

	public void setKindCd(String kindCd) {
		this.kindCd = kindCd;
	}

	public String getSexCd() {
		return sexCd;
	}

	public void setSexCd(String sexCd) {
		this.sexCd = sexCd;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getSpecialMark() {
		return specialMark;
	}

	public void setSpecialMark(String specialMark) {
		this.specialMark = specialMark;
	}

	public String getProcessState() {
		return processState;
	}

	public void setProcessState(String processState) {
		this.processState = processState;
	}

	public String getNoticeSdt() {
		return noticeSdt;
	}

	public void setNoticeSdt(String noticeSdt) {
		this.noticeSdt = noticeSdt;
	}

	public String getHappenPlace() {
		return happenPlace;
	}

	public void setHappenPlace(String happenPlace) {
		this.happenPlace = happenPlace;
	}

	public String getDogImg() {
		return dogImg;
	}

	public void setDogImg(String dogImg) {
		this.dogImg = dogImg;
	}

	public String getCareNm() {
		return careNm;
	}

	public void setCareNm(String careNm) {
		this.careNm = careNm;
	}

	public String getCareAddr() {
		return careAddr;
	}

	public void setCareAddr(String careAddr) {
		this.careAddr = careAddr;
	}

	public String getCareTel() {
		return careTel;
	}

	public void setCareTel(String careTel) {
		this.careTel = careTel;
	}

	public String getChargeNm() {
		return chargeNm;
	}

	public void setChargeNm(String chargeNm) {
		this.chargeNm = chargeNm;
	}

	public String getDel() {
		return del;
	}

	public void setDel(String del) {
		this.del = del;
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
