package my.batis.project.dao;

import my.batis.project.dto.AdminVO;

public interface AdminDAO {
	public AdminVO selectAdmin(String id, String pwd);
}
