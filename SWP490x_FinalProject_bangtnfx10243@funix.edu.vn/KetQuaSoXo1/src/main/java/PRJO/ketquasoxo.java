package PRJO;

public class ketquasoxo {

	private int masoxo;
	private int maquanly;;
	private String ngay;
	private String vung;
	private String thanhpho ;
	private String giaidb;
	private String giai1;
	private String giai2;
	private String giai3;
	private String giai4;
	private String giai5;
	private String giai6;
	private String giai7;

	public void setketquasoxo(int masoxo,int maquanly ,String ngay, String vung, String giaidb, String giai1, String giai2,
			String giai3, String giai4, String giai5, String giai6, String giai7,String thanhpho) {
		setMasoxo(masoxo);
		setMaquanly(maquanly);
		setNgay(ngay);
		setVung(vung);
		setGiaidb(giaidb);
		setGiai1(giai1);
		setGiai2(giai2);
		setGiai3(giai3);
		setGiai4(giai4);
		setGiai5(giai5);
		setGiai6(giai6);
		setGiai7(giai7);
		setThanhpho(thanhpho);
		
	}

	public void setMasoxo(int masoxo) {
		this.masoxo = masoxo;
	}

	public void setNgay(String ngay) {
		this.ngay = ngay;
	}

	public void setVung(String vung) {
		this.vung = vung;
	}

	public void setGiaidb(String giaidb) {
		this.giaidb = giaidb;
	}

	public void setGiai1(String giai1) {
		this.giai1 = giai1;
	}

	public void setGiai2(String giai2) {
		this.giai2 = giai2;
	}

	public void setGiai3(String giai3) {
		this.giai3 = giai3;
	}

	public void setGiai4(String giai4) {
		this.giai4 = giai4;
	}

	public void setGiai5(String giai5) {
		this.giai5 = giai5;
	}

	public void setGiai6(String giai6) {
		this.giai6 = giai6;
	}

	public void setGiai7(String giai7) {
		this.giai7 = giai7;
	}

	public int getMasoxo() {
		return masoxo;
	}

	public String getNgay() {
		return ngay;
	}

	public String getVung() {
		return vung;
	}

	public String getGiaidb() {
		return giaidb;
	}

	public String getGiai1() {
		return giai1;
	}

	public String getGiai2() {
		return giai2;
	}

	public String getGiai3() {
		return giai3;
	}

	public String getGiai4() {
		return giai4;
	}

	public String getGiai5() {
		return giai5;
	}

	public String getGiai6() {
		return giai6;
	}

	public String getGiai7() {
		return giai7;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}

	public int getMaquanly() {
		return maquanly;
	}

	public void setMaquanly(int maquanly) {
		this.maquanly = maquanly;
	}

	public String getThanhpho() {
		return thanhpho;
	}

	public void setThanhpho(String thanhpho) {
		this.thanhpho = thanhpho;
	}
}
