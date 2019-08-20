package com.localhost;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

public class MyHotels 
{
	private String hid;
	private String hotelname;
	private String address;
	private String city;
	private String description;
	private String contactno;
	private ArrayList<String> roomsavail;
	private int pricesingleroom;
	private int pricedoubleroom;
	private int pricefamilyroom;

	public MyHotels(String hid, String hotelname, String address, String city, String description, String contactno,
			ArrayList<String> roomsavail,int pricesingleroom,int pricedoubleroom,int pricefamilyroom)
	{
		
		this.hid = hid;
		this.hotelname = hotelname;
		this.address = address;
		this.city = city;
		this.description = description;
		this.contactno = contactno;
		this.roomsavail = roomsavail;
		this.pricesingleroom = pricesingleroom;
		this.pricedoubleroom = pricedoubleroom;
		this.pricefamilyroom = pricefamilyroom;
	}
	public void setPricedoubleroom(int pricedoubleroom) {
		this.pricedoubleroom = pricedoubleroom;
	}

	public int getPricefamilyroom() {
		return pricefamilyroom;
	}

	public void setPricefamilyroom(int pricefamilyroom) {
		this.pricefamilyroom = pricefamilyroom;
	}

	
	public void setContactno(String contactno) {
		this.contactno = contactno;
	}

	
	public String getHid() {
		return hid;
	}


	public void setHid(String hid) {
		this.hid = hid;
	}


	public String getHotelname() {
		return hotelname;
	}


	public void setHotelname(String hotelname) {
		this.hotelname = hotelname;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getCity() {
		return city;
	}


	public void setCity(String city) {
		this.city = city;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public ArrayList<String> getRoomsavail() {
		return roomsavail;
	}


	public void setRoomsavail(ArrayList<String> roomsavail) {
		this.roomsavail = roomsavail;
	}
	
	public String getContactno() {
		return contactno;
	}
	public int getPricesingleroom() {
		return pricesingleroom;
	}

	public void setPricesingleroom(int pricesingleroom) {
		this.pricesingleroom = pricesingleroom;
	}

	public int getPricedoubleroom() {
		return pricedoubleroom;
	}
	
	
	public static HashMap<String,MyHotels> getHotels(String city,Date cindate,Date  coutdate,String roomtype)
	{
		
		HashMap<String,MyHotels> map = new HashMap<String,MyHotels>();
		ArrayList<String> temproomno=null;
		String temphid="";
		int pricesingleroom=0,pricedoubleroom=0,pricefamilyroom=0;
		MyHotels obj=null;
		try {
			System.out.println(city + " " + cindate + "  " + roomtype+"&&&&&&&&&&&");
			Connection c = JDBC01.getConnections();
			PreparedStatement pst2=null;
			PreparedStatement pst1 = c.prepareStatement("select hid,roomno from rooms where (hid,roomno) not in(select hid,roomno from bookings where (checkin < ? And checkout> ?) OR(checkin between ?  And ?) OR (checkout between ?  And ?)) and  hid in(select hid from hotels where city=?) and roomtype=?");
			pst1.setDate(1,cindate);
			pst1.setDate(2,coutdate);
			pst1.setDate(3,cindate);
			pst1.setDate(4,coutdate);
			pst1.setDate(5,cindate);
			pst1.setDate(6,coutdate);
			pst1.setString(7,city);
			pst1.setString(8,roomtype);
			ResultSet rs1 = pst1.executeQuery();
			ResultSet rs2=null;
			while(rs1.next())
			{
				temphid =	rs1.getString("hid"); 
				System.out.println("Inside while");
				if(map.containsKey(temphid))
				{
					map.get(temphid).roomsavail.add(rs1.getString("roomno"));
				}
				else
				{
					pst2 = c.prepareStatement("select * from Hotels where hid = ?");
					pst2.setString(1,temphid);
					rs2 = pst2.executeQuery();
					rs2.next();
					temproomno = new ArrayList<String>();
					temproomno.add(rs1.getString("roomno"));
					pricesingleroom = rs2.getInt("single");
					pricedoubleroom	=  rs2.getInt("double");
					pricefamilyroom	=   rs2.getInt("family");
					obj = new MyHotels(temphid,rs2.getString(2),rs2.getString(3),rs2.getString(4),rs2.getString(8),rs2.getString(6),temproomno,pricesingleroom,pricedoubleroom,pricefamilyroom);
					map.put(temphid,obj);
				}
				
			}
			
			} 
			catch (Exception e) 
			{
				
				e.printStackTrace();
			}
		return map;
	}


	

}
