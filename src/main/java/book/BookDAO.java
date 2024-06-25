package book;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookDAO {

	// 梨� �벑濡�
	public int inserMember(Book book) {
		// DB �뿰寃�
		JDBConnection jdbc = new JDBConnection();
		
		// sql臾� 留뚮뱾湲�
		String sql = new StringBuilder()
				.append("insert into book (no, name, author, publisher, price)")
				.append("values (book_seq.nextval, ?, ?, ?, ?)")
				.toString();
		
		int result = 0;
		
		
		
		try {
			// PreparedStatement 媛앹껜 �깮�꽦
			jdbc.pstmt = jdbc.conn.prepareStatement(sql);
			
			// SQL臾� 留ㅺ컻蹂��닔�뿉 媛� 異붽�
			jdbc.pstmt.setString(1, book.getName());
			jdbc.pstmt.setString(2, book.getAuthor());
			jdbc.pstmt.setString(3, book.getPublisher());
			jdbc.pstmt.setInt(4, book.getPrice());
			
			// SQL臾� �떎�뻾
			result = jdbc.pstmt.executeUpdate();
			
			if (result == 1) {
				System.out.println(result + "�뻾�씠 異붽��릺�뿀�뒿�땲�떎.");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// �옄�썝 媛앹껜 �떕湲�
			jdbc.close();
		}
			
		return result;
	
	}

	// 梨� 1媛� 議고쉶
	public Book selectBook(int no) {
		Book book = null;
		
		// DB �뿰寃�
		JDBConnection jdbc = new JDBConnection();
		
		// sql臾� 留뚮뱾湲�
		String sql = "select * from book where no = ?";
		
		try {
			// PreparedStatement 媛앹껜 �깮�꽦
			jdbc.pstmt = jdbc.conn.prepareStatement(sql);
			jdbc.pstmt.setInt(1,  no);
			
			// SQL臾� �떎�뻾
			jdbc.rs = jdbc.pstmt.executeQuery();
			
			// ResultSet 媛앹껜�뿉�꽌 寃곌낵媛� 媛��졇���꽌 異쒕젰�븯湲�
			if (jdbc.rs.next()) {
				book = new Book(
						jdbc.rs.getInt("no"),
						jdbc.rs.getString("name"),
						jdbc.rs.getString("author"),
						jdbc.rs.getString("publisher"),
						jdbc.rs.getInt("price")
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			jdbc.close();
		}
		return book;
	}

	// 梨� 紐⑸줉 議고쉶
	public List<Book> selectBookAll() {
		// DB �뿰寃�
		JDBConnection jdbc = new JDBConnection();
		
		// sql臾� 留뚮뱾湲�
		String sql = "select * from book";
		
		// 寃곌낵瑜� ���옣�븷 List 媛앹껜瑜� �깮�꽦
		List<Book> bookList = new ArrayList<>();
		
		
		try {
			// PreparedStatement 媛앹껜 �깮�꽦
			jdbc.pstmt = jdbc.conn.prepareStatement(sql);
			
			// SQL臾� �떎�뻾
			jdbc.rs = jdbc.pstmt.executeQuery();
			
			// ResultSet 媛앹껜�뿉�꽌 寃곌낵媛� 媛��졇���꽌 異쒕젰�븯湲�
			while (jdbc.rs.next()) {
				Book book = new Book(
						jdbc.rs.getInt("no"),
						jdbc.rs.getString("name"),
						jdbc.rs.getString("author"),
						jdbc.rs.getString("publisher"),
						jdbc.rs.getInt("price")
						);
						
				bookList.add(book);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			jdbc.close();
			
		} 
		return bookList;
	}

	// 梨� 媛�寃� �닔�젙
	public int updateBook(Book book) {
		// DB �뿰寃�
		JDBConnection jdbc = new JDBConnection();
		
		// sql臾� 
		String sql = new StringBuilder()
				.append("update book ")
				.append("set price = ? ")
				.append("where no = ?")
				.toString();
		
		int result = 0;
		

		try {
			// PS 媛앹껜, 留ㅺ컻蹂��닔 set
			jdbc.pstmt = jdbc.conn.prepareStatement(sql);
			
			jdbc.pstmt.setInt(1, book.getPrice());
			jdbc.pstmt.setInt(2, book.getNo());
			
			// sql �떎�뻾
			result = jdbc.pstmt.executeUpdate();
			System.out.println(result + "�뻾�씠 �닔�젙�릺�뿀�뒿�땲�떎.");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			jdbc.close();
		}
		
		return result;
	}
	
	// 梨� 1媛� �궘�젣
	public int deleteBook(int no) {
		int result = 0;
			
		// DB �뿰寃�
		JDBConnection jdbc = new JDBConnection();
			
		// sql臾� 留뚮뱾湲�
		String sql = "delete book where no = ?";
			
			
		try {
			// PreparedStatement 媛앹껜 �깮�꽦
			jdbc.pstmt = jdbc.conn.prepareStatement(sql);
				
			// �뙆�씪誘명꽣 set
			jdbc.pstmt.setInt(1,  no);
				
			// sql �떎�뻾
			result = jdbc.pstmt.executeUpdate();
			System.out.println(result + "�뻾�씠 �궘�젣�릺�뿀�뒿�땲�떎.");
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			jdbc.close();
		}
			
		return result;
	}
	
	
	
}
