package Dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import PRJO.ketquasoxo;

public class kqsx {
	public static ketquasoxo[] soxo(String msx) throws SQLException {
		Database data = new Database();
		ketquasoxo ketqua[] = new ketquasoxo[1];
		int msx1 = Integer.parseInt(msx);

		// lay thong tin va lua vao mang
		ketquasoxo kq = new ketquasoxo();
		Connection conn = data.getConnection();
		Statement stmt;
		stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from [dbo].[KetQuaSoXo] where masoxo = " + msx1);
		rs.next();
		ketqua[0] = new ketquasoxo();
		ketqua[0].setketquasoxo(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5),
				rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11),
				rs.getString(12), rs.getString(13));

		return ketqua;
	}

	public static ketquasoxo[] trangchu(Date ngay, String vung, int sohang) throws SQLException {
		ketquasoxo[] kq = new ketquasoxo[sohang];
		Database data = new Database();
		Connection conn = data.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select top " + sohang + " * from [dbo].[KetQuaSoXo] Where Vung like '%" + vung
				+ "%' And Ngay < '" + ngay + "'");
		int i = 0;
		while (rs.next()) {
			kq[i] = new ketquasoxo();
			kq[i].setketquasoxo(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5),
					rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
					rs.getString(11), rs.getString(12), rs.getString(13));
			i++;
		}
		return kq;
	}
	public static String[][] kqsxNhieuNhat(String giai) throws SQLException {
		Database data = new Database();
		Connection conn = data.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("Select top 5 count(masoxo), "+giai+" from ketquasoxo group by "+ giai +" order by count(masoxo) DESC");
		String[][] kqsx = new String[5][2];
		int i = 0 ;
		while (rs.next()) {
			kqsx[i][0] = rs.getString(1);
			kqsx[i][1] = rs.getString(2);
			i++;
		}
		return kqsx;
		
	}

	public static void main(String[] args) throws SQLException {
		kqsx kq = new kqsx();
		ketquasoxo[] kq1;
		String[][] a = kq.kqsxNhieuNhat("giaidacbiet");
		for(int i = 0 ; i < 5 ;i++) {
			System.out.print(a[i][0] + " ");
			System.out.print(a[i][1] + " ,");
		}
		System.out.print(a.length);
	}
	
}
