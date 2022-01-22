package kr.co.goodee39.vo;

public class ImageVO {

	private int num;
	private int bdiv;
	private int bnum;
	private String serverName;
	private String localName;
	
	public ImageVO() {
		// TODO Auto-generated constructor stub
	}
	
	

	public ImageVO(String serverName, String localName) {
		this.serverName = serverName;
		this.localName = localName;
	}



	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getBdiv() {
		return bdiv;
	}

	public void setBdiv(int bdiv) {
		this.bdiv = bdiv;
	}

	public int getBnum() {
		return bnum;
	}

	public void setBnum(int bnum) {
		this.bnum = bnum;
	}

	
	public String getServerName() {
		return serverName;
	}

	public void setServerName(String serverName) {
		this.serverName = serverName;
	}
	
	public String getLocalName() {
		return localName;
	}

	public void setLocalName(String localName) {
		this.localName = localName;
	}

}
