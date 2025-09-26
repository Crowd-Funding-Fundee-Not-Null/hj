package com.fundee.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fundee.dto.NoticeDTO;
import com.fundee.mapper.NoticeMapper;

import lombok.RequiredArgsConstructor;

@Service
public class NoticeDAO {

	@Autowired
	NoticeMapper noticeMapper;
	
	public List<NoticeDTO> getAllNotice(int start, int end) throws Exception {
		return noticeMapper.getAllNotice(start,end);
	}
	
	public List<NoticeDTO> getImportantNotice() throws Exception {
		return noticeMapper.getImportantNotice();
	}
	
	public int getDataCount() throws Exception {
		return noticeMapper.getDataCount();
	}
	
	public NoticeDTO getNoticeDetail(int notice_num) throws Exception {
		return noticeMapper.getNoticeDetail(notice_num);
	}
	
	public void updateNoticeHitCount(int notice_num) throws Exception {
		noticeMapper.updateNoticeHitCount(notice_num);
	}
	
	public int getMaxNum() throws Exception {
		return noticeMapper.getMaxNum();
	}
	
	public void insertNotice(NoticeDTO dto) throws Exception {
		noticeMapper.insertNotice(dto);
	}
	
	public void deleteNotice(int notice_num) throws Exception {
		noticeMapper.deleteNotice(notice_num);
	}
	
	
	
	
	
}
