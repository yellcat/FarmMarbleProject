package com.mycompany.myapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mycompany.myapp.dao.CommentDao;
import com.mycompany.myapp.dto.Comment;

@Component
public class CommentService {
	@Autowired
	private CommentDao commentDao;
	
	public void add(Comment comment) {
		commentDao.insert(comment);		
		
		}
	
	public List<Comment> getPage(int pageNo, int rowsPerPage) {
		List<Comment> list = commentDao.selectByPage(pageNo, rowsPerPage);
		return list;		
		
	}
	
	public Comment getComment(int boardNo) {
		Comment comment = commentDao.selectbyBn(boardNo);
		return comment;
	}
	
	public void modify(Comment comment) {
		commentDao.update(comment);
	}
	
	public void remove(int no) {
		commentDao.delete(no);
	}
	
	public int getTotalCommentNo() {
		int rows = commentDao.selectCount();
		return rows;
	}
}
