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
import org.springframework.stereotype.Component;

import com.mycompany.myapp.dto.Member;

@Component
public class MemberDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public void join(Member member){
		String sql = ""
				+ "insert into Members "
				+ "(member_id, member_pw, member_name) "
				+ "values (?,?,?)";
		
		jdbcTemplate.update(new PreparedStatementCreator(){

			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				PreparedStatement pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, member.getId());
				pstmt.setString(2, member.getPw());
				pstmt.setString(3, member.getName());
				
				return pstmt;
			}
		});
	}
	
	public int updateInfo(Member member){
		String sql = ""
				+ "update Members "
				+ "set member_nickname = ?, member_email = ?, member_tel = ? "
				+ "where member_id=?";
		int rows = jdbcTemplate.update(sql, member.getNickName(), member.getEmail(), member.getTel(), member.getId());

		return rows;
	}
	
	public Member selectById(String memberId) {
		
		String sql = "select * from Members where member_id = ?";
		List <Member> list = jdbcTemplate.query(
				sql,
				new Object[]{memberId},
				new RowMapper<Member>(){
					@Override
					public Member mapRow(ResultSet rs, int rowNo) throws SQLException  {
						Member member = new Member();
						
						member.setId(rs.getString("member_id"));
						member.setName(rs.getString("member_name"));
						member.setNickName(rs.getString("member_nickname"));
						member.setEmail(rs.getString("member_email"));
						member.setTel(rs.getString("member_tel"));
						member.setWin(rs.getInt("member_win"));
						member.setLose(rs.getInt("member_lose"));
						
						return member;
					}				
				}
			);
		if(list.isEmpty()){
			return null;
		}else{
			Member member = list.get(0);
			return member;
		}
	}
	
	public String findId(Member member) {
		
		String sql = "select member_id from Members where member_name = ? and member_email = ?";
		List <String> list = jdbcTemplate.query(
				sql,
				new Object[]{member.getName(), member.getEmail()},
				new RowMapper<String>(){
					@Override
					public String mapRow(ResultSet rs, int rowNo) throws SQLException  {
						String id = rs.getString("member_id");
						
						return id;
					}				
				}
			);
		if(list.isEmpty()){
			return null;
		}else{
			String id = list.get(0);
			return id;
		}
	}
	
	public String findPw(Member member) {
		
		String sql = "select member_pw from Members where member_id = ? and member_email = ?";
		List <String> list = jdbcTemplate.query(
				sql,
				new Object[]{member.getId(), member.getEmail()},
				new RowMapper<String>(){
					@Override
					public String mapRow(ResultSet rs, int rowNo) throws SQLException  {
						String pw = rs.getString("member_pw");
						
						return pw;
					}				
				}
			);
		if(list.isEmpty()){
			return null;
		}else{
			String pw = list.get(0);
			return pw;
		}
	}
	
	public int updateRecord(String id, String result){
		String sql = "";
		if(result.equals("win")){
			sql = "update Members set member_win = member_win + 1 where member_id=?";
		}else if(result.equals("lose")){
			sql = "update Members set member_lose = member_lose + 1 where member_id=?";
		}
		int rows = jdbcTemplate.update(sql, id);
		
		return rows;
	}
}
