package PRJO;

public class lichsutimkiem {

	public void setlichsutimkiem(int matimkiem, int manguoidung,int masoxo, String ngaytimkiem, String ngaykqsx, String thanhpho,
			String sotimkiem) {
		setMatimkiem(matimkiem);
		setManguoidung(manguoidung);
		setNgaykqsx(ngaykqsx);
		setNgaytimkiem(ngaytimkiem);
		setThanhpho(thanhpho);
		setSotimkiem(sotimkiem);
		setMasoxo(masoxo);
	}
	private int masoxo ;
	private int matimkiem ;
	private int manguoidung ;
	private String ngaytimkiem ;
	private String ngaykqsx ;
	private String thanhpho ;
	private String sotimkiem ;
	
	
	
	public int getMatimkiem() {
		return matimkiem;
	}
	public int getManguoidung() {
		return manguoidung;
	}
	public String getNgaytimkiem() {
		return ngaytimkiem;
	}
	public String getNgaykqsx() {
		return ngaykqsx;
	}
	public String getThanhpho() {
		return thanhpho;
	}
	public String getSotimkiem() {
		return sotimkiem;
	}
	public void setMatimkiem(int matimkiem) {
		this.matimkiem = matimkiem;
	}
	public void setManguoidung(int manguoidung) {
		this.manguoidung = manguoidung;
	}
	public void setNgaytimkiem(String ngaytimkiem) {
		this.ngaytimkiem = ngaytimkiem;
	}
	public void setNgaykqsx(String ngaykqsx) {
		this.ngaykqsx = ngaykqsx;
	}
	public void setThanhpho(String thanhpho) {
		this.thanhpho = thanhpho;
	}
	public void setSotimkiem(String sotimkiem) {
		this.sotimkiem = sotimkiem;
	}
	public int getMasoxo() {
		return masoxo;
	}
	public void setMasoxo(int masoxo) {
		this.masoxo = masoxo;
	}	
}
