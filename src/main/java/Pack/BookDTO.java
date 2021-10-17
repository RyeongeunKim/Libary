package Pack;

public class BookDTO {
	private int bookID;
	private int bookRentalKey;
	private String bookWriter;
	private String bookName;
	private String bookCategory;
	private String bookPublisher;
	private String bookImage;
	
	public int getBookRentalKey() {
		return bookRentalKey;
	}
	public void setBookRentalKey(int bookRentalKey) {
		this.bookRentalKey = bookRentalKey;
	}
	public String getBookImage() {
		return bookImage;
	}
	public void setBookImage(String bookImage) {
		this.bookImage = bookImage;
	}
	public int getBookID() {
		return bookID;
	}
	public void setBookID(int bookID) {
		this.bookID = bookID;
	}
	public String getBookWriter() {
		return bookWriter;
	}
	public void setBookWriter(String bookWriter) {
		this.bookWriter = bookWriter;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getBookCategory() {
		return bookCategory;
	}
	public void setBookCategory(String bookCategory) {
		this.bookCategory = bookCategory;
	}
	public String getBookPublisher() {
		return bookPublisher;
	}
	public void setBookPublisher(String bookPublisher) {
		this.bookPublisher = bookPublisher;
	}
	@Override
	public String toString() {
		return "BookDTO [bookID=" + bookID + ", bookWriter=" + bookWriter + ", bookName=" + bookName + ", bookCategory="
				+ bookCategory + ", bookPublisher=" + bookPublisher + ", bookImage=" + bookImage + "]";
	}

	
	
}
