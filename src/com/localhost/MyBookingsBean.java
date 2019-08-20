package com.localhost;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.sql.Date;

public class MyBookingsBean
{
	private String bid;
	private String username;
	private String bookingdate;
	private String checkin;
	private String checkout;
	private String hid;
	private String roomno;
	private String mobileno;
	public String getBid() {
		return bid;
	}
	public void setBid(String bid) {
		this.bid = bid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getBookingdate() {
		return bookingdate;
	}
	public void setBookingdate(String bookingdate) {
		this.bookingdate = bookingdate;
	}
	public String getCheckin() {
		return checkin;
	}
	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}
	public String getCheckout() {
		return checkout;
	}
	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}
	public String getHid() {
		return hid;
	}
	public void setHid(String hid) {
		this.hid = hid;
	}
	public String getRoomno() {
		return roomno;
	}
	public void setRoomno(String roomno) {
		this.roomno = roomno;
	}
	public String getMobileno() {
		return mobileno;
	}
	public void setMobileno(String mobileno) {
		this.mobileno = mobileno;
	}
	
	public MyBookingsBean(String bid,String username,String bookingdate,String checkin,String checkout,String hid,String roomno,String mobileno)
	{
		
		this.bid = bid;
		this.username = username;
		this.bookingdate = bookingdate;
		this.checkin = checkin;
		this.checkout= checkout;
		this.hid = hid;
		this.roomno = roomno;
		this.mobileno = mobileno; 
		
		
		
	}
	public static String date(Date dat)
	{
		String result="";
		SimpleDateFormat df = new SimpleDateFormat("YYYY-MM-dd");
		result = df.format(dat);
		
		return result;
		
	}
	public static ArrayList<MyBookingsBean> getMyBookings(String username)
	{
		
		ArrayList<MyBookingsBean> list = new ArrayList<MyBookingsBean>();
		String bdate="",cindate="",coutdate="";
		try {
		Connection c = JDBC01.getConnections();
		PreparedStatement pst = c.prepareStatement("select * from bookings where username = ?");
		pst.setString(1,username);
		System.out.println(username);
		System.out.println("After psts");
		ResultSet rs = pst.executeQuery();
		while(rs.next())
		{
			bdate = date(rs.getDate(3));
			cindate = date(rs.getDate(4));
			coutdate = date(rs.getDate(5));
			System.out.println(bdate);
			System.out.println("inside while");
			list.add(new MyBookingsBean(rs.getString(1),rs.getString(2),bdate,cindate,coutdate,rs.getString(6),rs.getString(7),rs.getString(8)));
		}
		} 
		catch (Exception e) 
		{
			
			e.printStackTrace();
		}
		
		
		
		return list;
	}

}
