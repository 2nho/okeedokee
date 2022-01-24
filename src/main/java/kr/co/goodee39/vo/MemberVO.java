package kr.co.goodee39.vo;

public class MemberVO {
	private String id;
	private String name;
	private String pw;
	private String address;
	private String phNum;
	private String petOwn;
	private String size;
	private String donation;
	private String level;
	private String del;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	// 이름
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	// 비밀번호
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	
	// 주소
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	// 전화번호
	public String getPhNum() {
		return phNum;
	}
	public void setPhNum(String phNum) {
		this.phNum = phNum;
	}
	
	// 보유여부
	public String getPetOwn() {
		return petOwn;
	}
	public void setPetOwn(String petOwn) {
		this.petOwn = petOwn;
	
	}
	
	// 선호 크기
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	
	// 기부액
	public String getDonation() {
		return donation;
	}
	public void setDonation(String donation) {
		this.donation = donation;
	}
	
	// 회원 등급
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	
	// 탈퇴여부
	public String getDel() {
		return del;
	}
	public void setDel(String del) {
		this.del = del;
	}
	
	
}
