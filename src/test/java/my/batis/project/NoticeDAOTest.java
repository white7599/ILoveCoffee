package my.batis.project;

import javax.inject.Inject;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import my.batis.project.dao.NoticeDAO;
import my.batis.project.dto.NoticeVO;

//Runner 클래스(테스트 메소드를 실행하는 클래스) 를 SpringJUnit4ClassRunner로 함
@RunWith(SpringJUnit4ClassRunner.class)
//location 속성 경로에 있는 xml 파일을 이용해서 스프링이 로딩됨
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/root-context.xml")
public class NoticeDAOTest {
	@Inject
	private NoticeDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeDAOTest.class);
	private static boolean didupdate = false;
	private static int maxIdx = 0;
	
	
	@Before
	public void getMaxIdx() {
		if(maxIdx == 0) {
			dao.insertNotice(createNotice("new-title", "new-contents"));
			maxIdx = dao.getMaxIdx();
			System.out.println("maxIdx:"+maxIdx);
		}
	}
	
		
	@Test
	public void updateTest() {
		NoticeVO notice = createNotice("edit-title", "edit-test");
		notice.setIdx(maxIdx);
		dao.updateNotice(notice);
		didupdate = true;
	}
	
	@After
	public void deleteTest(){
		if(didupdate == true) {
			logger.info(dao.noticeList().toString());
			dao.deleteNotice(maxIdx);
			didupdate = false;
		}
	}
	
	private NoticeVO createNotice(String title, String contents) {
		NoticeVO notice = new NoticeVO();
		notice.setTitle(title);
		notice.setContents(contents);
		return notice;
	}
	
}
