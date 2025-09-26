package com.fundee.util;

public class MyUtil {

	//전체 페이지 갯수
	public int getPagecount(int numPerPage, int dataCount) {
		
		int pageCount = 0;
		
		pageCount = dataCount / numPerPage;
		
		if (dataCount % numPerPage != 0) {
			pageCount++;
		}
		
		return pageCount;
	}
	
	
	//페이징 처리 메소드
	public String pageIndexList(int currentPage, int totalPage, int numPerBlock, String listUrl) {
		
		//int numPerBlock :	◀이전 6 7 8 9 10 다음▶
		int currentPageSetup;	//◀이전 을 누르면 이동할 pageNum 의 값
		int page;
		
		StringBuffer sb = new StringBuffer();
		
		if (currentPage==0 || totalPage==0) {
			return "";
		}
		
		//list.jsp
		//list.jsp?searchKey=name&searchValue=suzi
		
		if (listUrl.indexOf("?")!=-1) { //검색했을 때
			listUrl += "&";
		} else {
			listUrl += "?";
		}
		
		//◀이전 의 pageNum
		currentPageSetup = (currentPage/numPerBlock)*numPerBlock;
		
		if (currentPage % numPerBlock == 0) {
			currentPageSetup -= numPerBlock;
		}
		
		sb.append("<ul class=\"pagination justify-content-center\" >");
		
		
		
		//◀이전
		if (totalPage>numPerBlock && currentPageSetup>0) {
			sb.append("<li class=\"page-item\">");
			sb.append("<a class=\"page-link\" href=\"" + listUrl + "pageNum=" + currentPageSetup + "\">◀</a>&nbsp;");
			// <a href="list.jsp?pageNum=5">◀이전</a>&nbsp;
			sb.append("</li>");
		}
		
		
		
		
		//바로가기 페이지
		page = currentPageSetup + 1;
		
		while (page<=totalPage && page<=(currentPageSetup+numPerBlock)) {
			
			if (page==currentPage) {
				sb.append("<li class=\"page-item active\" aria-current=\"page\">");
				sb.append("<span class=\"page-link\">"+page);
				sb.append("<span class=\"sr-only\">(current)</span></span>");
				sb.append("</li>");
			} else {
				sb.append("<li class=\"page-item\">");
				sb.append("<a class=\"page-link\" href=\"" + listUrl + "pageNum=" + page +"\">" + page + "</a>&nbsp;");
				sb.append("</li>");
			}
			
			page++;
			
		}
		
		
		//다음▶
		if (totalPage - currentPageSetup > numPerBlock) {
			sb.append("<li class=\"page-item\">");
			sb.append("<a class=\"page-link\" href=\"" + listUrl + "pageNum=" + page + "\">▶</a>&nbsp;");
			// <a href="list.jsp?pageNum=11">다음▶</a>&nbsp;
			sb.append("</li>");
		}
		
		
		sb.append("</ul>");
		
		
		return sb.toString();
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
