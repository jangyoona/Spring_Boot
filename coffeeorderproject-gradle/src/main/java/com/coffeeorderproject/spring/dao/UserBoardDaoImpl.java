package com.coffeeorderproject.spring.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.coffeeorderproject.spring.dto.BoardDto;

public class UserBoardDaoImpl implements UserBoardDao {
	
	private Connection connection() throws Exception {

//		Class.forName("oracle.jdbc.driver.OracleDriver");
//		return DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/xe", "green_cloud", "oracle");
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		return DriverManager.getConnection("jdbc:mysql://3.37.123.170:3306/hollys?serverTimezone=UTC", "hollys", "mysql");
	}
	@Override
	public ArrayList<BoardDto> selectUserBoard(int pageNum, String userId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<BoardDto> boardArr = new ArrayList<>();
		
		/*
		1page : 0 ~ 14
		2page : 15 ~ 29
		3page : 30 ~ 44
		*/
		int startNum = pageNum == 1 ? 0 : (pageNum - 1) * 15;
		
		try {
			conn = connection();
			
			// 3. 명령 객체 만들기
			String sql = null;
			
			sql = "SELECT b.boardno, b.userid, b.boardcategoryid, b.boardtitle, b.boarddate, b.boardmodifydate, b.boardcontent, b.boarddelete, p.prodname  "
					+ "FROM hollys.board b "
					+ "LEFT JOIN productreview pr ON b.boardno = pr.boardno "
					+ "LEFT JOIN product p ON p.prodno = pr.prodno "
					+ "WHERE userid = ? AND boardcategoryid = 1 AND boarddelete = false "
					+ "ORDER BY boarddate DESC "
					+ "LIMIT ?, 15  " ;
			
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setInt(2, startNum);
			
			// 4. 명령 실행 (결과가 있으면 결과 저장 - select 인 경우)
			rs = pstmt.executeQuery();
			
			// 5. 결과가 있으면 결과 처리
			while (rs.next()) {
				BoardDto user = new BoardDto();
				user.setBoardNo(rs.getInt(1));
				user.setUserId(rs.getString(2));
				user.setBoardcategoryId(rs.getInt(3));
				user.setBoardTitle(rs.getString(4));
				user.setBoardDate(rs.getDate(5));
				user.setBoardModifyDate(rs.getTimestamp(6));
				user.setBoardContent(rs.getString(7));
				user.setBoardDelete(rs.getBoolean(8));
				user.setProdName(rs.getString(9));
				
				boardArr.add(user);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 6. 연결 종료
			try { rs.close(); } catch (Exception e) {}
			try { pstmt.close(); } catch (Exception e) {}
			try { conn.close(); } catch (Exception e) {}
		}
		
		return boardArr;
	}

	@Override
	public int getBoardCount(String userId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int boardCount = 0;

		try {
			conn = connection();

			// 3. 명령 객체 만들기
			String sql = "SELECT COUNT(boardno) FROM hollys.board "
					+ "WHERE userid = ? AND boardcategoryid = 1 AND boarddelete = false ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			// 4. 명령 실행 (결과가 있으면 결과 저장 - select 인 경우)
			rs = pstmt.executeQuery();

			// 5. 결과가 있으면 결과 처리
			if (rs.next()) {
				boardCount = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 6. 연결 종료
			try { rs.close(); } catch (Exception e) {}
			try { pstmt.close(); } catch (Exception e) {}
			try { conn.close(); } catch (Exception e) {}
		}
	

		return boardCount;
	}

	@Override
	public ArrayList<BoardDto> selectAllUserBoardList(String userId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<BoardDto> userBoardList = new ArrayList<>();

		try {
			conn = connection();

			// 3. 명령 객체 만들기
			String sql = null;

			sql = "SELECT boardno, userid, boardcategoryid, boardtitle, boarddate, boardmodifydate, boardcontent, boarddelete  "
					+ "FROM hollys.board WHERE userid = ? AND boardcategoryid = 1 AND boarddelete = 0 ";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);

			// 4. 명령 실행 (결과가 있으면 결과 저장 - select 인 경우)
			rs = pstmt.executeQuery();

			// 5. 결과가 있으면 결과 처리
			while (rs.next()) {
				BoardDto user = new BoardDto();
				user.setBoardNo(rs.getInt(1));
				user.setUserId(rs.getString(2));
				user.setBoardcategoryId(rs.getInt(3));
				user.setBoardTitle(rs.getString(4));
				user.setBoardDate(rs.getDate(5));
				user.setBoardModifyDate(rs.getTimestamp(6));
				user.setBoardContent(rs.getString(7));
				user.setBoardDelete(rs.getBoolean(8));

				userBoardList.add(user);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 6. 연결 종료
			try { rs.close(); } catch (Exception e) {}
			try { pstmt.close(); } catch (Exception e) {}
			try { conn.close(); } catch (Exception e) {}
		}
		return userBoardList;
	}
}
