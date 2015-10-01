package com.mycompany.myapp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.stereotype.Component;

import com.mycompany.myapp.dto.Member;

@Component
public class MemberDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public void join(Member member){
		String sql = ""
				+ "insert into Members "
				+ "(member_id, member_password, member_name, member_grade) "
				+ "values (?,?,?,?)";
		jdbcTemplate.update(new PreparedStatementCreator(){

			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement pstmt = con.prepareStatement(sql);
				pstmt.setString(1, member.getId());
				pstmt.setString(2, member.getPw());
				pstmt.setString(3, member.getName());
				pstmt.setString(4, "user");
				return pstmt;
			}
		});
	}
	
	public int update(Member member){
		String sql = ""
				+ "update Members "
				+ "set member_nickname, member_email, member_tel "
				+ "where member_id=?";
		int rows = jdbcTemplate.update(sql, member.getNickName(), member.getEmail(), member.getTel());

		return rows;
	}
}
