package my.batis.project.dao;

import java.util.List;

import my.batis.project.dto.Criteria;
import my.batis.project.dto.FaqVO;
import my.batis.project.dto.NoticeVO;
// Notice 와 FAQ 함께 사용
public interface NoticeDAO {
	public void insertNotice(NoticeVO vo);	
	public NoticeVO viewNotice(Integer idx);
	public void updateNotice(NoticeVO vo);
	public void deleteNotice(Integer idx);
	public List<NoticeVO> noticeList();
	public Integer getMaxIdx();
	public List<NoticeVO> listPage(Criteria cri);
	public int getTotalCount(Criteria cri);
	
	public NoticeVO prevNotice(Integer idx);
	public NoticeVO nextNotice(Integer idx);
	
	public List<FaqVO> faqList();
	public void insertFaq(FaqVO vo);
	public void updateFaq(FaqVO vo);
	public void deleteFaq(int idx);
	public FaqVO faq(Integer idx);
}
