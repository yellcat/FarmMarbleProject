package com.mycompany.myapp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Component;

import com.mycompany.myapp.dto.Comment;

@Component
public class CommentDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public Integer insert(Comment comment) {
		Integer pk = null;
		String sql = "insert into Comments (comment_board_no, comment_writer, comment_content, comment_date) values(?, ?, ?, now())";
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(new PreparedStatementCreator() {

			@Override
			public PreparedStatement createPreparedStatement(Connection conn) throws SQLException {
				PreparedStatement pstmt = conn.prepareStatement(sql, new String[] {"comment_no"});
				pstmt.setInt(1, comment.getBoardNo());
				pstmt.setString(2, comment.getWriter());
				pstmt.setString(3, comment.getContent());				
				return pstmt;
			}
			
		}, keyHolder);
		Number keyNumber = keyHolder.getKey();
		pk = keyNumber.intValue();
		return pk;
	}
	
	public List<Comment> selectByPage(int pageNo, int rowsPerPage){
		String sql = "";
		sql += "select comment_writer, comment_content, comment_date ";
		sql += "from Comments ";
		sql += "order by comment_date desc ";
		sql += "limit ?,?";
		
		List<Comment> list = jdbcTemplate.query(
				sql,
				new Object[] {(pageNo-1)*rowsPerPage, rowsPerPage},
				new RowMapper<Comment>() {

					@Override
					public Comment mapRow(ResultSet rs, int rowNum) throws SQLException {
						Comment comment = new Comment();
						comment.setWriter(rs.getString("comment_writer"));
						comment.setContent(rs.getString("comment_content"));
						comment.setDate(rs.getDate("comment_date"));
						return comment;
					}					
				}
		);
		return list;
	}
	
	public Comment selectbyBn(int boardNo) {
		String sql = "select * from Comments where comment_board_no=?";
		Comment comment = jdbcTemplate.queryForObject(
				sql,
				new Object[] {boardNo},
				new RowMapper<Comment>() {

					@Override
					public Comment mapRow(ResultSet rs, int rowNum) throws SQLException {
						Comment comment = new Comment();
						comment.setNo(rs.getInt("comment_no"));
						comment.setBoardNo(rs.getInt("comment_board_no"));
						comment.setWriter(rs.getString("comment_writer"));
						comment.setContent(rs.getString("comment_content"));
						comment.setDate(rs.getDate("comment_date"));
						return comment;
					}					
				}
		);
		return comment;
	}
	
	public int update(Comment comment) {
		String sql = "update Comments set comment_content=? where comment_board_no=?";
		int rows = jdbcTemplate.update(
				sql,
				comment.getContent(),
				comment.getBoardNo()
		);
		return rows;				
	}
	
	public int delete(int no) {
		String sql = "delete from Comments where comment_no=?";
		int rows = jdbcTemplate.update(
				sql,
				no
		);
		return rows;
	}
	
	public int selectCount() {
		String sql = "select count(*) from Comments";
		int rows = jdbcTemplate.queryForObject(sql, Integer.class);
		return rows;
	}
	
}
