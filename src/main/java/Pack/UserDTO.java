package Pack;

public class UserDTO {
	private String userID;
	private String userPwd;
	private String userName;
	private int userAge;
	private String userPhone;
	private String userAddress;
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getUserAge() {
		return userAge;
	}
	public void setUserAge(int userAge) {
		this.userAge = userAge;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	
	@Override
	public String toString() {
		return "UserDTO [userID=" + userID + ", userPwd=" + userPwd + ", userName=" + userName + ", userAge=" + userAge
				+ ", userPhone=" + userPhone + ", userAddress=" + userAddress + "]";
	}
	
	
}
