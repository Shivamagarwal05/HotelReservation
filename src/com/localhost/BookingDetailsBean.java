package com.localhost;

import java.sql.Date;

import java.text.SimpleDateFormat;
import java.util.concurrent.TimeUnit;

public class BookingDetailsBean
{
	private String hid;
	private String bid;
	private String city;
	private String checkindate;
	private String checkoutdate;
	private String roomtype;
	private String noadults;
	private String nochilds;
	private long noofdays;
	private long bookingamount;
	private String  bookingdate;
	private String username;
	private long pricepernight;
	private String guestname;
	private String guestmobileno;
	private String guestemailid;
	private String roomno;
	public String getRoomno() {
		return roomno;
	}

	public void setRoomno(String roomno) {
		this.roomno = roomno;
	}

	public String getHid() {
		return hid;
	}

	public void setHid(String hid) {
		this.hid = hid;
	}

	public long getBookingamount() {
		return bookingamount;
	}

	public void setBookingamount(long bookingamount) {
		this.bookingamount = bookingamount;
	}

	public String getBookingdate() {
		return bookingdate;
	}

	public void setBookingdate(String bookingdate) {
		this.bookingdate = bookingdate;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public long getPricepernight() {
		return pricepernight;
	}

	public void setPricepernight(long pricepernight) {
		this.pricepernight = pricepernight;
	}

	public String getGuestname() {
		return guestname;
	}

	public void setGuestname(String guestname) {
		this.guestname = guestname;
	}

	public String getGuestmobileno() {
		return guestmobileno;
	}

	public void setGuestmobileno(String guestmobileno) {
		this.guestmobileno = guestmobileno;
	}

	public String getGuestemailid() {
		return guestemailid;
	}

	public void setGuestemailid(String guestemailid) {
		this.guestemailid = guestemailid;
	}

	
	public long getNoofdays() {
		return noofdays;
	}

	public void setNoofdays(long noofdays) {
		this.noofdays = noofdays;
	}
	public String getBid() 
	{
		return bid;
	}

	public void setBid(String bid) {
		this.bid = bid;
	}
	public BookingDetailsBean(String city,String checkindate, String checkoutdate, String roomtype, String noadults,
			String nochilds,long noofdays) {
		
		this.city = city;
		this.checkindate = checkindate;
		this.checkoutdate = checkoutdate;
		this.roomtype = roomtype;
		this.noadults = noadults;
		this.nochilds = nochilds;
		this.noofdays	= noofdays;
	}
	
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCheckindate() {
		return checkindate;
	}
	public void setCheckindate(String checkindate) {
		this.checkindate = checkindate;
	}
	public String getCheckoutdate() {
		return checkoutdate;
	}
	public void setCheckoutdate(String checkoutdate) {
		this.checkoutdate = checkoutdate;
	}
	public String getRoomtype() {
		return roomtype;
	}
	public void setRoomtype(String roomtype) {
		this.roomtype = roomtype;
	}
	public String getNoadults() {
		return noadults;
	}
	public void setNoadults(String noadults) {
		this.noadults = noadults;
	}
	public String getNochilds() {
		return nochilds;
	}
	public void setNochilds(String nochilds) {
		this.nochilds = nochilds;
	}
	
	

	public static String date(Date dat)
	{
		String result="";
		SimpleDateFormat df = new SimpleDateFormat("YYYY-MM-dd");
		result = df.format(dat);
		
		
		
		return result;
		
	}
	
	public static BookingDetailsBean getBookingDetailsBeanObject(String city, String checkindate,String checkoutdate,String roomtype,String noadults,String nochilds)
	{
		BookingDetailsBean obj=null;
		long nodays=0;
		Date cndate =	Date.valueOf(checkindate) ;
		Date cutdate = 	Date.valueOf(checkoutdate);
		 long diffInMillies = Math.abs(cndate.getTime() -  cutdate.getTime());
		 nodays = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);
		String cindate = date(cndate);
		String coutdate = date(cutdate);
		obj = new BookingDetailsBean(city,cindate,coutdate,roomtype,noadults,nochilds,nodays);
		
		
		return obj;
	}
	

}
