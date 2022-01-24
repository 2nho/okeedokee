package kr.co.goodee39.vo;

public class mnwVO {

	private int num;
	private int mnum;
	private String id;
	private String title;
	private String species; 
	private String sex;
	private String characters;
	private String date;
	private String location;
	private String content;
	private String createdate;
	private int bdiv;
	private String hasimg;
	private String fileList;
	private String status;
	private int start;
	private int count;


	//start = first index number
	//count = total count of list on page
	public mnwVO() {
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
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSpecies() {
		return species;
	}

	public void setSpecies(String species) {
		this.species = species;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getCharacters() {
		return characters;
	}

	public void setCharacters(String characters) {
		this.characters = characters;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCreatedate() {
		return createdate;
	}

	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}

	public int getBdiv() {
		return bdiv;
	}

	public void setBdiv(int bdiv) {
		this.bdiv = bdiv;
	}
	

	public String getHasimg() {
		return hasimg;
	}


	public void setHasimg(String hasimg) {
		this.hasimg = hasimg;
	}


	public String getFileList() {
		return fileList;
	}

	public void setFileList(String fileList) {
		this.fileList = fileList;
	}
	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
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
