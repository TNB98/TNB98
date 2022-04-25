package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.xml.bind.DatatypeConverter;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.Properties;
import java.util.Random;

import javax.mail.internet.AddressException;

import com.microsoft.sqlserver.jdbc.SQLServerSavepoint;

import PRJO.ketquasoxo;
import PRJO.nguoidung;

public class Database {
	private static String url = "jdbc:sqlserver://DESKTOP-JECNV7H:1433;databaseName=Soxo";
	private static String user = "b";
	private static String pass = "1";

	public static Connection getConnection() {
		String url = "jdbc:sqlserver://DESKTOP-JECNV7H;databaseName=Soxo";
		String user = "b";
		String pass = "1";
		Connection conn = null;
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			conn = DriverManager.getConnection(url, user, pass);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return conn;
	}

	//
	public static int DemHang(String ma, String bang) throws SQLException {
		int SoHang;
		Database data = new Database();
		Connection conn = data.getConnection();
		Statement stmt;
		stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select count(" + ma + ") from " + bang);
		rs.next();
		SoHang = rs.getInt(1);
		return SoHang;

	}

	public static int kiemtra(int ma) throws SQLException {
		Database data = new Database();
		Connection conn = data.getConnection();
		Statement stmt;
		stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select count([MaSoXo) from [dbo].[KetQuaSoXo] where masoxo = " + ma);
		rs.next();
		int check = rs.getInt(1);
		return check;

	}

	// Lay thong tin ket qua so xo
	public static ketquasoxo[] soxo() throws SQLException {
		// dem so hang
		Database data = new Database();
		String ma = "MaSoXo";
		String bang = "[dbo].[KetQuaSoXo]";
		int sohang = data.DemHang(ma, bang);

		// tao mang
		ketquasoxo ketqua[] = new ketquasoxo[sohang];

		// lay thong tin va lua vao mang
		ketquasoxo kq = new ketquasoxo();
		Connection conn = data.getConnection();
		Statement stmt;
		stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from [dbo].[KetQuaSoXo]");
		int i = 0;
		while (rs.next()) {
			ketqua[i] = new ketquasoxo();
			ketqua[i].setketquasoxo(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5),
					rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
					rs.getString(11), rs.getString(12), rs.getString(13));
			i++;
		}
		return ketqua;

	}

	// Lay thong tin người dùng
	public static nguoidung[] nd() throws SQLException {
		// dem so hang
		Database data = new Database();
		String ma = "MaNguoiDung";
		String bang = "[dbo].[NguoiDung]";
		int sohang = data.DemHang(ma, bang);

		// tao mang
		nguoidung nguoidung[] = new PRJO.nguoidung[sohang];

		// lay thong tin va lua vao mang

		Connection conn = data.getConnection();
		Statement stmt;
		stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from [dbo].[NguoiDung]");
		int i = 0;
		while (rs.next()) {
			nguoidung[i] = new nguoidung();
			nguoidung[i].setnguoidung(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
					rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9),rs.getInt(10));
			i++;
		}
		return nguoidung;

	}

	// Xoa nhieu phan tu
	public static void xoanhieu(int[] mang) {
		Database data = new Database();
		Connection con = data.getConnection();
		SQLServerSavepoint save = null;
		try (Statement stmt = con.createStatement();) {
			con.setAutoCommit(false);
			save = (SQLServerSavepoint) con.setSavepoint();
			for (int i = 0; i < mang.length; i++) {
				stmt.executeUpdate("DELETE FROM [dbo].[KetQuaSoXo]    WHERE [MaSoXo] =" + mang[i]);
			}
			con.commit();
		} catch (SQLException ex) {
			try {
				System.out.println("khong xoa dc roll back");
				con.rollback(save);
			} catch (SQLException e) {
				System.out.println("khong rool back dc");
			}
		}

	}

	// Xoa nhieu phan tu
	public static void xoanhieuUser(int[] mang) {
		Database data = new Database();
		Connection con = data.getConnection();
		SQLServerSavepoint save = null;
		try (Statement stmt = con.createStatement();) {
			con.setAutoCommit(false);
			save = (SQLServerSavepoint) con.setSavepoint();
			for (int i = 0; i < mang.length; i++) {
				stmt.executeUpdate("DELETE FROM [dbo].[NguoiDung]    WHERE [Manguoidung] =" + mang[i]);
			}
			con.commit();
		} catch (SQLException ex) {

			try {
				System.out.println("khong xoa dc roll back");
				con.rollback(save);
			} catch (SQLException e) {
				System.out.println("khong rool back dc");
			}
		}

	}

	// Them thong tin kqsx
	public static void themkwsx(ketquasoxo kq) throws SQLException {
		Database data = new Database();
		Connection conn = data.getConnection();
		PreparedStatement stmt = conn.prepareStatement(
				"INSERT INTO [dbo].[KetQuaSoXo]([maQuanLy],[ngay],[vung] ,[giaiDacBiet],[giaiNhat] ,[giaiNhi],[giaiBa],[giaiBon],[giaiNam],[giaiSau],[giaiBay],[thanhPho])  values (?,?,?,?,?,?,?,?,?,?,?,?) ");
		stmt.setInt(1, kq.getMaquanly());
		stmt.setString(2, kq.getNgay());
		stmt.setString(3, kq.getVung());
		stmt.setString(4, kq.getGiaidb());
		stmt.setString(5, kq.getGiai1());
		stmt.setString(6, kq.getGiai2());
		stmt.setString(7, kq.getGiai3());
		stmt.setString(8, kq.getGiai4());
		stmt.setString(9, kq.getGiai5());
		stmt.setString(10, kq.getGiai6());
		stmt.setString(11, kq.getGiai7());
		stmt.setString(12, kq.getThanhpho());
		stmt.execute();
		stmt.close();
	}

	public static void capnhat(ketquasoxo kq) throws SQLException {
		Database data = new Database();
		Connection conn = data.getConnection();
		PreparedStatement stmt = conn.prepareStatement("UPDATE [dbo].[KetQuaSoXo]\r\n"
				+ "   SET [MaQuanLy] = ? ,[Ngay] = ?,[Vung] = ?,[thanhpho] = ?,[Giaidacbiet] = ?,[Giainhat] = ?,[Giainhi] = ?,[Giaiba] = ?,[Giaibon] = ?,[Giainam] = ?,[Giaisau] = ?,[Giaibay] = ?\r\n"
				+ " WHERE [MaSoXo] = ?  ");
		stmt.setInt(1, 1);
		stmt.setString(2, kq.getNgay());
		stmt.setString(3, kq.getVung());
		stmt.setString(4, kq.getThanhpho());
		stmt.setString(5, kq.getGiaidb());
		stmt.setString(6, kq.getGiai1());
		stmt.setString(7, kq.getGiai2());
		stmt.setString(8, kq.getGiai3());
		stmt.setString(9, kq.getGiai4());
		stmt.setString(10, kq.getGiai5());
		stmt.setString(11, kq.getGiai6());
		stmt.setString(12, kq.getGiai7());
		stmt.setInt(13, kq.getMasoxo());
		stmt.execute();
		stmt.close();
	}

	public static void xoa(int maxoa) throws SQLException {
		Database data = new Database();
		Connection conn = data.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("DELETE FROM [dbo].[KetQuaSoXo]    WHERE [MaSoXo] = " + maxoa);
	}

	// Tìm kiếm trong bảng user người dùng
	// Tim kiếm dựa và tên và số diện thoại trong bảng người dùng
	public static nguoidung[] seach(String seach) throws SQLException {
		String bieu_thuc = "\\d*";
		nguoidung nguoidung[];
		Database data = new Database();
		Connection conn = data.getConnection();
		Statement stmt;
		if (seach.matches(bieu_thuc)) {
			stmt = conn.createStatement();
			ResultSet rs1 = stmt.executeQuery(
					"select count(Manguoidung) from [dbo].[NguoiDung] where  [Sodienthoai] like '%" + seach + "%'");
			rs1.next();
			int dodai = rs1.getInt(1);
			nguoidung = new nguoidung[dodai];
			ResultSet rs = stmt
					.executeQuery("select * from [dbo].[NguoiDung] where  [Sodienthoai] like '%" + seach + "%'");
			int i = 0;
			while (rs.next()) {
				nguoidung[i] = new nguoidung();
				nguoidung[i].setnguoidung(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9),rs.getInt(10));

				i++;
			}
			conn.close();
		} else {
			stmt = conn.createStatement();
			ResultSet rs1 = stmt.executeQuery(
					"select count(Manguoidung) from [dbo].[NguoiDung] where  [Hovaten] like '%" + seach + "%'");
			rs1.next();
			int dodai = rs1.getInt(1);
			nguoidung = new nguoidung[dodai];
			ResultSet rs = stmt.executeQuery("select * from [dbo].[NguoiDung] where  [Hovaten] like '%" + seach + "%'");
			int i = 0;
			while (rs.next()) {
				nguoidung[i] = new nguoidung();
				nguoidung[i].setnguoidung(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9),rs.getInt(10));
				i++;
			}
			conn.close();
		}
		return nguoidung;
	}

	public static ketquasoxo[] loc(String vung) throws SQLException {
		// dem so hang
		Database data = new Database();
		String ma = "MaSoXo";
		String bang = "[dbo].[KetQuaSoXo]";
		int SoHang;
		Connection conn = data.getConnection();
		Statement stmt;
		stmt = conn.createStatement();
		ResultSet rs = stmt
				.executeQuery("select count([MaSoXo]) from [dbo].[KetQuaSoXo] where [Vung] like '%" + vung + "%'");
		rs.next();
		SoHang = rs.getInt(1);

		// tao mang
		ketquasoxo ketqua[] = new ketquasoxo[SoHang];

		// lay thong tin va lua vao mang
		ketquasoxo kq = new ketquasoxo();
		conn = data.getConnection();
		rs = stmt.executeQuery("select * from [dbo].[KetQuaSoXo] where [Vung] like '%" + vung + "%'");
		int i = 0;
		while (rs.next()) {
			ketqua[i] = new ketquasoxo();
			ketqua[i].setketquasoxo(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5),
					rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
					rs.getString(11), rs.getString(12), rs.getString(12));
			i++;
		}
		return ketqua;

	}

	public static String md5(String password) throws NoSuchAlgorithmException {
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(password.getBytes());
		byte[] digest = md.digest();
		String myHash = DatatypeConverter.printHexBinary(digest).toUpperCase();
		return myHash;
	}

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

	public static int demBang(String kc, String bang) throws SQLException {
		Database data = new Database();
		Connection conn = data.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("Select count([" + kc + "]) from " + bang);
		rs.next();
		int sohang = rs.getInt(1);
		return sohang;

	}

	public static void main(String[] args) throws SQLException {
		Database data = new Database();
	}

	public static String getUrl() {
		return url;
	}

	public static void setUrl(String url) {
		Database.url = url;
	}

	public static String getUser() {
		return user;
	}

	public static void setUser(String user) {
		Database.user = user;
	}

	public static String getPass() {
		return pass;
	}

	public static void setPass(String pass) {
		Database.pass = pass;
	}

}
