package my.batis.project;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;

import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import my.batis.project.dto.Criteria;
import my.batis.project.dto.NoticeVO;
import my.batis.project.service.NoticeService;

@RunWith(SpringJUnit4ClassRunner.class)
//location 속성 경로에 있는 xml 파일을 이용해서 스프링이 로딩됨
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/root-context.xml")
public class ServiceTest {
	@Inject
	private NoticeService service;
	private static Logger logger = LoggerFactory.getLogger(ServiceTest.class);
	
	@Test
	public void listPageTest() throws Exception{
		Criteria cri = new Criteria();
		cri.setPage(3);
		cri.setPerPageNum(10);
		List<NoticeVO> noticeList = service.listPage(cri);
		for (NoticeVO notice : noticeList) {
			logger.info(notice.getIdx()+ ":" + notice.getTitle());
		}		
	}
	
	@Test
	public void getTotalCountTest() throws Exception {
		Criteria cri = new Criteria();
		Integer totalCount = service.getTotalCount(cri);
		logger.info("totalCount: "+totalCount.toString());
	}
}
