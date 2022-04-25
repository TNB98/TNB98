package Dao;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.xml.bind.DatatypeConverter;

import PRJO.lichsutimkiem;
import PRJO.nguoidung;

public class User {

	public static void main(String[] args)
			throws UnsupportedEncodingException, NoSuchAlgorithmException, MessagingException, SQLException {
		User u = new User();
		int a = u.themsolan("namper@gmail.com");
		System.out.print(a);
	}

	public String mannguoidung(String email) throws SQLException {
		Database data = new Database();
		Connection conn = data.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("Select manguoidung from NguoiDung where email = '" + email + "'");
		while (rs.next()) {
			return rs.getString(1);
		}
		return "0";
	}

	public int themsolan(String email) throws SQLException {
		Database data = new Database();
		Connection conn = data.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("Select solan from NguoiDung where email = '" + email + "'");
		rs.next();
		int solan = rs.getInt(1);
		if (solan > 2) {
			return 1;
		} else {
			PreparedStatement stmt1 = conn.prepareStatement("update nguoiDung set solan  = ? where email = ?");
			stmt1.setInt(1, solan + 1);
			stmt1.setString(2, email);
			stmt1.execute();
			return 2;
		}
	}

	public static void xoasolan(String email) throws SQLException {
		Database data = new Database();
		Connection conn = data.getConnection();
		PreparedStatement stmt = conn.prepareStatement("update nguoiDung set solan  = ? where email = ?");
		stmt.setInt(1, 0);
		stmt.setString(2,email);
		stmt.execute();

	}

	// Lấy thông tin người dùng bằng mã người dùng
	public static nguoidung[] thongTinUpdate(String mnd) throws SQLException {
		Database data = new Database();
		Connection conn = data.getConnection();
		Statement stmt;
		stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from [dbo].[NguoiDung] where Manguoidung = " + mnd);
		int i = 0;
		nguoidung[] nguoidung = new nguoidung[1];
		while (rs.next()) {
			nguoidung[i] = new nguoidung();
			nguoidung[i].setnguoidung(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
					rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getInt(10));
			i++;
		}
		return nguoidung;
	}

	// Kiểm tra xem một email được nhập có tồn tại trong bảng không
	public static int checkEmail(String user) throws SQLException {
		Database data = new Database();
		Connection conn = data.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt
				.executeQuery("select count([Manguoidung]) from [dbo].[NguoiDung] where Email = '" + user + "'");
		rs.next();
		int check = rs.getInt(1);
		return check;
	}

	// Kiểm tra xem mật khẩu có đúng không
	public static int checkPas(String email, String pass) throws SQLException {
		Database data = new Database();
		Connection conn = data.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select count([Manguoidung]) from [dbo].[NguoiDung] where Email = '" + email
				+ "' and [MatKhau] = '" + pass + "'");
		rs.next();
		int check = rs.getInt(1);
		return check;
	}

	// Cập nhật thông tin bảng người dùng
	public void capnhat(String mnd, String tt, String email, String pass, String hvt, String sdt, String ngay,
			String diachi, String gioitinh, int solan) throws SQLException, NoSuchAlgorithmException {
		Database data = new Database();
		User user = new User();
		Connection conn = data.getConnection();
		int mnd1 = Integer.parseInt(mnd);
		PreparedStatement stmt = conn.prepareStatement(
				"UPDATE [dbo].[NguoiDung] SET [TrangThai] = ?,[Hovaten] = ?,[Sodienthoai]=?,[Email]=?, [Ngaysinh]=?,[Diachi]=?,[Gioitinh] = ?,[solan]=? where [MaNguoiDung] = ?");
		stmt.setString(1, tt);
		stmt.setString(2, hvt);
		stmt.setString(3, sdt);
		stmt.setString(4, email);
		stmt.setString(5, ngay);
		stmt.setString(6, diachi);
		stmt.setString(7, gioitinh);
		stmt.setInt(8, solan);
		stmt.setInt(9, mnd1);
		stmt.execute();
		conn.close();
	}

	// Thêm 1 người dùng vào bảng User
	public void them(String tt, String email, String pass, String hvt, String sdt, String ngay, String diachi,
			String gioitinh) throws SQLException, NoSuchAlgorithmException {
		Database data = new Database();
		User user = new User();
		String pass1 = user.md5(pass);
		Connection conn = data.getConnection();
		PreparedStatement stmt = conn.prepareStatement(
				"INSERT INTO [dbo].[NguoiDung]  ([TrangThai],[Hovaten],[Sodienthoai],[Email],[MatKhau],[Ngaysinh],[Diachi],[Gioitinh],[solan])"
						+ "VALUES(?,?,?,?,?,?,?,?,?)");
		stmt.setString(1, tt);
		stmt.setString(2, hvt);
		stmt.setString(3, sdt);
		stmt.setString(4, email);
		stmt.setString(5, pass1);
		stmt.setString(6, ngay);
		stmt.setString(7, diachi);
		stmt.setString(8, gioitinh);
		stmt.setInt(9, 0);
		stmt.execute();
		conn.close();
	}

	// Mã Hóa Pass bằng md5
	public static String md5(String password) throws NoSuchAlgorithmException {
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(password.getBytes());
		byte[] digest = md.digest();
		String myHash = DatatypeConverter.printHexBinary(digest).toUpperCase();
		return myHash;
	}

	// Tạo mật khẩu ngẫu nhiên và mã hóa md 5 rồi lưu và bảng người dùng và gửi tin
	// nhắn đến email
	public static void sendMess(String email)
			throws MessagingException, UnsupportedEncodingException, SQLException, NoSuchAlgorithmException {

		final String fromEmail = "owl98strength@gmail.com";
		// Mat khai email cua ban
		final String password = "trannhubang98";
		// dia chi email nguoi nhan
		final String toEmail = email;
		Random rd = new Random();
		int number = rd.nextInt(10000000);
		Database data = new Database();
		Connection conn = data.getConnection();
		PreparedStatement stmt = conn
				.prepareStatement("UPDATE [dbo].[NguoiDung] SET [MatKhau]	= ?	 WHERE [Email] =  ?");
		String number1 = Integer.toString(number);
		String md5 = data.md5(number1);
		stmt.setString(1, md5);
		stmt.setString(2, email);
		stmt.execute();
		stmt.close();

		final String subject = "Cập Nhật Mật Khẩu";
		final String body = "Mật khẩu mới của bạn là :" + number;

		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com"); // SMTP Host
		props.put("mail.smtp.port", "587"); // TLS Port
		props.put("mail.smtp.auth", "true"); // enable authentication
		props.put("mail.smtp.starttls.enable", "true"); // enable STARTTLS

		Authenticator auth = new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(fromEmail, password);
			}
		};
		Session session = Session.getInstance(props, auth);

		MimeMessage msg = new MimeMessage(session);
		// set message headers
		msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
		msg.addHeader("format", "flowed");
		msg.addHeader("Content-Transfer-Encoding", "8bit");

		msg.setFrom(new InternetAddress(fromEmail, "NoReply-JD"));

		msg.setReplyTo(InternetAddress.parse(fromEmail, false));

		msg.setSubject(subject, "UTF-8");

		msg.setText(body, "UTF-8");

		msg.setSentDate(new Date());

		msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
		Transport.send(msg);
		System.out.println("Gui mail thanh cong");
	}

	// Thay đổi mật khẩu
	public static void themPass(String pass, String email) throws SQLException {
		Database data = new Database();
		Connection conn = data.getConnection();
		PreparedStatement stmt = conn
				.prepareStatement("UPDATE [dbo].[NguoiDung] SET [MatKhau]	= ?	 WHERE [Email] =  ?");
		stmt.setString(1, pass);
		stmt.setString(2, email);
		stmt.execute();
		conn.close();
	}

}
