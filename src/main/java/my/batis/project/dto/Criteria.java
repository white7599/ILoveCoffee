package my.batis.project.dto;

import org.springframework.web.util.UriComponentsBuilder;

public class Criteria {
	private int page;
	private int perPageNum;
	//속성 searchType, keyword 추가
	private String searchType;
	private String keyword;
	private String searchStartDate;
	private String searchEndDate;
	
	
	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
		this.searchType = null;
		this.keyword = null;
		this.searchStartDate = null;
		this.searchEndDate = null;
	}
	
	//pageStart를 반환
	public int getPageStart() {
		return (this.page - 1)*perPageNum;
	}
	
	public int getPage() {
		return page;
	}
	
	public void setPage(int page) {
		if(page <=0) {
			this.page = 1;
		} else {
			this.page = page;
		}
	}
	
	public int getPerPageNum() {
		return perPageNum;
	}
	
	public void setPerPageNum(int perPageNum) {
		if(perPageNum <=0 || perPageNum > 100) {
			this.perPageNum = 10;
		}else {
			this.perPageNum = perPageNum;
		}
	}
	
	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}	
	
	

	public String getSearchStartDate() {
		return searchStartDate;
	}

	public void setSearchStartDate(String searchStartDate) {
		this.searchStartDate = searchStartDate;
	}

	public String getSearchEndDate() {
		return searchEndDate;
	}

	public void setSearchEndDate(String searchEndDate) {
		this.searchEndDate = searchEndDate;
	}

	public String makeQuery() {
		UriComponentsBuilder uriComponentsBuilder =  UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", this.perPageNum);
				
				if (searchType!=null) {
					uriComponentsBuilder
						.queryParam("searchType", this.searchType)
						.queryParam("keyword", this.keyword);
					if(searchStartDate != null){
						uriComponentsBuilder
							.queryParam("searchStartDate", this.searchStartDate)
							.queryParam("searchEndDate", this.searchEndDate);
					}
				}
		
				return uriComponentsBuilder.build().encode().toString();
	}
	
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
}
