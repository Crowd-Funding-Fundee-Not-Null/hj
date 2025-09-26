package com.fundee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fundee.dto.BuyListDTO;
import com.fundee.dto.PostsDTO;

@Mapper
public interface BuyMapper {
	
//구매번호
	public int maxNumber() throws Exception;

	//구매하기 눌렀을때 이전 페이지의 상품과 수량 가지고 오는 기능
//포스츠넘을 받아서 상품을 끌어오고, 사용자가 수량을 적고,
//작성한사람의 아이디와 이름을 가져와와서 저장해야해
	public void buyData(int posts_num) throws Exception;
	
	
//이거는 수량만 변경해서 저장하는 기능으로 바꿔야 할것같아
//구매하기 창에서 결제하기 버튼 눌렀을때 - 구매할 상품 및 수량 저장
//반환값 없이 데이터 저장 기능
	public void insertData(BuyListDTO dto) throws Exception;
	
    public void updateQty(BuyListDTO dto) throws Exception;

	
//구매완료 페이지에서 사용하는
// 구매번호로 찾아서 구매제품,수량, 받을주소, 이름 출력(한개 출력)
	public BuyListDTO checkData(int buy_no) throws Exception;

//마이페이지에서 사용하는 구매자 아이디로 찾아서 전체구매내역 출력(꾸러미닷)
// 구매한 상품, 수량, 총결제금액, 구매일자 텍스트 출력
	public List<BuyListDTO> getBuyListAll(String id) throws Exception ;

	
//-----------------------------------------
	//상품번호 기준으로 posts 테이블 정보 가져와(계산해야하거든)
	public PostsDTO selectPostsInfo(int posts_num) throws Exception;
	
	//posts 테이블 업데이트 할거야
	public void updatePosts(PostsDTO dto)throws Exception;
	
	
	
	
	
}