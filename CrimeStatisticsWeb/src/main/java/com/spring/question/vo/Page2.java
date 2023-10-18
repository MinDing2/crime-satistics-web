package com.spring.question.vo;

public class Page2 {
	//
	private int num;

	// 
	private int count;

	// 
	private int postNum = 4;

	//
	private int pageNum;

	// 
	private int displayPost;

	//
	private int pageNumCnt = 4;

	// 
	private int endPageNum;

	// 
	private int startPageNum;

	// 
	private boolean prev;
	private boolean next;
	
	public void setNum(int num) {
		 this.num = num;
	}

	public void setCount(int count) {
		 this.count = count;
		 
		 dataCalc();
	}

		public int getCount() {
		 return count;
		}

		public int getPostNum() {
		 return postNum;
		}

		public int getPageNum() {
		 return pageNum;
		}

		public int getDisplayPost() {
		 return displayPost;
		}

		public int getPageNumCnt() {
		 return pageNumCnt;
		}

		public int getEndPageNum() {
		 return endPageNum;
		}

		public int getStartPageNum() {
		 return startPageNum;
		}

		public boolean getPrev() {
		 return prev;
		} 

		public boolean getNext() {
		 return next;
		}
		
		private void dataCalc() {
			 
			 // 
			 endPageNum = (int)(Math.ceil((double)num / (double)pageNumCnt) * pageNumCnt);
			 
			 // 
			 startPageNum = endPageNum - (pageNumCnt - 1);
			 
			 //
			 int endPageNum_tmp = (int)(Math.ceil((double)count / (double)pageNumCnt));
			 
			 if(endPageNum > endPageNum_tmp) {
			  endPageNum = endPageNum_tmp;
			 }
			 
			 prev = startPageNum == 1 ? false : true;
			 next = endPageNum * pageNumCnt >= count ? false : true;
			 
			 displayPost = (num - 1) * postNum;
			 
			}
		
		
		public String getSearchTypeKeyword() {
			 
			 if(searchType.equals("") || keyword.equals("")) {
			  return ""; 
			 } else {
			  return "&searchType=" + searchType + "&keyword=" + keyword; 
			 }
			}

			private String searchType;
			private String keyword; 

			public void setSearchType(String searchType) {
			 this.searchType = searchType;  
			}

			public String getSearchType() {
			 return searchType;
			} 

			public void setKeyword(String keyword) {
			 this.keyword = keyword;  
			} 

			public String getKeyword() {
			 return keyword;
			}
}
