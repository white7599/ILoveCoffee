package my.batis.project.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import my.batis.project.dao.NoticeDAO;
import my.batis.project.dto.Criteria;
import my.batis.project.dto.FaqVO;
import my.batis.project.dto.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Inject
	private NoticeDAO dao;
	
	@Override
	public void regist(NoticeVO notice) throws Exception {
		dao.insertNotice(notice);
	}

	@Override
	public NoticeVO read(Integer idx) throws Exception {
		return dao.viewNotice(idx);
	}

	@Override
	public void modify(NoticeVO notice) throws Exception {
		dao.updateNotice(notice);
	}

	@Override
	public void remove(Integer idx) throws Exception {
		dao.deleteNotice(idx);
	}

	@Override
	public List<NoticeVO> listAll() throws Exception {
		return dao.noticeList();
	}

	@Override
	public void dummy() throws Exception {
		int maxIdx;
		
		if(dao.getMaxIdx() == null)
		{
			maxIdx = 0;
		} else {
			maxIdx = dao.getMaxIdx();
		}
		
		NoticeVO notice = new NoticeVO();
		
		for(int i = maxIdx + 1; i < maxIdx + 101; i++ ) {
			notice.setTitle("dummytitle"+i);
			notice.setContents("연습용 게시물입니다!");
			regist(notice);
		}
		
	}

	@Override
	public List<NoticeVO> listPage(Criteria cri) throws Exception {
		return dao.listPage(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) throws Exception {
		return dao.getTotalCount(cri);
	}

	@Override
	public List<FaqVO> faqList() throws Exception {
		return dao.faqList();
	}

	@Override
	public NoticeVO prevNotice(Integer idx) throws Exception {
		return dao.prevNotice(idx);
	}

	@Override
	public NoticeVO nextNotice(Integer idx) throws Exception {
		return dao.nextNotice(idx);
	}
		

}
