package my.batis.project.service;

import java.util.List;

import my.batis.project.dto.Criteria;
import my.batis.project.dto.FaqVO;
import my.batis.project.dto.NoticeVO;

public interface NoticeService {
	public void regist(NoticeVO notice) throws Exception;
	public NoticeVO read(Integer idx)  throws Exception;
	public NoticeVO prevNotice(Integer idx)  throws Exception;
	public NoticeVO nextNotice(Integer idx)  throws Exception;
	public void modify(NoticeVO notice) throws Exception;
	public void remove(Integer idx) throws Exception;
	public List<NoticeVO> listAll() throws Exception;
	public List<NoticeVO> listPage(Criteria cri) throws Exception;
	public int getTotalCount(Criteria cri) throws Exception;
	public List<FaqVO> faqList() throws Exception;
	
	public void dummy() throws Exception;
}
