package book;

import java.sql.SQLException;
import java.util.List;

public class BookService {
	private BookDAO bookDao;
	
	public BookService(BookDAO bookDao) {
		this.bookDao = bookDao;
	}
	
	// 梨� �벑濡�
	public boolean regist(Book book) {
		int result = bookDao.inserMember(book);
		
		return (result == 1) ? true : false;
	}
	
	// 梨� 議고쉶
	public Book read(int no) {
		Book book = bookDao.selectBook(no);
		return book;
	}
	
	// 梨� 紐⑸줉 議고쉶
	public List<Book> listAll() {
		List<Book> bookList = bookDao.selectBookAll();
		return bookList;
	}
	
	// 梨� 媛�寃� �닔�젙
	public boolean edit(Book book, int oldPrice) {
		if (book == null) return false;
		if (oldPrice == 0) return false;
		
		int result = 0;
		
		Book bookInfo = bookDao.selectBook(book.getNo());
		if (oldPrice == bookInfo.getPrice()) {
			result = bookDao.updateBook(book);
		}
		
		return (result == 1) ? true : false;
	}
	
	// 梨� 1媛� �궘�젣
	public boolean remove(int no) {
		if (bookDao.selectBook(no) == null) return false;
		
		int result = bookDao.deleteBook(no);
		
		return (result == 1) ? true : false;
	}
	
}
