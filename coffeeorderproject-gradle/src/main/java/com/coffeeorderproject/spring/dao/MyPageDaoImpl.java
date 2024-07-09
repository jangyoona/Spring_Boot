package com.coffeeorderproject.spring.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import org.springframework.stereotype.Repository;

import com.coffeeorderproject.spring.dto.UserDto;

@Repository
public class MyPageDaoImpl implements MyPageDao {
	
	private Connection connection() throws Exception {
			
	//		Class.forName("oracle.jdbc.driver.OracleDriver");
	//		return DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/xe", "green_cloud", "oracle");
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			return DriverManager.getConnection("jdbc:mysql://3.37.123.170:3306/hollys?serverTimezone=UTC", "hollys", "mysql");
		}

	@Override
	public void updateUserInfo(UserDto user) {

		Connection connection = null;
		PreparedStatement pstmt = null;
		
		try {

			connection = connection();
			
			// 3. 명령 객체 만들기
			String sql = "UPDATE user SET userpw = ?, usernickname = ?, userphone = ?, useremail = ? WHERE userid = ? ";
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, user.getUserPw());
			pstmt.setString(2, user.getUserNickname());
			pstmt.setString(3, user.getUserPhone());
			pstmt.setString(4, user.getUserEmail());
			pstmt.setString(5, user.getUserId());
			
			// 4. 명령 실행
			pstmt.executeUpdate();			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 6. 연결 종료
			try { pstmt.close(); } catch (Exception e) {}
			try { connection.close(); } catch (Exception e) {}
		}
	}	
}