package my.batis.project.dao;

import java.util.List;

import my.batis.project.dto.Criteria;
import my.batis.project.dto.MemberVO;

public interface MemberDAO {
	public void insertMember(MemberVO vo);
	public MemberVO viewMember(String id);
	public void updateMember(MemberVO vo);
	public void deleteMember(String id);
	public List<MemberVO> memberList(Criteria cri);
	public int getTotalCount(Criteria cri);
	
	public MemberVO loginMember(MemberVO vo);
	public MemberVO idCheck(String id);
}
