package com.localhost;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;

public class BookingEntryInDatabase 
{
	public static boolean bookingEntry(BookingDetailsBean obj,String hotelmobileno)
	{
		try {
			Connection c = JDBC01.getConnections();
			PreparedStatement pst = c.prepareStatement("insert into bookings values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			pst.setString(1,obj.getBid());
			pst.setString(2,obj.getUsername());
			System.out.println(obj.getBookingdate());
			pst.setDate(3,Date.valueOf(obj.getBookingdate()));
			pst.setDate(4,Date.valueOf(obj.getCheckindate()));
			pst.setDate(5,Date.valueOf(obj.getCheckoutdate()));
			pst.setString(6,obj.getHid());
			pst.setString(7,obj.getRoomno());
			pst.setString(8,hotelmobileno);
			pst.setString(9,obj.getGuestname());
			pst.setString(10,obj.getGuestmobileno());
			pst.setString(11,obj.getGuestemailid());
			System.out.println(obj.getGuestemailid());
			pst.setString(12,obj.getRoomtype());
			pst.setInt(13,(int)obj.getBookingamount());
			pst.setInt(14,(int)obj.getNoofdays());
			pst.setInt(15,(int)obj.getPricepernight());
			int i = pst.executeUpdate();
			
			System.out.println("In bookingEntry"+i);
			
			
		
		} 
		catch (Exception e) 
		{
			
			e.printStackTrace();
		}
		
		return true;
	}

}

