package com.mycompany.myapp.dao;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.mycompany.myapp.ApplicationContextLoader;
import com.mycompany.myapp.dto.Comment;

public class CommentDaoTest extends ApplicationContextLoader {
	
	@Autowired
	private CommentDao commentDao;
	
	@Test
	public void testInsert() {
		Comment comment = new Comment();
		comment.setBoardNo(1);
		comment.setWriter("testID");
		comment.setContent("content1");
		Integer no = commentDao.insert(comment);
		Assert.assertNotNull(no);
		
	}
}
