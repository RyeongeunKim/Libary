package Pack;

import java.sql.Date;

public class RentalDTO {
	private int rentalID;
	private int rentalBookID;
	private Date rentalDate;
	private Date returnDate;
	private String rentalUserID;
	private int rentalKey;
	public int getRentalID() {
		return rentalID;
	}
	public void setRentalID(int rentalID) {
		this.rentalID = rentalID;
	}
	public int getRentalBookID() {
		return rentalBookID;
	}
	public void setRentalBookID(int rentalBookID) {
		this.rentalBookID = rentalBookID;
	}
	public Date getRentalDate() {
		return rentalDate;
	}
	public void setRentalDate(Date rentalDate) {
		this.rentalDate = rentalDate;
	}
	public Date getReturnDate() {
		return returnDate;
	}
	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}
	public String getRentalUserID() {
		return rentalUserID;
	}
	public void setRentalUserID(String rentalUserID) {
		this.rentalUserID = rentalUserID;
	}
	public int getRentalKey() {
		return rentalKey;
	}
	public void setRentalKey(int rentalKey) {
		this.rentalKey = rentalKey;
	}
	@Override
	public String toString() {
		return "RentalDTO [rentalID=" + rentalID + ", rentalBookID=" + rentalBookID + ", rentalDate=" + rentalDate
				+ ", returnDate=" + returnDate + ", rentalUserID=" + rentalUserID + ", rentalKey=" + rentalKey + "]";
	}
	
	
}
