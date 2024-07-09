package com.coffeeorderproject.spring.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.coffeeorderproject.spring.dto.UserCouponDto;
import com.coffeeorderproject.spring.dto.UserDto;


public class CouponDaoImpl implements CouponDao {
	
	
	private Connection connection() throws Exception {
		
		//		Class.forName("oracle.jdbc.driver.OracleDriver");
		//		return DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/xe", "green_cloud", "oracle");
				
				Class.forName("com.mysql.cj.jdbc.Driver");
				return DriverManager.getConnection("jdbc:mysql://3.37.123.170:3306/hollys?serverTimezone=UTC", "hollys", "mysql");
	}
	
	@Override
	public ArrayList<UserCouponDto> selectCouponList(UserDto user) { // 쿠폰 리스트 조회
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			ArrayList<UserCouponDto> couponList = new ArrayList<>();
			
			try {
				conn = connection();
				
				// 3. 명령 객체 만들기
				String sql = "SELECT * FROM coupon WHERE userid = ? AND couponactive = 0 AND DATE(couponlastdate) >= CURDATE()";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, user.getUserId());
				
				// 4. 명령 실행 ( 결과가 있으면 결과 저장 - select 인 경우 )
				rs = pstmt.executeQuery(); // select - executeQuery로 실행
				
				// 5. 결과가 있으면 결과 처리
				while (rs.next()) {
					UserCouponDto coupon = new UserCouponDto();
					coupon.setCouponId(rs.getInt(1));
					coupon.setUserId(rs.getString(2));
					coupon.setCouponDiscount(rs.getInt(3));
					coupon.setCouponStartDate(rs.getDate(4));
					coupon.setCouponLastDate(rs.getDate(5));
					coupon.setCouponActive(rs.getBoolean(6));
					couponList.add(coupon);
				}
				
			} catch (Exception ex) {
				ex.printStackTrace();
			} finally {
				// 6. 연결 종료
				try { rs.close(); } catch (Exception ex) {}
				try { pstmt.close(); } catch (Exception ex) {}
				try { conn.close(); } catch (Exception ex) {}
			}
			
			return couponList;
		}

	@Override
	public ArrayList<UserCouponDto> selectUserCouponList(String userId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<UserCouponDto> couponList = new ArrayList<>();
		
		try {
			conn = connection();
			
			// 3. 명령 객체 만들기 // , COUNT(userid)
			String sql = "SELECT * FROM coupon "
					+ "WHERE userid = ? AND couponactive = 0";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			
			// 4. 명령 실행 ( 결과가 있으면 결과 저장 - select 인 경우 )
			rs = pstmt.executeQuery(); // select - executeQuery로 실행
			
			// 5. 결과가 있으면 결과 처리
			while (rs.next()) {
				UserCouponDto coupon = new UserCouponDto();
				coupon.setCouponId(rs.getInt(1));
				coupon.setUserId(rs.getString(2));
				coupon.setCouponDiscount(rs.getInt(3));
				coupon.setCouponStartDate(rs.getDate(4));
				coupon.setCouponLastDate(rs.getDate(5));
				coupon.setCouponActive(rs.getBoolean(6));
				couponList.add(coupon);
			}
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			// 6. 연결 종료
			try { rs.close(); } catch (Exception ex) {}
			try { pstmt.close(); } catch (Exception ex) {}
			try { conn.close(); } catch (Exception ex) {}
		}
		
		return couponList;
	}
		
		
	}

	

