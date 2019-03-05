package my.batis.project.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import my.batis.project.dto.Criteria;
import my.batis.project.dto.ProductTypeVO;
import my.batis.project.dto.ProductVO;

@Repository //DAO를 스프링에 인식시키기 위해서 사용
public class ProductDAOImpl implements ProductDAO {
	
	@Inject
	private SqlSession sqlSession;	
	
	private static final String NS = "ProductMapper";
	private static final String INSERT = NS+".insertProduct";
	private static final String VIEW = NS+".viewProduct";
	private static final String UPDATE = NS+".updateProduct";
	private static final String DELETE = NS+".deleteProduct";
	private static final String LIST = NS+".productList";
	private static final String GETMAXIDX = NS+".getMaxIdx";
	private static final String LISTPAGE = NS+".productListPage";
	private static final String GETTOTALCOUNT = NS+".gettotalcount";
	private static final String PRODUCTLISTPERTYPE = NS + ".selectProductListPerType";
	
	private static final String PRODUCT_TYPE_LIST = NS+".productTypeList";
	private static final String PRODUCT_TYPE_INSERT = NS + ".insertProductType";
	private static final String PRODUCT_TYPE_UPDATE = NS + ".updateProductType";
	private static final String PRODUCT_TYPE_DELETE = NS + ".deleteProductType";
	private static final String PRODUCT_TYPE_VIEW = NS + ".viewProductType";
	private static final String PRODUCT_TYPE_MENU_LIST = NS + ".menuProductTypeList";
	private static final String PRODUCT_MENU_LIST = NS + ".menuProductList";

	@Override
	public void insertProduct(ProductVO vo) {
		sqlSession.insert(INSERT, vo);
	}

	@Override
	public ProductVO viewProduct(Integer idx) {
		return sqlSession.selectOne(VIEW, idx);
	}

	@Override
	public void updateProduct(ProductVO vo) {
		sqlSession.update(UPDATE, vo);
	}

	@Override
	public void deleteProduct(Integer idx) {
		sqlSession.delete(DELETE, idx);
	}

	@Override
	public List<ProductVO> productList() {
		return sqlSession.selectList(LIST);
	}

	@Override
	public Integer getMaxIdx() {
		return sqlSession.selectOne(GETMAXIDX);
	}

	@Override
	public List<ProductVO> productListPage(Criteria cri) {
		return sqlSession.selectList(LISTPAGE, cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		return sqlSession.selectOne(GETTOTALCOUNT, cri);
	}

	@Override
	public List<ProductTypeVO> productTypeList() {
		return sqlSession.selectList(PRODUCT_TYPE_LIST);
	}

	@Override
	public void insertProductType(ProductTypeVO typevo) {
		sqlSession.insert(PRODUCT_TYPE_INSERT, typevo);		
	}

	@Override
	public ProductTypeVO viewProductType(Integer idx) {
		return sqlSession.selectOne(PRODUCT_TYPE_VIEW, idx);
	}

	@Override
	public void updateProductType(ProductTypeVO typevo) {
		sqlSession.update(PRODUCT_TYPE_UPDATE, typevo);
	}

	@Override
	public void deleteProductType(Integer idx) {
		sqlSession.delete(PRODUCT_TYPE_DELETE, idx);
	}

	@Override
	public List<ProductVO> productListPerType(Integer type_idx) {
		return sqlSession.selectList(PRODUCTLISTPERTYPE, type_idx);
		
	}

	@Override
	public List<ProductTypeVO> menuProductTypeList() {
		return sqlSession.selectList(PRODUCT_TYPE_MENU_LIST);
	}

	@Override
	public List<ProductVO> menuProductList(int idx) {
		return sqlSession.selectList(PRODUCT_MENU_LIST, idx);
	}

}
