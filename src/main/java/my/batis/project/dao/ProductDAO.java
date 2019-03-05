package my.batis.project.dao;

import java.util.List;

import my.batis.project.dto.Criteria;
import my.batis.project.dto.ProductTypeVO;
import my.batis.project.dto.ProductVO;

public interface ProductDAO {
	public void insertProduct(ProductVO vo);	
	public ProductVO viewProduct(Integer idx);
	public void updateProduct(ProductVO vo);
	public void deleteProduct(Integer idx);
	public List<ProductVO> productList();
	public Integer getMaxIdx();
	public List<ProductVO> productListPage(Criteria cri);
	public int getTotalCount(Criteria cri);
	public List<ProductVO> productListPerType(Integer type_idx);
	
	public List<ProductTypeVO> productTypeList();	
	public void insertProductType(ProductTypeVO typevo);
	public ProductTypeVO viewProductType(Integer idx);
	public void updateProductType(ProductTypeVO typevo);
	public void deleteProductType(Integer idx);
	public List<ProductTypeVO> menuProductTypeList();
	public List<ProductVO> menuProductList(int idx);
	
}
