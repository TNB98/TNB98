package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import PRJO.lichsutimkiem;

public class history {
	//Lấy danh sách loichj sử tìm kiếm
	public lichsutimkiem[] lichsutk() throws SQLException {
		Database data = new Database();
		Connection conn = data.getConnection();
		Statement stmt = conn.createStatement();
		
		ResultSet rs2 = stmt.executeQuery("select count(matimkiem) from lichsutimkiem");
		rs2.next();
		int soluong = rs2.getInt(1);
		lichsutimkiem[] lstk = new lichsutimkiem[soluong];
		int i = 0;
		ResultSet rs1 = stmt.executeQuery("Select * from lichsutimkiem");
		while (rs1.next()) {
			lstk[i] = new lichsutimkiem();
			lstk[i].setlichsutimkiem(rs1.getInt(1), rs1.getInt(2), rs1.getInt(3), rs1.getString(4), rs1.getString(5),
					rs1.getString(6), rs1.getString(7));
			i++;
		}
		return lstk;
	}
	
	//Đếm tổng cộng có bao nhiêu hàng trong bảng lịch sử toimf kiếm
	public  int  sohang() throws SQLException {
		Database data = new Database();
		Connection conn = data.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select count(matimkiem) from lichsutimkiem");
		rs.next();
		int sohang = rs.getInt(1);
		return sohang;
	}
	
	//Xóa nhiều hàng trong bảng lịch sử tìm kiếm với mảng chứa mã tìm kiếm
	public void xoalstk(String matimkiem[]) throws SQLException {
		Database data = new Database();
		Connection conn = data.getConnection();
		int i = 0 ;
		while(matimkiem[i] != null) {
		int mtk = Integer.parseInt(matimkiem[i]);
		PreparedStatement stmt = conn.prepareStatement("Delete From lichsutimkiem Where matimkiem = ?");
		stmt.setInt(1,mtk );
		stmt.execute();
		i++;
		}
	}
	
	//Thêm một hàng vào bảng lịch sử tìm kiếm
	public void themlstk(String  mnd , String msx , String tp , String ngaytk , String ngaykq , String sotimkiem) throws SQLException {
		int mnd1 = Integer.parseInt(mnd);
		int msx1 = Integer.parseInt(msx);
		
		Database data = new Database();
		Connection conn = data.getConnection();
		PreparedStatement stmt = conn.prepareStatement("Insert into lichsutimkiem  values (?,?,?,?,?,?)");
        stmt.setInt(1, mnd1);
        stmt.setInt(2, msx1);
        stmt.setString(3, ngaytk);
        stmt.setString(4, ngaykq);
        stmt.setString(5, tp);
        stmt.setString(6, sotimkiem);
        stmt.execute();
        conn.close();
		
	}
	
	//Lấy một hang của lich sử tìm kiếm với mã tìm kiếm
	public lichsutimkiem[] updatelstk(String mtk) throws SQLException {
		int mtk1 = Integer.parseInt(mtk);
		Database data = new Database();
		Connection conn = data.getConnection();
		Statement stmt = conn.createStatement();
		lichsutimkiem[] lstk = new lichsutimkiem[1];
		ResultSet rs = stmt.executeQuery("Select * from lichsutimkiem where matimkiem = "+ mtk1);
		while (rs.next()) {
			lstk[0] = new lichsutimkiem();
			lstk[0].setlichsutimkiem(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5),
					rs.getString(6), rs.getString(7));
		}
		return lstk;
	}
	//Lấy một hang của lich sử tìm kiếm với mã nguoidung
		public lichsutimkiem[] lstkmnd(String mnd) throws SQLException {
			Database data = new Database();
			Connection conn = data.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs1 = stmt.executeQuery("Select count(matimkiem) from lichsutimkiem where manguoidung = '"+ mnd+"'");
			int sohang = 0;
			while (rs1.next()) {
				sohang = rs1.getInt(1);
			}
			int i = 0;
			lichsutimkiem[] lstk = new lichsutimkiem[sohang];
			ResultSet rs = stmt.executeQuery("Select * from lichsutimkiem where manguoidung = '"+ mnd+"'");
			while (rs.next()) {
				lstk[i] = new lichsutimkiem();
				lstk[i].setlichsutimkiem(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7));
				i++;
			}
			return lstk;
		}
		
	//Cập nhật lịch sử tìm kiếm với mã tìm kiếm
	public void capnhatlstk(String mtk , String mnd ,String msx , String tp , String ngaytk , String ngaykq ,String sotimkiem) throws SQLException {
		int mtk1 = Integer.parseInt(mtk);
		int mnd1 = Integer.parseInt(mnd);
		int msx1 = Integer.parseInt(msx);
		Database data = new Database();
		Connection conn = data.getConnection();
		PreparedStatement stmt = conn.prepareStatement("Update lichsutimkiem  set manguoidung = ? , masoxo=? ,ngaytimkiem = ? , ngaykqsx = ? , thanhpho=? ,sotimkiem = ? where matimkiem = ?");
        stmt.setInt(1, mnd1);
        stmt.setInt(2, msx1);
        stmt.setString(3, ngaytk);
        stmt.setString(4, ngaykq);
        stmt.setString(5, tp);
        stmt.setString(6, sotimkiem);
        stmt.setInt(7, mtk1);
        stmt.execute();
        conn.close();
		
	}
	public static void main(String[] args) throws SQLException {
       history h = new history();
       h.check("2", "034578", "giaidacbiet");
       }
	public static String check(String msx , String matimkiem,String giai) throws SQLException {
		Database data = new Database();
		Connection conn = data.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select " +giai + " from [dbo].[KetQuaSoXo] where masoxo = '"+msx+"' and "+giai+" = '"+matimkiem+"'");
		while (rs.next()) {
			System.out.print("1");
		return "1" ;
		}System.out.print("0");
		return "0" ;
	} 

}
