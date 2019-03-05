package my.batis.project.service;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import my.batis.project.dao.AdminDAO;
import my.batis.project.dto.AdminVO;

@Repository
public class AdminServiceImpl implements AdminService {
	@Inject
	AdminDAO dao;
	
	@Override
	public AdminVO adminlogin(AdminVO vo) {
		return dao.selectAdmin(vo.getId(), vo.getPwd());
	}

}
