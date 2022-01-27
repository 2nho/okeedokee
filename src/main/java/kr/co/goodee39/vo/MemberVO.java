package kr.co.goodee39.vo;

public class MemberVO {
	private int mnum;
	private String id;
	private String name;
	private String pw;
	private String address;
	private String email;
	private String phNum;
	private String petOwn;
	private String size;
	private String level;
	private String signupDay;
	private String del;
	
	// 순서
	public int getMnum() {
		return mnum;
	}
	public void setMnum(int mnum) {
		this.mnum = mnum;
	}
	
	// 아이디
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
	
	// 등급 구분
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

	// 이메일
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	
	// 가입일
	public String getSignupDay() {
		return signupDay;
	}
	public void setsignupDay(String signupDay) {
		this.signupDay = signupDay;
	}
	public void setSignupDate(String signupDay) {
		this.signupDay = signupDay;
	}
	
	
}
