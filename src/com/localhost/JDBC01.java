package com.localhost;
import java.sql.*;
public class JDBC01
{
	public static Connection getConnections() throws Exception
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection c = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hotel","inc0rrect#");
		
		return c;
	
	}	
}
