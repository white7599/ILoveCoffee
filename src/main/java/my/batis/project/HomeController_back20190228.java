package my.batis.project;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;

import my.batis.project.dao.CartDAO;
import my.batis.project.dao.DirectQuestionDAO;
import my.batis.project.dao.MemberDAO;
import my.batis.project.dao.NoticeDAO;
import my.batis.project.dao.OrderDAO;
import my.batis.project.dao.OrderDeliveryDAO;
import my.batis.project.dao.OrderDetailDAO;
import my.batis.project.dao.ProductDAO;
import my.batis.project.dto.CartVO;
import my.batis.project.dto.Criteria;
import my.batis.project.dto.DirectQuestionVO;
import my.batis.project.dto.MemberVO;
import my.batis.project.dto.NoticeVO;
import my.batis.project.dto.OrderDeliveryVO;
import my.batis.project.dto.OrderDetailVO;
import my.batis.project.dto.OrderVO;
import my.batis.project.dto.PageMaker;
import my.batis.project.dto.ProductTypeVO;
import my.batis.project.dto.ProductVO;
import my.batis.project.service.NoticeService;

//@Controller
public class HomeController_back20190228 {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController_back20190228.class);
	
	@Inject
	ProductDAO productDao;
	@Inject
	NoticeDAO noticeDao;
	@Inject
	NoticeService service;
	@Inject
	MemberDAO memberDao;
	@Inject
	CartDAO cartDao;
	@Inject
	DirectQuestionDAO directQuestionDao;
	@Inject
	OrderDAO orderDao;
	@Inject
	OrderDetailDAO orderDetailDao;
	@Inject
	OrderDeliveryDAO orderDeliveryDao;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) {
		logger.info("Welcome home! The client locale is {}.", locale);		
		
		List<ProductTypeVO> productTypeListMain = productDao.menuProductTypeList();
		List<Object> productListMain = new ArrayList<Object>();
		for(ProductTypeVO productType: productTypeListMain) {
			productListMain.add(productDao.menuProductList(productType.getIdx()));
		}

//		session.setAttribute("productTypeListMain", productTypeListMain);
		model.addAttribute("productTypeListMain", productTypeListMain);
		model.addAttribute("productListMain", productListMain);
		
//		List<ProductVO> productList1 = productDao.productListPerType(1);
//		List<ProductVO> productList2 = productDao.productListPerType(2); 
//		List<ProductVO> productList3 = productDao.productListPerType(3); 
//		List<ProductVO> productList4 = productDao.productListPerType(4);
		
		//session.setAttribute("productTypeList", productTypeList);
//		model.addAttribute("productTypeList", productTypeList);
//		model.addAttribute("productList1", productList1);
//		model.addAttribute("productList2", productList2);
//		model.addAttribute("productList3", productList3);
//		model.addAttribute("productList4", productList4);
		
		String userId = (String) session.getAttribute("sessionUserID");	
		int cartCnt = 0;
		if(userId != null) {
			cartCnt = cartDao.cartCnt((String) session.getAttribute("sessionUserID"));	
		} 
		session.setAttribute("cartCnt", cartCnt);
		return "home";
	}
	
	@RequestMapping(value="/index", method = RequestMethod.GET)
	public String goIndex() {
		return "index";
	}
	
	@RequestMapping(value="/about", method = RequestMethod.GET)
	public String goAbout() {
		return "about";
	}
	
	@RequestMapping("/faq")
	public String goFaq(Model model) throws Exception {
		model.addAttribute("faqList", service.faqList());
		return "faq";
	}
	
	// 1:1 질문
	@RequestMapping(value="/ask", method=RequestMethod.GET)
	public String goAsk(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("sessionUserID");	
		if(userId == null) {
			return "redirect:login";
		}
		
		MemberVO member = memberDao.viewMember(userId);
		model.addAttribute("login", member);		
		return "ask";
	}
	
	@RequestMapping(value="/askProcess", method=RequestMethod.POST)
	public void askProcess(DirectQuestionVO vo, HttpServletResponse response) throws IOException {
		try {
			directQuestionDao.insertDirectQuestion(vo);
			response.setCharacterEncoding("utf-8");
			  
		    response.getWriter().println("success");
	  
		    response.getWriter().close();
		} catch(Exception e){
			e.getMessage();
		}
	}	
	
	/*****************************************************/
	/* 						news 						 */
	/*****************************************************/
	@RequestMapping(value="/news", method=RequestMethod.GET) 
	public void news(Criteria cri, Model model) throws Exception {
		logger.info("news");
		//현재 페이지에 해당하는 게시물을 조회해 옴 
		List<NoticeVO> noticeList = service.listPage(cri);
		//모델에 추가
		model.addAttribute("noticeList",noticeList);
		//PageMaker 객체 생성
		PageMaker pageMaker = new PageMaker(cri);
		//전체 게시물 수를 구함
		int totalCount = service.getTotalCount(cri);
		//pageMaker로 전달 -> pageMaker는 startPage, endPage, prev, next를 계산함
		pageMaker.setTotalCount(totalCount);
		//모델에 추가
		model.addAttribute("pageMaker", pageMaker);
	  }
	
	@RequestMapping("/news")
	public String goNews(Criteria cri, Model model) throws Exception {		
		logger.info("listPage");
		//현재 페이지에 해당하는 게시물을 조회해 옴 
		List<NoticeVO> noticeList = service.listPage(cri);
		//모델에 추가
		model.addAttribute("list",noticeList);
		//PageMaker 객체 생성
		PageMaker pageMaker = new PageMaker(cri);
		//전체 게시물 수를 구함
		int totalCount = service.getTotalCount(cri);
		//pageMaker로 전달 -> pageMaker는 startPage, endPage, prev, next를 계산함
		pageMaker.setTotalCount(totalCount);
		//모델에 추가
		model.addAttribute("pageMaker", pageMaker);
		
		return "news";		
	}
	
	@RequestMapping(value="/news_view", method=RequestMethod.GET)
	public void news_view(@RequestParam("idx") Integer idx, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		logger.info("news_view GET..."+idx);
		NoticeVO notice = service.read(idx);
		model.addAttribute("notice", notice);
		NoticeVO prev = service.prevNotice(idx);
		NoticeVO next = service.nextNotice(idx);
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
	}
	
	
	
	/*****************************************************/
	/* 						로그인 						 */
	/*****************************************************/
	@RequestMapping(value="/login", method = RequestMethod.GET) 
	public String loginGet() { 
		return "login"; 
	}
	  
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String loginPOST(MemberVO memberVo, HttpSession session, Model model) {
		logger.info("loginPOST()");
		MemberVO loginMember = memberDao.loginMember(memberVo);
		String returnUrl = "redirect:/";
			  
		if(loginMember != null) {	// 로그인 성공
			session.setAttribute("sessionUserID", memberVo.getId());
			session.setAttribute("sessionUserName", loginMember.getName());
			session.setAttribute("login", loginMember);	// 세션에 객체와 id, name을 모두 저장
			//model.addAttribute("msg", "user");
			  
		} else {		//로그인 실패시
			model.addAttribute("msg", "failure");
			returnUrl = "login";
		}
		  
		return returnUrl;
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		//session.invalidate();
		session.removeAttribute("sessionUserID");
		session.removeAttribute("sessionUserName");
		session.removeAttribute("login");
		return "redirect:/";
	}
	
	
	/*****************************************************/
	/* 				shop & 주문 관련 						 */
	/*****************************************************/	
	@RequestMapping(value="/shop", method=RequestMethod.GET)
	public String goShop(Model model) {
		List<ProductTypeVO> productTypeListMain = productDao.menuProductTypeList();
		List<Object> productListMain = new ArrayList<Object>();
		for(ProductTypeVO productType: productTypeListMain) {
			productListMain.add(productDao.menuProductList(productType.getIdx()));
		}

		//session.setAttribute("productTypeListMain", productTypeListMain);
		model.addAttribute("productTypeListMain", productTypeListMain);
		model.addAttribute("productListMain", productListMain);
		
		
		List<ProductVO> productList1 = productDao.productListPerType(1);
		List<ProductVO> productList2 = productDao.productListPerType(2); 
		List<ProductVO> productList3 = productDao.productListPerType(3); 
		List<ProductVO> productList4 = productDao.productListPerType(4);
		 
		model.addAttribute("productList1", productList1);
		model.addAttribute("productList2", productList2);
		model.addAttribute("productList3", productList3);
		model.addAttribute("productList4", productList4);
		
		return "shop";
	}
	
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public String goDetail(@RequestParam("product_idx") Integer product_idx, Model model) {
		ProductVO productDetail = productDao.viewProduct(product_idx);
		model.addAttribute("productDetail", productDetail);
		return "detail";
	}
	
	// cart insert
	@RequestMapping(value="/detail", method=RequestMethod.POST) 
	public String cartInsert(HttpSession session, CartVO vo) {
		String userId = (String) session.getAttribute("sessionUserID");	
		
		if(userId == null) {
			return "redirect:login";
		}
		
		vo.setUser_id(userId);
		
		//해당 상품이 카트에 있는 지 확인
		int cartCntByProduct = cartDao.cartCntByProduct(vo);
		
		if(cartCntByProduct == 0) {
			cartDao.insertCart(vo);
		} else {
			
			cartDao.updateCart(vo);
		}		
		
		String url = "redirect:basket";
		return url;
	}
	
	@RequestMapping("/basket")
	public String goBasket(HttpSession session, Model model) {		
		String userId = (String) session.getAttribute("sessionUserID");		
		List<CartVO> list = cartDao.cartList(userId);
		int cartCnt = cartDao.cartCnt(userId);
		int sumPriceTotal = cartDao.sumPriceTotal(userId);
		session.setAttribute("cartCnt", cartCnt);
		model.addAttribute("cartList", list);
		model.addAttribute("sumPriceTotal", sumPriceTotal);
		
		return "basket";
	}
	
	@RequestMapping("/order")
	public String goOrder(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("sessionUserID");		
		List<CartVO> list = cartDao.cartList(userId);
		int cartCnt = cartDao.cartCnt(userId);
		int sumPriceTotal = cartDao.sumPriceTotal(userId);
		MemberVO member = memberDao.viewMember(userId);
		session.setAttribute("cartCnt", cartCnt);
		model.addAttribute("cartList", list);
		model.addAttribute("sumPriceTotal", sumPriceTotal);
		model.addAttribute("member", member);
		return "order";
	}
	
	// 주문 완료 후 주문내역 저장 후 주문완료 확인 페이지로 이동
	@RequestMapping(value="/order_complete", method=RequestMethod.POST)
	public String orderComplete(HttpSession session, Model model, OrderVO vo, OrderDeliveryVO orderDeliveryvo) {
		String userId = (String) session.getAttribute("sessionUserID");
		List<CartVO> cartList = cartDao.cartList(userId);
		logger.info("orderComplete="+vo.toString());
		orderDao.insertOrder(vo);
		int order_idx = vo.getIdx();		
		
		List<OrderDetailVO> list = new ArrayList<OrderDetailVO>();
		for(CartVO cart : cartList) {
			OrderDetailVO orderDetailvo = new OrderDetailVO();
			orderDetailvo.setOrder_idx(order_idx);
			orderDetailvo.setProduct_idx(cart.getProduct_idx());
			orderDetailvo.setCount(cart.getCount());
			list.add(orderDetailvo);
		}		
		logger.info("orderComplete"+order_idx);
		orderDeliveryvo.setOrder_idx(order_idx);
		orderDeliveryDao.insertOrderDelivery(orderDeliveryvo);
		orderDao.insertOrderDetail(list);
		
		int sumPriceTotal = cartDao.sumPriceTotal(userId);
		model.addAttribute("sumPriceTotal", sumPriceTotal);
		cartDao.deleteAllCart(userId);	// 주문 후 카트의 내용은 삭제
	
		return "order_complete";
	}
	
	// 주문/배송 조회
	@RequestMapping(value="/myorderlist", method=RequestMethod.GET)
	public String myorderlistGET(HttpSession session, Model model) {
		logger.info("myorderlistGET----------");
		String userId = (String) session.getAttribute("sessionUserID");	
		
		if(userId == null) {
//			model.addAttribute("msg", "로그인이 필요한 페이지입니다.");
			return "redirect:login";
		}
		
		Date today = new Date(System.currentTimeMillis());		
		String to_date = today.toString();
		Calendar cal = new GregorianCalendar(Locale.KOREA);
		cal.add(Calendar.MONTH, -1); // 한달을 더한다
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
	    String from_date = fm.format(cal.getTime());	    
		
		List<OrderVO> list = orderDao.orderList(userId, from_date, to_date);	
		
		List<Object> detailList = new ArrayList<Object>();
		for(OrderVO order: list) {
			detailList.add(orderDetailDao.orderDetailListByOrder(order.getIdx()));
		}
		model.addAttribute("orderList", list);
		model.addAttribute("detailList", detailList);
		return "myorderlist";
	}	
	
	@RequestMapping(value="/myorderlist", method=RequestMethod.POST)
	public String myorderlistPOST(HttpServletResponse response, HttpSession session, Model model, 
								@RequestParam("searchStartDate") String from_date, @RequestParam("searchEndDate") String to_date, @RequestParam("checkedDate") String checkedDate ) {
		String userId = (String) session.getAttribute("sessionUserID");	
		
		if(userId == null) {
			return "redirect:login";
		}
		logger.info("myorderlistPOST----------");
		logger.info("from_date="+from_date);
		logger.info("to_date="+to_date);
		
		List<OrderVO> list = orderDao.orderList(userId, from_date, to_date);
		
		List<Object> detailList = new ArrayList<Object>();
		for(OrderVO order: list) {
			detailList.add(orderDetailDao.orderDetailListByOrder(order.getIdx()));
		}
		model.addAttribute("orderList", list);
		model.addAttribute("detailList", detailList);
		model.addAttribute("searchStartDate", from_date);
		model.addAttribute("searchEndDate", to_date);
		model.addAttribute("checkedDate", checkedDate);
		logger.info("checkedDate="+checkedDate);
		
		return "myorderlist";
	}	
	
	@RequestMapping(value="/dropCheckedProduct", method=RequestMethod.POST)
	public void dropCheckedProduct(@RequestParam(value="checkedArr[]") List<Integer> arrParam, HttpServletResponse response) throws IOException {
		logger.info("arrParam="+arrParam.toString());
		
		int delCnt = 0;
		for(Integer cartIdx: arrParam) {
			try {
				delCnt = cartDao.deleteCart(cartIdx);
				
			} catch(Exception e) {
				e.getMessage();
			}
		}
		logger.info("delCnt="+delCnt);
		
		if(delCnt > 0) {
			response.setCharacterEncoding("utf-8");
			response.getWriter().println("삭제되었습니다.");
			response.getWriter().close();
		}		
	}
	
	@RequestMapping(value="/updateCountProduct", method=RequestMethod.POST)
	public void updateCountProduct(@RequestParam("count") int count, @RequestParam("idx") int idx, HttpServletResponse response) throws IOException {
		logger.info("count="+count+", idx="+idx);
			
		int updateCnt = cartDao.updateCartProductCount(idx, count);
		
		if(updateCnt > 0) {
			response.setCharacterEncoding("utf-8");
			response.getWriter().println("수정되었습니다.");
			response.getWriter().close();
		}	
		logger.info("updateCnt="+updateCnt);
		
	}
	
	@RequestMapping(value="/emptyBasket", method=RequestMethod.POST)
	public String emptyBasket(HttpSession session) {
		String userId = (String) session.getAttribute("sessionUserID");	
		cartDao.deleteAllCart(userId);
		
		String url = "redirect:basket";
		return url;
	}
	
	/*****************************************************/
	/* 				   	회원 등록 관련 						 */
	/*****************************************************/
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String goJoinGET(Model model) {
		return "join";
	}
	
	@RequestMapping(value="/joinProcess", method=RequestMethod.POST)
	public String goJoinPost(MemberVO member, Model model) {
		memberDao.insertMember(member);
		return "redirect:login";
	}
	
	@RequestMapping("/checkID")	//아이디를 조회해서 아이디있으면 사용불가 없으면 사용가능
	public void checkID(MemberVO vo, HttpServletResponse response) throws IOException {
		logger.info("id="+vo.getId());
		ObjectMapper mapper = new ObjectMapper();		
		MemberVO member = memberDao.idCheck(vo.getId());
		
		try {
			response.getWriter().print(mapper.writeValueAsString(member));
		} catch(IOException e) {
			e.printStackTrace();
		}		 
	}	
	
	
	
	/*****************************************************/
	/* 			    		 테스트 관련  					 */
	/*****************************************************/
	@RequestMapping("/mypage")
	public String mypage(HttpSession session, Model model) {	
		String userId = (String) session.getAttribute("sessionUserID");	
		
		if(userId == null) {
			return "redirect:login";
		}
		
		// 회원정보
		MemberVO member = memberDao.viewMember(userId);
		
		model.addAttribute("memberEdit", member);
		
		// 1:1 문의
		List<DirectQuestionVO> list = directQuestionDao.myDirectQuestionList(userId);
		model.addAttribute("myDirectQuestionList", list);
		return "mypage";
	}
	
	@RequestMapping("/editProcess")
	public String editProcess(MemberVO member, Model model) {
		
		memberDao.updateMember(member);
		return "redirect:mypage";
	}
	
	@RequestMapping("/summernote")
	public void summernote() {		
	}
	
	@RequestMapping(value="/summernote", method=RequestMethod.POST)
	public void summernotePOST(NoticeVO notice, Model model) {	
		noticeDao.insertNotice(notice);	
	}
	
	// 파일 업로드처리	
	@RequestMapping(value="/image", method=RequestMethod.POST)
	private void saveFile(@RequestParam("file") MultipartFile file, HttpServletResponse response) throws IOException {
		String UPLOAD_PATH = "D:\\DEVELOPE\\workspaceSpringMVCNew\\mybatis\\src\\main\\webapp\\resources\\uploadImg";	
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
	
}
