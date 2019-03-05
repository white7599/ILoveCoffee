package my.batis.project;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class URITestData {
	private static final Logger logger =
			LoggerFactory.getLogger(URITestData.class);
	@Test
	public void uriTest() {
		int page = 6;
		int perPageNum = 10;
		
		UriComponents uriComponets = UriComponentsBuilder.newInstance()
				.path("/notice/listPage")
				.queryParam("page", page)
				.queryParam("perPageNum", perPageNum)
				.build();
		
		String uri = "/notice/listPage?page=" + page + "&perPageNum=" + perPageNum;
		
		logger.info(uri);
		logger.info(uriComponets.toString());
		//같지 않으면 에러
		assertEquals(uri, uriComponets.toString());
	}
}
