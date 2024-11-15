package com.jtgj.finalProject.faq.dto;

public class noticeDTO {
	
	private String user_id;
	private String user_name;
	private int notice_no;
	private String notice_title;
	private String notice_content;
	private String notice_date;
	private String notice_del_yn;
	
	public noticeDTO() {
		super();
	}

	public noticeDTO(String user_id, String user_name, int notice_no, String notice_title, String notice_content,
			String notice_date, String notice_del_yn) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.notice_no = notice_no;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_date = notice_date;
		this.notice_del_yn = notice_del_yn;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public int getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public String getNotice_date() {
		return notice_date;
	}

	public void setNotice_date(String notice_date) {
		this.notice_date = notice_date;
	}

	public String getNotice_del_yn() {
		return notice_del_yn;
	}

	public void setNotice_del_yn(String notice_del_yn) {
		this.notice_del_yn = notice_del_yn;
	}

	@Override
	public String toString() {
		return "noticeDTO [user_id=" + user_id + ", user_name=" + user_name + ", notice_no=" + notice_no
				+ ", notice_title=" + notice_title + ", notice_content=" + notice_content + ", notice_date="
				+ notice_date + ", notice_del_yn=" + notice_del_yn + "]";
	}

}
