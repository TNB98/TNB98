package PRJO;

import javax.management.loading.PrivateClassLoader;

public class nguoidung {
	private int manguoidung;
	private String hovaten;
	private String trangthai;
	private String sdt;
	private String email;
	private String mk;
	private String ngaysinh;
	private String diachi;
	private String gioitinh;
	private int solan ;

	public void setnguoidung(int manguoidung, String trangthai , String hovaten, String sdt, String email, String mk, String ngaysinh, String diachi,
			String gioitinh,int solan) {
		setTrangthai(trangthai);
	    setManguoidung(manguoidung);
		setHovaten(hovaten);
		setSdt(sdt);
		setEmail(email);
		setMk(mk);
		setNgaysinh(ngaysinh);
		setDiachi(diachi);
		setGioitinh(gioitinh);
		setSolan(solan);
	}

	public int getManguoidung() {
		return manguoidung;
	}

	public String getHovaten() {
		return hovaten;
	}

	public String getSdt() {
		return sdt;
	}

	public String getEmail() {
		return email;
	}

	public String getMk() {
		return mk;
	}

	public String getNgaysinh() {
		return ngaysinh;
	}

	public String getDiachi() {
		return diachi;
	}

	public String getGioitinh() {
		return gioitinh;
	}

	public void setManguoidung(int manguoidung) {
		this.manguoidung = manguoidung;
	}

	public void setHovaten(String hovaten) {
		this.hovaten = hovaten;
	}

	public void setSdt(String sdt) {
		this.sdt = sdt;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setMk(String mk) {
		this.mk = mk;
	}

	public void setNgaysinh(String ngaysinh) {
		this.ngaysinh = ngaysinh;
	}

	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}

	public void setGioitinh(String gioitinh) {
		this.gioitinh = gioitinh;
	}
	public String getTrangthai() {
		return trangthai;
	}

	public void setTrangthai(String trangthai) {
		this.trangthai = trangthai;
	}

	public int getSolan() {
		return solan;
	}

	public void setSolan(int solan) {
		this.solan = solan;
	}
}
