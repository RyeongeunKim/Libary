package Pack;

import java.sql.Date;

public class RentalDTO {
	private int rentalID;
	private Date returnDate;
	private Date rentalDate;
	private String rentalUserID;
	private String rentalBookName;
	private int rentalKey;
	private String userID;
	
	public int getRentalID() {
		return rentalID;
	}
	public void setRentalID(int rentalID) {
		this.rentalID = rentalID;
	}
	

	public int getRentalKey() {
		return rentalKey;
	}
	public void setRentalKey(int rentalKey) {
		this.rentalKey = rentalKey;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public Date getReturnDate() {
		return returnDate;
	}
	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}
	public Date getRentalDate() {
		return rentalDate;
	}
	public void setRentalDate(Date rentalDate) {
		this.rentalDate = rentalDate;
	}
	public String getRentalUserID() {
		return rentalUserID;
	}
	public void setRentalUserID(String rentalUserID) {
		this.rentalUserID = rentalUserID;
	}
	public String getRentalBookName() {
		return rentalBookName;
	}
	public void setRentalBookName(String rentalBookName) {
		this.rentalBookName = rentalBookName;
	}
	@Override
	public String toString() {
		return "RentalDTO [rentalID=" + rentalID + ", returnDate=" + returnDate + ", rentalDate=" + rentalDate
				+ ", rentalUserID=" + rentalUserID + ", rentalBookName=" + rentalBookName + "]";
	}
	
	
	
}
