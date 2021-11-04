package com.niceShot.project.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.niceShot.project.member.dao.MemberDAO;
import com.niceShot.project.member.vo.BusinessVO;
import com.niceShot.project.member.vo.MemberVO;
import com.niceShot.project.member.vo.RankVO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {
	@Autowired
	private SqlSession sqlSession;
	
	/* MemberDAO에서 정의 해놓은 상세 기능 설정 후 ***mapper에 연결 */
	
	@Override
	public MemberVO loginById(MemberVO memberVO) throws DataAccessException{
		  MemberVO vo = sqlSession.selectOne("mapper.member.loginById",memberVO);
		return vo;
	}
	
	@Override
	public BusinessVO selectMyBussinessInfo(String user_id) throws DataAccessException {
		BusinessVO vo = sqlSession.selectOne("mapper.member.selectMyBusinessInfo", user_id);
		return vo;
	}
	
	@Override
	public RankVO selectRank(String user_rank_id) throws DataAccessException{
		return sqlSession.selectOne("mapper.member.selectRank", user_rank_id);
	}
	
	@Override
	public int idCheck(String user_account) throws DataAccessException {
		int result = sqlSession.selectOne("mapper.member.idCheck", user_account);
		return result;
	}
	
	@Override
	public int register(MemberVO memberVO) throws DataAccessException {
		int result = sqlSession.insert("mapper.member.register", memberVO);
		return result;
	}
	
	@Override
	public int insertBusinessInfo(BusinessVO businessVO) throws DataAccessException {
		int result = sqlSession.insert("mapper.member.insertBusiness", businessVO);
		return result;
	}
	
	@Override
	public int bizNumChk(String biz_num) throws DataAccessException {
		int result = sqlSession.selectOne("mapper.member.bizNumChk", biz_num);
		return result;
	}
	
	@Override
	public int update_customer_user_biz_id(String user_id) throws DataAccessException {
		System.out.println("DAO에서 호출 중 : " + user_id);
		sqlSession.selectOne("mapper.member.update_customer_user_biz_id", user_id);
		int result = 1;
		System.out.println("DAO에서 리턴 중 : " + user_id);
		return result;
	}
	
	@Override
	public List<Map<String, String>> selectUserInfoMap (String user_id) throws DataAccessException {
		
		return sqlSession.selectList("mapper.member.selectUserInfoMap", user_id);
	}
	
	@Override
	public List<Map<String, String>> selectUserWish	(String user_id) throws DataAccessException {
		return sqlSession.selectList("mapper.member.selectUserWish", user_id);
	}
	
	@Override
	public List<Map<String, String>> selectCheckSale (String user_id) throws DataAccessException {
		return sqlSession.selectList("mapper.member.selectCheckSale", user_id);
	}
	
	@Override
	public MemberVO selectOtherUser(String user_name) throws DataAccessException {
		System.out.println(user_name);
		return sqlSession.selectOne("mapper.member.selectUserByName", user_name);
	}
	
	@Override
	public int updateState(Map<String, Object> map) throws DataAccessException {
		int result = sqlSession.update("mapper.member.updateState", map);
		return result;
	}

}
