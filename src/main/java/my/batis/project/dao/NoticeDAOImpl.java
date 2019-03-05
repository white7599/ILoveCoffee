package my.batis.project.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import my.batis.project.dto.Criteria;
import my.batis.project.dto.FaqVO;
import my.batis.project.dto.NoticeVO;

@Repository //DAO를 스프링에 인식시키기 위해서 사용
public class NoticeDAOImpl implements NoticeDAO{

	@Inject
	private SqlSession sqlSession;	
	
	private static final String NS = "NoticeMapper";
	private static final String INSERT = NS+".insertNotice";
	private static final String VIEW = NS+".viewNotice";
	private static final String UPDATE = NS+".updateNotice";
	private static final String DELETE = NS+".deleteNotice";
	private static final String LIST = NS+".noticeList";
	private static final String GETMAXIDX = NS+".getMaxIdx";
	private static final String LISTPAGE = NS+".listPage";
	private static final String GETTOTALCOUNT = NS+".gettotalcount";
	private static final String PREV = NS+".prevNotice";
	private static final String NEXT = NS+".nextNotice";
	
	private static final String FAQLIST = NS+".faqList";
	private static final String FAQINSERT = NS+".faqInsert";
	private static final String FAQUPDATE = NS+".faqUpdate";
	private static final String FAQDELETE = NS+".faqDelete";
	private static final String FAQ = NS+".faq";
	
	@Override
	public void insertNotice(NoticeVO vo) {
		sqlSession.insert(INSERT, vo);
		
	}
	@Override
	public NoticeVO viewNotice(Integer idx) {
		return sqlSession.selectOne(VIEW, idx);
	}
	@Override
	public void updateNotice(NoticeVO vo) {
		sqlSession.update(UPDATE, vo);
		
	}
	@Override
	public void deleteNotice(Integer idx) {
		sqlSession.delete(DELETE, idx);
		
	}
	@Override
	public List<NoticeVO> noticeList() {
		return sqlSession.selectList(LIST);
	}
	@Override
	public Integer getMaxIdx() {
		return sqlSession.selectOne(GETMAXIDX);
	}
	@Override
	public List<NoticeVO> listPage(Criteria cri) {
		return sqlSession.selectList(LISTPAGE, cri);
	}
	@Override
	public int getTotalCount(Criteria cri) {
		return sqlSession.selectOne(GETTOTALCOUNT, cri);
	}
	@Override
	public List<FaqVO> faqList() {
		return sqlSession.selectList(FAQLIST);
	}
	@Override
	public NoticeVO prevNotice(Integer idx) {
		return sqlSession.selectOne(PREV, idx);
	}
	@Override
	public NoticeVO nextNotice(Integer idx) {
		return sqlSession.selectOne(NEXT, idx);
	}
	@Override
	public void insertFaq(FaqVO vo) {		
		sqlSession.insert(FAQINSERT, vo);
	}
	@Override
	public void updateFaq(FaqVO vo) {
		sqlSession.update(FAQUPDATE, vo);		
	}
	@Override
	public void deleteFaq(int idx) {
		sqlSession.delete(FAQDELETE, idx);		
	}
	@Override
	public FaqVO faq(Integer idx) {
		return sqlSession.selectOne(FAQ, idx);
	}	
	

}
