package my.batis.project.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import my.batis.project.dao.AdminDAO;
import my.batis.project.dto.AdminVO;
import my.batis.project.dto.AuthInfo;

@Service
public class AuthService {
	@Inject
	AdminDAO adminDao;
	
	public AuthInfo authenticate(String id, String pwd) throws Exception {
		
		AdminVO admin = adminDao.selectAdmin(id, pwd);
		
		return new AuthInfo(admin.getId(), admin.getPwd(), admin.getName());
		
	}
}
