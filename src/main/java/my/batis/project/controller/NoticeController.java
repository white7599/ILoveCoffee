package my.batis.project.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import my.batis.project.dto.Criteria;
import my.batis.project.dto.NoticeVO;
import my.batis.project.dto.PageMaker;
import my.batis.project.service.NoticeService;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class); 
	
	@Inject
	private NoticeService service;
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public void registerGET(NoticeVO notice, @ModelAttribute("cri") Criteria cri, Model model) {
		logger.info("register get...");
		
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String registerPOST(NoticeVO notice, Criteria cri, RedirectAttributes rttr) throws Exception {
		logger.info("register post...");
		logger.info(notice.toString());
		
		service.regist(notice);
		rttr.addFlashAttribute("result", "registerOK");
		rttr.addAttribute("page", 1);
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		
//		return "/notice/success";
		return "redirect:/notice/listPage";
	}
	
	@RequestMapping(value="/noticeList", method=RequestMethod.GET)
	public void noticeList(Model model) throws Exception {
		logger.info("show list");
		List<NoticeVO> noticeList = service.listAll();
		model.addAttribute("list", noticeList);
	}
	
	 @RequestMapping(value="/listPage", method=RequestMethod.GET) 
	  public void listPage(Criteria cri, Model model) throws Exception {
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
	  }
	
	@RequestMapping(value="/read", method=RequestMethod.GET)
	public void read(@RequestParam("idx") Integer idx, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		logger.info("read GET...");
		NoticeVO notice = service.read(idx);
		model.addAttribute(notice);
	}
	
	@RequestMapping(value="/remove", method=RequestMethod.GET)
	public String remove(@RequestParam("idx") Integer idx, Criteria cri, RedirectAttributes rttr) throws Exception {
		logger.info("remove");
		service.remove(idx);
		rttr.addFlashAttribute("result", "removeOK");
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/notice/listPage";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public void updateGET(@RequestParam("idx") Integer idx, 
							@ModelAttribute("cri") Criteria cri,
							Model model) throws Exception {
		logger.info("update GET");
		NoticeVO notice = service.read(idx);
		model.addAttribute(notice);
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String updatePOST(NoticeVO notice, Criteria cri, RedirectAttributes rttr) throws Exception {
		logger.info("update POSt");
		service.modify(notice);
		rttr.addFlashAttribute("result","saveOK");
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("idx", notice.getIdx());
		return "redirect:/notice/read";
	}
	
	
	 
	 
	
	
	
	
	
	@RequestMapping(value="/dummy")
	public String dummyPOST(RedirectAttributes rttr) throws Exception {
		logger.info("dummy post.....");
		
		service.dummy();
			
		rttr.addFlashAttribute("result", "registerOK");
		return "redirect:/notice/noticeList";
	}
}
