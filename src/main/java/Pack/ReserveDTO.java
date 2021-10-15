package Pack;

import java.sql.Date;

public class ReserveDTO {
	private String reserveID;
	private String reserveUserID;
	private Date reserveDate;
	private int reserveBookID;
	
	public String getReserveID() {
		return reserveID;
	}
	public void setReserveID(String reserveID) {
		this.reserveID = reserveID;
	}
	public String getReserveUserID() {
		return reserveUserID;
	}
	public void setReserveUserID(String reserveUserID) {
		this.reserveUserID = reserveUserID;
	}
	public Date getReserveDate() {
		return reserveDate;
	}
	public void setReserveDate(Date reserveDate) {
		this.reserveDate = reserveDate;
	}
	public int getReserveBookID() {
		return reserveBookID;
	}
	public void setReserveBookID(int reserveBookID) {
		this.reserveBookID = reserveBookID;
	}
	
	@Override
	public String toString() {
		return "ReserveDTO [reserveID=" + reserveID + ", reserveUserID=" + reserveUserID + ", reserveDate="
				+ reserveDate + ", reserveBookID=" + reserveBookID + "]";
	}
	
	
}
