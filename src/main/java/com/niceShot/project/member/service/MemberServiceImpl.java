package com.niceShot.project.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.niceShot.project.member.dao.MemberDAO;
import com.niceShot.project.member.vo.BusinessVO;
import com.niceShot.project.member.vo.MemberVO;
import com.niceShot.project.member.vo.RankVO;

@Service("memberService")
@Transactional(propagation = Propagation.REQUIRED)
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;

	/* 서비스 상세 설정 후 ***DAO로 연결 */
	
	@Override
	public MemberVO login(MemberVO memberVO) throws DataAccessException{
		return memberDAO.loginById(memberVO);
	}
	
	@Override
	public BusinessVO getBusinessInfo(String user_id) throws DataAccessException{
		return memberDAO.selectMyBussinessInfo(user_id);
	}
	
	@Override
	public RankVO memberRank(String user_rank_id) throws DataAccessException{
		return memberDAO.selectRank(user_rank_id);
	}
	
	@Override
	public int idCheck(String user_account) throws DataAccessException {
		int result = memberDAO.idCheck(user_account);
		return result;
	}
	
	@Override
	public int register(MemberVO memberVO) throws DataAccessException {
		return memberDAO.register(memberVO);
	}
	
	@Override
	public int bizRegist(BusinessVO businessVO) throws DataAccessException {
		return memberDAO.insertBusinessInfo(businessVO);
	}
	
	@Override
	public int bizNumChk(String biz_num) throws DataAccessException {
		return memberDAO.bizNumChk(biz_num);
	}
	
	@Override
	public int addBizId(String user_id) throws DataAccessException {
		System.out.println("Service에서 호출 중 : " + user_id);
		int result = memberDAO.update_customer_user_biz_id(user_id);
		System.out.println("Service에서 리턴 받는 중 : " + result);
		return result;
	}
	
	@Override
	public List<Map<String, String>> selectUserInfoMap(String user_id) throws DataAccessException {
		return memberDAO.selectUserInfoMap(user_id);
	}
	
	@Override
	public List<Map<String, String>> selectUserWish(String user_id) throws DataAccessException {
		return memberDAO.selectUserWish(user_id);
	}
	
	@Override
	public List<Map<String, String>> selectCheckSale(String user_id) throws DataAccessException {
		return memberDAO.selectCheckSale(user_id);
	}
	
	@Override
	public MemberVO selectOtherUser(String user_name) throws DataAccessException{
		return memberDAO.selectOtherUser(user_name);
	}
	
	@Override
	public int updateState(Map<String, Object> map) throws DataAccessException {
		return memberDAO.updateState(map);
	}
	

}
