package com.jtgj.finalProject.common.dto;

public class SearchDTO {
	private String searchWord;
	private String searchOption;
	
	public SearchDTO() {
		super();
	}
	
	public SearchDTO(String searchWord, String searchOption) {
		super();
		this.searchWord = searchWord;
		this.searchOption = searchOption;
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

	@Override
	public String toString() {
		return "SearchDTO [searchWord=" + searchWord + ", searchOption=" + searchOption + "]";
	}
	
}


