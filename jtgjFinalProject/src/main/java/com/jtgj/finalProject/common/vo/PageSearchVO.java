package com.jtgj.finalProject.common.vo;

public class PageSearchVO {
	
	// 검색용
	private String searchWord;		// 검색어 
	private String searchOption;	// 검색 옵션
	
	// 페이징용
	// 입력 받는 데이터들
	private int pageNo = 1;			// 현재 페이지 번호
	private int rowSizePerPage = 10;	// 한 페이지 당 보여줄 게시글 수
	private int pageSize = 10;			// 페이지리스트의 페이지 개수
	private int totalRowCount;			// 전체 게시글의 수
	
	// 계산할 데이터들
	private int firstRow;			// 현재 페이지의 시작 글 번호
	private int lastRow;			// 현재 페에지의 끝 글 번호
	private int totalPageCount;		// 전체 페이지의 개수
	private int firstPage;			// 페이지 리스트에서 시작 페이지 번호
	private int lastPage;			// 페이지 리스트에서 마지막 페이지 번호
	
	public void pageSetting() {
		totalPageCount  = (int) Math.ceil((double)totalRowCount / rowSizePerPage);
		
		firstRow = (pageNo - 1) * rowSizePerPage + 1;
		lastRow = firstRow + rowSizePerPage - 1;
		
		if (lastRow >= totalRowCount) {
			lastRow = totalRowCount;
		}
		
		firstPage = ((pageNo - 1) / pageSize) * pageSize + 1;
		lastPage = firstPage + pageSize - 1;
		
		if (lastPage > totalPageCount) {
			lastPage = totalPageCount;
		}
		
	}

	public PageSearchVO() {
		super();
	}

	public PageSearchVO(String searchWord, String searchOption, int pageNo, int rowSizePerPage, int pageSize,
			int totalRowCount, int firstRow, int lastRow, int totalPageCount, int firstPage, int lastPage) {
		super();
		this.searchWord = searchWord;
		this.searchOption = searchOption;
		this.pageNo = pageNo;
		this.rowSizePerPage = rowSizePerPage;
		this.pageSize = pageSize;
		this.totalRowCount = totalRowCount;
		this.firstRow = firstRow;
		this.lastRow = lastRow;
		this.totalPageCount = totalPageCount;
		this.firstPage = firstPage;
		this.lastPage = lastPage;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

	public String getSearchOption() {
		return searchOption;
	}

	public void setSearchOption(String searchOption) {
		this.searchOption = searchOption;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getRowSizePerPage() {
		return rowSizePerPage;
	}

	public void setRowSizePerPage(int rowSizePerPage) {
		this.rowSizePerPage = rowSizePerPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalRowCount() {
		return totalRowCount;
	}

	public void setTotalRowCount(int totalRowCount) {
		this.totalRowCount = totalRowCount;
	}

	public int getFirstRow() {
		return firstRow;
	}

	public void setFirstRow(int firstRow) {
		this.firstRow = firstRow;
	}

	public int getLastRow() {
		return lastRow;
	}

	public void setLastRow(int lastRow) {
		this.lastRow = lastRow;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public int getFirstPage() {
		return firstPage;
	}

	public void setFirstPage(int firstPage) {
		this.firstPage = firstPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	@Override
	public String toString() {
		return "PageSearchVO [searchWord=" + searchWord + ", searchOption=" + searchOption + ", pageNo=" + pageNo
				+ ", rowSizePerPage=" + rowSizePerPage + ", pageSize=" + pageSize + ", totalRowCount=" + totalRowCount
				+ ", firstRow=" + firstRow + ", lastRow=" + lastRow + ", totalPageCount=" + totalPageCount
				+ ", firstPage=" + firstPage + ", lastPage=" + lastPage + "]";
	}
	
}
