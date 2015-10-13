package com.mycompany.myapp.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Board {
	private int board_no;
	private String board_title;
	private String board_writer;
	private String board_membernickname;
	private Date board_date;
	private int board_hitcount;
	private String board_content;
	private String board_file_system_name;
	private String board_original_file_name;
	private String board_content_type;
	private MultipartFile attach;
	
	
	public MultipartFile getAttach() {
		return attach;
	}
	
	public void setAttach(MultipartFile attach) {
		this.attach = attach;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_writer() {
		return board_writer;
	}
	public void setBoard_writer(String board_writer) {
		this.board_writer = board_writer;
	}
	public Date getBoard_date() {
		return board_date;
	}
	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}
	public int getBoard_hitcount() {
		return board_hitcount;
	}
	public void setBoard_hitcount(int board_hitcount) {
		this.board_hitcount = board_hitcount;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getBoard_file_system_name() {
		return board_file_system_name;
	}
	public void setBoard_file_system_name(String board_filesystem_name) {
		this.board_file_system_name = board_filesystem_name;
	}
	public String getBoard_original_file_name() {
		return board_original_file_name;
	}
	public void setBoard_original_file_name(String board_original_file_name) {
		this.board_original_file_name = board_original_file_name;
	}
	public String getBoard_content_type() {
		return board_content_type;
	}
	public void setBoard_content_type(String board_content_type) {
		this.board_content_type = board_content_type;
	}
	public String getBoard_membernickname() {
		return board_membernickname;
	}
	public void setBoard_membernickname(String board_membernickname) {
		this.board_membernickname = board_membernickname;
	}
	
}
