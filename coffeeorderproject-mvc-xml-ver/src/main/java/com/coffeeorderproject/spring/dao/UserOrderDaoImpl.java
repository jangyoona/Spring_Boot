package com.coffeeorderproject.spring.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.coffeeorderproject.spring.dto.UserOrderDto;

public class UserOrderDaoImpl implements UserOrderDao {
	
	private Connection connection() throws Exception {
		
		//		Class.forName("oracle.jdbc.driver.OracleDriver");
		//		return DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/xe", "green_cloud", "oracle");
				
				Class.forName("com.mysql.cj.jdbc.Driver");
				return DriverManager.getConnection("jdbc:mysql://3.37.123.170:3306/hollys?serverTimezone=UTC", "hollys", "mysql");
	}
	
	@Override
	public ArrayList<UserOrderDto> selectMyPageUserOrders(String userId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<UserOrderDto> orderList = new ArrayList<>();
		try {
			conn = connection();
			
			// 3. 명령 객체 만들기
			String sql = "SELECT orderid, userid, orderoption, orderdate, orderstatus, orderpayment, couponuse " +
						 "FROM hollys.orders " +
						 "WHERE userid = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			// 4. 명령 실행 ( 결과가 있으면 결과 저장 - select 인 경우 )
			rs = pstmt.executeQuery(); // select - executeQuery로 실행
			
			// 5. 결과가 있으면 결과 처리
			while (rs.next()) {
				UserOrderDto orders = new UserOrderDto();
				orders.setOrderId(rs.getInt(1));
				orders.setUserId(rs.getString(2));
				orders.setOrderOption(rs.getString(3));
				orders.setOrderDate(rs.getDate(4));
				orders.setOrderStatus(rs.getString(5));
				orders.setOrderPayment(rs.getString(6));
				orders.setCouponuse(rs.getBoolean(7));
				orderList.add(orders);
			}
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			// 6. 연결 종료
			try { rs.close(); } catch (Exception ex) {}
			try { pstmt.close(); } catch (Exception ex) {}
			try { conn.close(); } catch (Exception ex) {}
		}
		
		return orderList;
	}


	@Override
	public ArrayList<UserOrderDto> selectUserOrderList(int pageNum, String userId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<UserOrderDto> orderArr = new ArrayList<>();
		
		/*
		1page : 0 ~ 8
		2page : 9 ~ 17
		3page : 18 ~ 27
		*/
		int startNum = pageNum == 1 ? 0 : (pageNum - 1) * 15;
		
		try {
			conn = connection();
			
			// 3. 명령 객체 만들기
			String sql = null;
			
			sql = "SELECT  o.orderstatus, o.orderdate, o.orderid,u.username, p.prodname, od.cartquantity,  "
				+ "o.couponuse, (p.prodprice * od.cartquantity), o.orderpayment "
				+ "FROM orders o "
				+ "INNER JOIN user u ON o.userid = u.userid "
				+ "INNER JOIN orderdetail od ON o.orderid = od.orderid "
				+ "INNER JOIN product p ON od.prodno = p.prodno "
				+ "WHERE u.userid = ? " 
				+ "ORDER BY  o.orderdate DESC, (p.prodprice * od.cartquantity)"
				+ "LIMIT ?, 15  ";
			
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setInt(2, startNum);
			
			// 4. 명령 실행 (결과가 있으면 결과 저장 - select 인 경우)
			rs = pstmt.executeQuery();
			
			// 5. 결과가 있으면 결과 처리
			while (rs.next()) {
				UserOrderDto orders = new UserOrderDto();
				orders.setOrderStatus(rs.getString(1));
				orders.setOrderDate(rs.getDate(2));
				orders.setOrderId(rs.getInt(3));
				orders.setUserName(rs.getString(4));
				orders.setProdName(rs.getString(5));
				orders.setCartQuantity(rs.getInt(6));
				orders.setCouponuse(rs.getBoolean(7));
				orders.setTotalPrice(rs.getInt(8));
				orders.setOrderPayment(rs.getString(9));
				orderArr.add(orders);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 6. 연결 종료
			try { rs.close(); } catch (Exception e) {}
			try { pstmt.close(); } catch (Exception e) {}
			try { conn.close(); } catch (Exception e) {}
		}
		
		return orderArr;
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
			String sql = "SELECT COUNT(orderid) FROM hollys.orders "
					+ "WHERE userid = ?  ";
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
			try {
				rs.close();
			} catch (Exception e) {
			}
			try {
				pstmt.close();
			} catch (Exception e) {
			}
			try {
				conn.close();
			} catch (Exception e) {
			}
		}

		return boardCount;
	}
	
	
	
}
