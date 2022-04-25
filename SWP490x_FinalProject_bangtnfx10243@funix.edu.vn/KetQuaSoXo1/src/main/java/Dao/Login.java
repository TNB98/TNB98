package Dao;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.Cookie;
import javax.xml.bind.DatatypeConverter;

import org.apache.catalina.connector.Response;

public class Login {

	public static void main(String[] args) throws NoSuchAlgorithmException, SQLException {
		Login login = new Login();
		login.check("tranthuy@gmail.com", "123456");
	}

	// Kiêm tra xem co emaill
	public String check(String user, String pass) throws SQLException, NoSuchAlgorithmException {
		Database data = new Database();
		Connection conn = data.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt
				.executeQuery("select count([Manguoidung]) from [dbo].[NguoiDung] where Email = '" + user + "'");
		rs.next();
		int check = rs.getInt(1);
		System.out.println(check);
		if (check == 1) {
			Login login = new Login();
			String pass1 = login.md5(pass);
			ResultSet rs1 = stmt.executeQuery(
					"select count([Manguoidung]) from [dbo].[NguoiDung] where [MatKhau] = '" + pass1 + "' and  Email = '" + user + "'");
			rs1.next();
			check = rs1.getInt(1);
			System.out.println(check);
			if (check == 1) {
				ResultSet rs2 = stmt
						.executeQuery("select [TrangThai] from [dbo].[NguoiDung] where [MatKhau] = '" + pass1 + "' and  Email = '" + user + "'");
				rs2.next();
				String tt = rs2.getString(1);
				System.out.println(tt);
				return tt;
			} else {
				return "pass";
			}
		}
		conn.close();
		return "email";
	}

	public String md5(String password) throws NoSuchAlgorithmException {
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(password.getBytes());
		byte[] digest = md.digest();
		String myHash = DatatypeConverter.printHexBinary(digest).toUpperCase();
		return myHash;
	}
}
