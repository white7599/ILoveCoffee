package my.batis.project.controller;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import my.batis.project.dao.AdminDAO;
import my.batis.project.dao.DirectQuestionDAO;
import my.batis.project.dao.MemberDAO;
import my.batis.project.dao.NoticeDAO;
import my.batis.project.dao.OrderDAO;
import my.batis.project.dao.OrderDetailDAO;
import my.batis.project.dao.ProductDAO;
import my.batis.project.dto.AdminVO;
import my.batis.project.dto.AuthInfo;
import my.batis.project.dto.Criteria;
import my.batis.project.dto.DirectQuestionVO;
import my.batis.project.dto.FaqVO;
import my.batis.project.dto.MemberVO;
import my.batis.project.dto.NoticeVO;
import my.batis.project.dto.OrderVO;
import my.batis.project.dto.PageMaker;
import my.batis.project.dto.ProductTypeVO;
import my.batis.project.dto.ProductVO;
import my.batis.project.service.AuthService;


@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Inject
	ProductDAO dao;
	@Inject
	NoticeDAO noticeDao;
	@Inject
	MemberDAO memberDao;
	@Inject
	OrderDAO orderDao;
	@Inject
	OrderDetailDAO orderDetailDao;
	@Inject
	AdminDAO adminDao;
	@Inject
	AuthService authService;
	@Inject
	DirectQuestionDAO	directQuestionDao;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class); 
	private static final String UPLOAD_PATH = "D:\\DEVELOPE\\workspaceSpringMVCNew\\mybatis\\src\\main\\webapp\\resources\\uploadImg";	
	
	
	// 첫 화면(index) 링크
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String admin(Model model) {
		logger.info("/ get...");	
		return "/admin/login";
	}
	
	// 첫 화면(index) 링크
	@RequestMapping(value="/index", method=RequestMethod.GET)
	public void indexGet(Model model) {
		logger.info("index get...");		
	}
	
	// 상품타입등록 링크
	@RequestMapping(value="/productTypeReg", method=RequestMethod.GET)
	public void productTypeRegGET() {
		logger.info("productTypeRegGet ... ");
	}	
	
	// 상품타입 등록 후 화면 전환
	@RequestMapping(value="/productTypeReg", method=RequestMethod.POST)
	public String productTypeRegPOST(@ModelAttribute("productType") ProductTypeVO productType) throws Exception {
		logger.info("productUpdatePOST");
		dao.insertProductType(productType);
		
		return "redirect:/admin/productTypeList";
	}
	
	// 상품타입 리스트 링크
	@RequestMapping(value="/productTypeList", method=RequestMethod.GET)
	public void productTypeListGET(Model model) {
		logger.info("productTypeListGET ... ");
		List<ProductTypeVO> productTypeList = dao.productTypeList();
		model.addAttribute("productTypeList", productTypeList); 
	}	
	
	// 상품타입 수정 링크
	@RequestMapping(value="/productTypeUpdate", method=RequestMethod.GET)
	public void productTypeUpdateGET(@RequestParam("idx") Integer idx, Model model) {
		logger.info("productTypeUpdateGet ... ");
		ProductTypeVO productType = dao.viewProductType(idx);
		model.addAttribute("productType", productType);
	}	
	
	// 상품타입 수정
	@RequestMapping(value="/productTypeUpdate", method=RequestMethod.POST)
	public String productTypeUpdatePOST(@ModelAttribute("productType") ProductTypeVO productType) {
		logger.info("productUpdatePOST");
		dao.updateProductType(productType);
		
		return "redirect:/admin/productTypeList";
	}
	
	// 상품타입 삭제 처리
	@RequestMapping(value="/productTypeRemove", method=RequestMethod.GET)
	public String productTypeRemoveGET(@RequestParam("idx") Integer idx) throws Exception {
		logger.info("productTypeRemove");
		dao.deleteProductType(idx);
		return "redirect:/admin/productTypeList";
	}
	
	// 상품 등록 링크
	@RequestMapping(value="/productReg", method=RequestMethod.GET)
	public void productRegGET(Model model) {
		logger.info("productRegGET ... ");
		List<ProductTypeVO> productType = dao.productTypeList();
		model.addAttribute("productTypeList", productType);
	}
	
	// 상품 등록 후 화면 전환 -> 상품 이미지 업로드 및 상품 내용 등록 -> 리스트 화면으로 전환
	@RequestMapping(value = "/productReg", method = RequestMethod.POST)
	public String uploadPost(MultipartFile uploadfile, @ModelAttribute("product") ProductVO product, Model model) {
	    logger.info("upload() POST 호출");
	    logger.info("파일 이름: {}", uploadfile.getOriginalFilename());
	    logger.info("파일 크기: {}", uploadfile.getSize());

	    String result = saveFile(uploadfile);
	    if(result != null) {
	    	model.addAttribute("result", result);
	    	
	    } else {
	    	model.addAttribute("result", "fail");
	    }

	    product.setImage_file(result);
	    dao.insertProduct(product);
	    
	    return "redirect:/admin/productListPage";
	}

	// 상품 등록 파일 업로드처리	
	private String saveFile(MultipartFile file) {
	    // 파일 이름 변경
	    UUID uuid = UUID.randomUUID();
	    String saveName = uuid + "_" + file.getOriginalFilename();

	    logger.info("saveName: {}",saveName);

	    // 저장할 File 객체를 생성(껍데기 파일)
	    File saveFile = new File(UPLOAD_PATH, saveName); // 저장할 폴더 이름, 저장할 파일 이름

	    try {
	        file.transferTo(saveFile); // 업로드 파일에 saveFile이라는 껍데기 입힘
	    } catch (IOException e) {
	        e.printStackTrace();
	        return null;
	    }

	    return saveName;
	} 
	
	// 상품 파일 삭제 처리
	public void deleteFile(String image_file) {
		File file = new File(UPLOAD_PATH, image_file);
		if(file.exists()) {
			file.delete();
		}
	}
	
	// 상품 리스트 링크 -> 리스트 링크시 productList 객체 받아 값 세팅
	@RequestMapping(value="/productList", method=RequestMethod.GET) 
	public void productListGET(Model model) { 
		logger.info("productListGet...");
		List<ProductVO> productList = dao.productList();
		model.addAttribute("productList", productList); 
	}
	
	// 상품 리스트페이지 링크(productListPage)
	@RequestMapping(value="/productListPage", method=RequestMethod.GET) 
	public void productListPageGET(Criteria cri, Model model) { 
		logger.info("productListPageGET...");
		List<ProductVO> productList = dao.productListPage(cri);
		model.addAttribute("productList", productList); 
		//PageMaker 객체 생성
		PageMaker pageMaker = new PageMaker(cri);
		//전체 게시물 수를 구함
		int totalCount = dao.getTotalCount(cri);
		//pageMaker로 전달 -> pageMaker는 startPage, endPage, prev, next를 계산함
		pageMaker.setTotalCount(totalCount);
		//모델에 추가
		model.addAttribute("pageMaker", pageMaker);
		
		List<ProductTypeVO> productType = dao.productTypeList();
		model.addAttribute("productTypeList", productType);
	}
	
	
	// 상품 view 링크
	@RequestMapping(value="/productView", method=RequestMethod.GET)
	public void productView(@RequestParam("idx") Integer idx, @ModelAttribute("cri") Criteria cri, Model model) {
		logger.info("productViewGET()");
		ProductVO product = dao.viewProduct(idx);
		List<ProductTypeVO> productType = dao.productTypeList();
		model.addAttribute("product", product);
		model.addAttribute("productTypeList", productType);
	}
	
	// 상품 삭제 처리
	@RequestMapping(value="/productRemove", method=RequestMethod.GET)
	public String productRemove(@RequestParam("idx") Integer idx, Criteria cri, RedirectAttributes rttr) throws Exception {
		logger.info("productRemove");
		ProductVO product = dao.viewProduct(idx);
		String image_file = product.getImage_file();
		deleteFile(image_file);
		dao.deleteProduct(idx);
		rttr.addFlashAttribute("result", "removeOK");
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/admin/productListPage";
	}
	
	// 상품 정보 업데이트 링크
	@RequestMapping(value="/productUpdate", method=RequestMethod.GET)
	public void productUpdateGET(@RequestParam("idx") Integer idx, 
							@ModelAttribute("cri") Criteria cri,
							Model model) throws Exception {
		logger.info("productUpdateGET");
		ProductVO product = dao.viewProduct(idx);
		List<ProductTypeVO> productType = dao.productTypeList();		
		model.addAttribute("product", product);
		model.addAttribute("productTypeList", productType);
	}
	
	// 상품 정보 업데이트 처리 후 화면 전환
	@RequestMapping(value="/productUpdate", method=RequestMethod.POST)
	public String productUpdatePOST(MultipartFile uploadfile, ProductVO product, Criteria cri, RedirectAttributes rttr) throws Exception {
		logger.info("productUpdatePOST");
		// 새파일이 등록되면 파일 업로드 진행(업로드 하고  업로드된 파일을 새로 세팅), 파일 업로드 없는 경우(사이즈로 체크)는 image_file 그대로 세팅
		System.out.println("uploadfile.getSize()="+uploadfile.getSize());
		if(uploadfile.getSize() > 0) {
			String result = saveFile(uploadfile);
			if(result != null) {
				product.setImage_file(result);		    	
		    } else {
		    	logger.info(result);
		    }
		}
		product.setImage_file(product.getImage_file());
	    System.out.println("image file="+product.getImage_file());
		dao.updateProduct(product);
		rttr.addFlashAttribute("result","saveOK");
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("idx", product.getIdx());
		return "redirect:/admin/productView";
	}
	
	// 공지사항 리스트 링크
	@RequestMapping(value="/noticeList", method=RequestMethod.GET) 
	public void noticeListGET(Criteria criNotice, Model model) { 
		logger.info("noticeListGET...");
		List<NoticeVO> noticeList = noticeDao.listPage(criNotice);
		model.addAttribute("noticeList", noticeList); 
		//PageMaker 객체 생성
		PageMaker pageMaker = new PageMaker(criNotice);
		//전체 게시물 수를 구함
		int totalCount = noticeDao.getTotalCount(criNotice);
		//pageMaker로 전달 -> pageMaker는 startPage, endPage, prev, next를 계산함
		pageMaker.setTotalCount(totalCount);
		logger.info("totalCount..."+totalCount);
		//모델에 추가
		model.addAttribute("pageMaker", pageMaker);
	}
	
	// 공지사항 등록 링크
	@RequestMapping(value="/noticeReg", method=RequestMethod.GET)
	public void noticeRegGet(Model model) {
		logger.info("noticeRegGet get...");
	}
	
	// 공지사항 등록 후 화면 전환 -> 리스트 화면으로 전환
	@RequestMapping(value = "/noticeReg", method = RequestMethod.POST)
	public String noticeRegPost(@ModelAttribute("notice") NoticeVO notice, Model model) {
	    logger.info("noticeRegPost 호출");
	    
	    noticeDao.insertNotice(notice);	    
	    return "redirect:/admin/noticeList";
	}
	
	// summernote 적용 공지사항 등록
	// 파일 업로드처리	
	@RequestMapping(value="/image", method=RequestMethod.POST)
	private void saveFile(@RequestParam("file") MultipartFile file, HttpServletResponse response) throws IOException {
	    // 파일 이름 변경
	    //UUID uuid = UUID.randomUUID();
	    //String saveName = uuid + "_" + file.getOriginalFilename();
		
		String saveName = file.getOriginalFilename();
	    logger.info("saveName: {}",saveName);

	    // 저장할 File 객체를 생성(껍데기 파일)
	    File saveFile = new File(UPLOAD_PATH, saveName); // 저장할 폴더 이름, 저장할 파일 이름

	    try {
	        file.transferTo(saveFile); // 업로드 파일에 saveFile이라는 껍데기 입힘
	    } catch (IOException e) {
	        e.printStackTrace();
	    }

	    response.setCharacterEncoding("utf-8");
		response.getWriter().println(saveName);
		response.getWriter().close();
	} 
	
	//공지사항 view 화면 링크
	@RequestMapping(value="/noticeView", method=RequestMethod.GET)
	public void noticeView(@RequestParam("idx") Integer idx, @ModelAttribute("cri") Criteria cri, Model model) {
		logger.info("noticeView()");
		NoticeVO notice = noticeDao.viewNotice(idx);
		
		model.addAttribute("notice", notice);
	}
	
	// 공지사항 삭제 처리
	@RequestMapping(value="/noticeRemove", method=RequestMethod.GET)
	public String noticeRemove(@RequestParam("idx") Integer idx, Criteria cri, RedirectAttributes rttr) throws Exception {
		logger.info("noticeRemove");
		noticeDao.deleteNotice(idx);
		
		rttr.addFlashAttribute("result", "removeOK");
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/admin/noticeList";
	}
	
	// 공지사항 업데이트 링크
	@RequestMapping(value="/noticeUpdate", method=RequestMethod.GET)
	public void noticeUpdate(@RequestParam("idx") Integer idx, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		logger.info("noticeUpdateGET");
		NoticeVO notice = noticeDao.viewNotice(idx);
		model.addAttribute("notice", notice);
	}
	
	// 공지사항 업데이트 처리 후 화면 전환
	@RequestMapping(value="/noticeUpdate", method=RequestMethod.POST)
	public String noticeUpdatePOST(NoticeVO notice, Criteria cri, RedirectAttributes rttr) throws Exception {
		logger.info("noticeUpdate...");
		noticeDao.updateNotice(notice);
				
		rttr.addFlashAttribute("result","saveOK");
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("idx", notice.getIdx());
		return "redirect:/admin/noticeView";
	}	
	
	// faq 리스트 링크
	@RequestMapping(value="/faqList", method=RequestMethod.GET)
	public void faqListGET(Model model) {
		logger.info("faqListGET");
		model.addAttribute("faqList", noticeDao.faqList());
	}
	
	
	// faq 등록 링크
	@RequestMapping(value="/faqReg", method=RequestMethod.GET)
	public void faqRegGet(Model model) {
		logger.info("faqRegGet get...");
	}
	
	// faq 등록 처리 후 리스트로 전환
	@RequestMapping(value="/faqReg", method=RequestMethod.POST)
	public String faqRegPOST(FaqVO faqVO, Model model) {
		logger.info("faqRegPOST ...");
		
		noticeDao.insertFaq(faqVO);	
		
		return "redirect:faqList";
	}
	
	// 1:1 문의 리스트 링크
	@RequestMapping(value="/directList", method=RequestMethod.GET)
	public void directListGet(Model model) {
		logger.info("directListGet get...");

		List<DirectQuestionVO> directQuestionList = directQuestionDao.directQuestionList();
		logger.info(""+directQuestionList.size());
		model.addAttribute("directQuestionList", directQuestionList);
	}
	
	// 1:1 문의 보기
	@RequestMapping(value="/directView", method=RequestMethod.GET)
	public void directView(@RequestParam("idx") int idx, Model model) {
		logger.info("directView get...");

		DirectQuestionVO directQuestionVo = directQuestionDao.viewDirectQuestion(idx);
		model.addAttribute("directQuestionVo", directQuestionVo);
	}
	
	// 1:1 답변하기
	@RequestMapping(value="/insertAnswer", method=RequestMethod.POST)
	public void insertAnswer(@RequestParam("idx") int idx, @RequestParam("answer") String answer, HttpServletResponse response) throws IOException {
		logger.info("insertAnswer");
		DirectQuestionVO vo = directQuestionDao.viewDirectQuestion(idx);
		vo.setAnswer(answer);
		directQuestionDao.updateDirectQuestion(vo);		
		response.setCharacterEncoding("utf-8");		  
	    response.getWriter().println("success");  
	    response.getWriter().close();		
	}
	
	
	
	// 회원 리스트 링크
	@RequestMapping(value="/memberList", method=RequestMethod.GET) 
	public void memberListGET(Criteria cri, Model model) { 
		logger.info("memberListGET...");
		List<MemberVO> memberList = memberDao.memberList(cri);
		model.addAttribute("memberList", memberList); 
		//PageMaker 객체 생성
		PageMaker pageMaker = new PageMaker(cri);
		//전체 게시물 수를 구함
		int totalCount = memberDao.getTotalCount(cri);
		//pageMaker로 전달 -> pageMaker는 startPage, endPage, prev, next를 계산함
		pageMaker.setTotalCount(totalCount);
		logger.info("totalCount..."+totalCount);
		//모델에 추가
		model.addAttribute("pageMaker", pageMaker);
	}
	
	// 회원 정보 보기 링크
	@RequestMapping(value="/memberView", method=RequestMethod.GET)
	public void memberView(@RequestParam("id") String id, @ModelAttribute("cri") Criteria cri, Model model) {
		logger.info("memberView()");
		MemberVO member = memberDao.viewMember(id);
		model.addAttribute("member", member);
	}
	
	// 회원정보 삭제 처리
	@RequestMapping(value="/memberRemove", method=RequestMethod.GET)
	public String memberRemove(@RequestParam("id") String id, Criteria cri, RedirectAttributes rttr) throws Exception {
		logger.info("memberRemove="+id);
		try {
			memberDao.deleteMember(id);
			rttr.addFlashAttribute("result", "removeOK");
			rttr.addAttribute("page", cri.getPage());
			rttr.addAttribute("perPageNum", cri.getPerPageNum());
			rttr.addAttribute("searchType", cri.getSearchType());
			rttr.addAttribute("keyword", cri.getKeyword());
		} catch(Exception e) {
			e.getStackTrace();
		}
		return "redirect:/admin/memberList";
	}
	
	// 회원정보 업데이트 링크
	@RequestMapping(value="/memberUpdate", method=RequestMethod.GET)
	public void memberUpdateGET(@RequestParam("id") String id, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		logger.info("memberUpdateGET");
		MemberVO member = memberDao.viewMember(id);
				
		model.addAttribute("member", member);
	}
	
	// 회원정보 업데이트 처리 후 화면 전환
	@RequestMapping(value="/memberUpdateProcess", method=RequestMethod.POST)
	public String memberUpdateProcess(MemberVO member, Criteria cri, RedirectAttributes rttr) throws Exception {
		logger.info("memberUpdateProcess..."+member.getId());
		memberDao.updateMember(member);
		
		rttr.addFlashAttribute("result","saveOK");
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("idx", member.getIdx());
		rttr.addAttribute("id", member.getId());
		return "redirect:/admin/memberView";
	}
	
	
	
	// 주문 리스트페이지 링크(orderList)
	@RequestMapping(value="/orderList", method=RequestMethod.GET) 
	public void orderListGET(Criteria cri, Model model) { 
		logger.info("orderListGET...");
		
		List<OrderVO> orderList = orderDao.searchOrderList(cri);
		//PageMaker 객체 생성 
		PageMaker pageMaker = new PageMaker(cri); 
		//전체 게시물 수를 구함 
		int totalCount = orderDao.getTotalCount(cri); 
		//pageMaker로 전달 -> pageMaker는 startPage, endPage, prev, next를 계산함 
		pageMaker.setTotalCount(totalCount); //모델에 추가
		model.addAttribute("pageMaker", pageMaker);
		
		List<Object> detailList = new ArrayList<Object>();
		for(OrderVO order: orderList) {
			detailList.add(orderDetailDao.orderDetailListByOrder(order.getIdx()));
		}
		model.addAttribute("orderList", orderList);
		model.addAttribute("detailList", detailList);
	}
	
	
	// 주문리스트에서 엑셀 다운로드
	@RequestMapping(value="/ExcelDown", method=RequestMethod.POST)
	public void Excel(@RequestParam("fileName") String fileName, Criteria cri, HttpServletResponse response, Model model) throws IOException {
/*		HSSFWorkbook objWorkBook = new HSSFWorkbook();
		HSSFSheet objSheet = null;
		HSSFRow objRow = null;
		HSSFCell objCell = null;
		
		// 제목 폰트
		HSSFFont font = objWorkBook.createFont();
		font.setFontHeightInPoints((short) 9);
		font.setFontName("맑은고딕");
		
		//제목 스타일에 폰트 
		HSSFCellStyle styleHd = objWorkBook.createCellStyle();
*/
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		DecimalFormat df = new DecimalFormat("###,###");
		XSSFWorkbook objWorkBook = new XSSFWorkbook();
		XSSFSheet objSheet = null;
		XSSFRow objRow = null;
		XSSFCell objCell = null;
		
		// 제목 폰트
		XSSFFont font = objWorkBook.createFont();
		font.setFontHeightInPoints((short) 9);
		font.setFontName("맑은고딕");
		
		
		//제목 스타일에 폰트 
		XSSFCellStyle styleHdT = objWorkBook.createCellStyle();	
		styleHdT.setFont(font);
		styleHdT.setAlignment(HorizontalAlignment.CENTER);
		styleHdT.setVerticalAlignment(VerticalAlignment.CENTER);
		styleHdT.setBorderTop(BorderStyle.THIN);
		styleHdT.setBorderRight(BorderStyle.THIN);
		styleHdT.setBorderBottom(BorderStyle.THIN);
		styleHdT.setBorderLeft(BorderStyle.THIN);
		
		XSSFCellStyle styleHd = objWorkBook.createCellStyle();	
		styleHd.setFont(font);
		styleHd.setAlignment(HorizontalAlignment.CENTER);
		styleHd.setVerticalAlignment(VerticalAlignment.CENTER);
		styleHd.setBorderTop(BorderStyle.THIN);
		styleHd.setBorderRight(BorderStyle.THIN);
		styleHd.setBorderBottom(BorderStyle.THIN);
		styleHd.setBorderLeft(BorderStyle.THIN);
		
		XSSFCellStyle styleHd_right = objWorkBook.createCellStyle();	
		styleHd_right.setFont(font);
		styleHd_right.setAlignment(HorizontalAlignment.RIGHT);
		styleHd_right.setVerticalAlignment(VerticalAlignment.CENTER);
		styleHd_right.setBorderTop(BorderStyle.THIN);
		styleHd_right.setBorderRight(BorderStyle.THIN);
		styleHd_right.setBorderBottom(BorderStyle.THIN);
		styleHd_right.setBorderLeft(BorderStyle.THIN);
		
		objSheet = objWorkBook.createSheet("firstSheet");
		
		objRow = objSheet.createRow(0);
		objRow.setHeight((short) 0x300);		
		
		objCell = objRow.createCell(0);
		objCell.setCellValue("주문번호");
		objCell.setCellStyle(styleHd);
		
		objCell = objRow.createCell(1);
		objCell.setCellValue("주문자명");
		objCell.setCellStyle(styleHd);
		objCell = objRow.createCell(2);
		objCell.setCellValue("주문자아이디");
		objCell.setCellStyle(styleHd);
		objCell = objRow.createCell(3);
		objCell.setCellValue("주문상태");
		objCell.setCellStyle(styleHd);
		objCell = objRow.createCell(4);
		objCell.setCellValue("상품명");
		objCell.setCellStyle(styleHd);
		objCell = objRow.createCell(5);
		objCell.setCellValue("가격");
		objCell.setCellStyle(styleHd);
		objCell = objRow.createCell(6);
		objCell.setCellValue("수량");
		objCell.setCellStyle(styleHd);
		objCell = objRow.createCell(7);
		objCell.setCellValue("결제금액");
		objCell.setCellStyle(styleHd_right);
		objCell = objRow.createCell(8);
		objCell.setCellValue("주문일자");
		objCell.setCellStyle(styleHd);
		
		List<OrderVO> orderExcel = orderDao.searchOrderListToExcel(cri);
		int index = 1;
		
		for(OrderVO vo: orderExcel) {
			objRow = objSheet.createRow(index);
			objRow.setHeight((short) 0x200);
			
			objCell = objRow.createCell(0);
			objCell.setCellValue(vo.getOrder_idx());
			objCell.setCellStyle(styleHd);
			objCell = objRow.createCell(1);
			objCell.setCellValue(vo.getUser_name());
			objCell.setCellStyle(styleHd);
			objCell = objRow.createCell(2);
			objCell.setCellValue(vo.getUser_id());
			objCell.setCellStyle(styleHd);			
			objCell = objRow.createCell(3);
			String out = (vo.getStatus()== 0) ? "입금전": "입금완료";
			objCell.setCellValue(out);
			objCell.setCellStyle(styleHd);
			objCell = objRow.createCell(4);
			objCell.setCellValue(vo.getProduct_name());
			objCell.setCellStyle(styleHd);
			
			objCell = objRow.createCell(5);
			objCell.setCellValue(df.format(vo.getPrice()));
			objCell.setCellStyle(styleHd_right);
			
			objCell = objRow.createCell(6);
			objCell.setCellValue(vo.getCount());
			objCell.setCellStyle(styleHd);			
			objCell = objRow.createCell(7);
			objCell.setCellValue(df.format(vo.getPrice()*vo.getCount()));
			objCell.setCellStyle(styleHd_right);			
			objCell = objRow.createCell(8);
			objCell.setCellValue(sdf.format(vo.getOrder_date()));
			objCell.setCellStyle(styleHd);			
			
			index++;
		}
		for(int i=0; i<9; i++) {
			objSheet.autoSizeColumn(i);
		}
//			objSheet.addMergedRegion(new CellRangeAddress(4, 6, 3, 3));
//			objSheet.addMergedRegion(new CellRangeAddress(row.getRowNum(), row.getRowNum(), nStart, nEnd)));

		response.setContentType("Application/Msexcel");
//			response.setHeader("Content-Disposition", "ATTachment; Filename="+URLEncoder.encode(fileName,"UTF-8")+".xls");
		response.setHeader("Content-Disposition", "ATTachment; Filename="+URLEncoder.encode("ExcelSheet","UTF-8")+".xlsx");
		
		OutputStream fileOut = response.getOutputStream();
		objWorkBook.write(fileOut);
		fileOut.close();
		
		response.getOutputStream().flush();
		response.getOutputStream().close();	
		
	}
	
	@RequestMapping(value="/deleteFaq", method=RequestMethod.POST)
	public void deleteFaq(@RequestParam("idx") int idx, Model model, HttpServletResponse response) throws Exception {
		// model.addAttribute("faq", noticeDao.faq(idx));
		noticeDao.deleteFaq(idx);
		logger.info("idx="+idx);
		response.setCharacterEncoding("utf-8");
		  
	    response.getWriter().println("success");
  
	    response.getWriter().close();
	}
	
	@RequestMapping(value="/modifyFaq", method=RequestMethod.POST)
	public void modifyFaq(FaqVO faq, Model model, HttpServletResponse response) throws Exception {
		// model.addAttribute("faq", noticeDao.faq(idx));
		noticeDao.updateFaq(faq);
		logger.info("idx="+faq.getIdx());
		response.setCharacterEncoding("utf-8");
		  
	    response.getWriter().println("success");
  
	    response.getWriter().close();
	}
	
	// 로그인 화면
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public void login(Model model) throws Exception {
	}
	
	// 로그아웃
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		//session.invalidate();
		session.removeAttribute("authInfo");
		session.removeAttribute("sessionAdminId");
		session.removeAttribute("sessionAdminName");
		return "redirect:/admin/login";
	}

	// 로그인 처리
	@RequestMapping(value="loginProcess", method=RequestMethod.POST)
	public void loginProcess(@RequestParam("id") String id, @RequestParam("pwd") String pwd, HttpServletResponse response, HttpSession session, Model model) {		
		try {
			AdminVO admin = adminDao.selectAdmin(id, pwd);
			
			if(admin != null) {
				AuthInfo authInfo = authService.authenticate(id, pwd);
				
				session.setAttribute("authInfo", authInfo);
				session.setAttribute("sessionAdminId", admin.getId());
				session.setAttribute("sessionAdminName", admin.getName());
				
				logger.info("success");
				response.setCharacterEncoding("utf-8");				  
			    response.getWriter().print("success");		  
			    response.getWriter().close();
			} else {
				logger.info("fail");
				response.setCharacterEncoding("utf-8");				  
			    response.getWriter().print("fail");
		  
			    response.getWriter().close();
			}
			
		} catch(Exception e){
			e.getMessage();
		}
		
	}
	
	
	
	/*************************************/
	/*				TEST				 */
	/*************************************/
	@RequestMapping(value="/accordian", method=RequestMethod.GET)
	public void accordian(Model model) throws Exception {
		model.addAttribute("faqList", noticeDao.faqList());
	}
	
	@RequestMapping(value="/Excel", method=RequestMethod.GET)
	public void Excel(Model model) throws Exception {
	}
	
	
	
}
