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

import my.batis.project.dao.ProductDAO;
import my.batis.project.dto.ProductVO;

//Runner 클래스(테스트 메소드를 실행하는 클래스) 를 SpringJUnit4ClassRunner로 함
@RunWith(SpringJUnit4ClassRunner.class)
//location 속성 경로에 있는 xml 파일을 이용해서 스프링이 로딩됨
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/root-context.xml")
public class ProductDAOTest {
	@Inject
	private ProductDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(ProductDAOTest.class);
	private static boolean didupdate = false;
	private static int maxIdx = 0;
	
	
	@Before
	public void getMaxIdx() {
		if(maxIdx == 0) {
			dao.insertProduct(createProduct(1, "아프리카 빈", "Africa Bean", "aaa.jpg"));
			maxIdx = dao.getMaxIdx();
			System.out.println("maxIdx:"+maxIdx);
		}
	}
	
		
	@Test
	public void updateTest() {
		ProductVO product = createProduct(1, "아프리카 빈", "Africa Bean", "aaa.jpg");
		product.setIdx(maxIdx);
		dao.updateProduct(product);
		didupdate = true;
	}
	
	@After
	public void deleteTest(){
		if(didupdate == true) {
			logger.info(dao.productList().toString());
			dao.deleteProduct(maxIdx);
			didupdate = false;
		}
	}
	
	private ProductVO createProduct(int type_idx, String name, String eng_name, String image) {
		ProductVO product = new ProductVO();
		product.setType_idx(type_idx);
		product.setName(name);
		product.setEng_name(eng_name);
		product.setImage_file(image);
		
		return product;
	}
	
}
