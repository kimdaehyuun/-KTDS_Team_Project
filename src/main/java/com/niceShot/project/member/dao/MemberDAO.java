package com.niceShot.project.member.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.niceShot.project.member.vo.BusinessVO;
import com.niceShot.project.member.vo.MemberVO;
import com.niceShot.project.member.vo.RankVO;

public interface MemberDAO {
	
	/* Data Access Object 데이터 객체 연결 */
	/* DB 연결 시 전달해야 될 데이터 혹은 SQL 연결할 매개변수 준비 */
	
	public MemberVO loginById(MemberVO memberVO) throws DataAccessException;
	public BusinessVO selectMyBussinessInfo(String user_id) throws DataAccessException;
	public RankVO selectRank(String user_rank_id) throws DataAccessException;
	public int idCheck(String user_account) throws DataAccessException ;
	public int register(MemberVO memberVO) throws DataAccessException;
	public int insertBusinessInfo(BusinessVO businessVO) throws DataAccessException;
	public int bizNumChk(String biz_num) throws DataAccessException;
	public int update_customer_user_biz_id(String user_id) throws DataAccessException;
	public List<Map<String, String>> selectUserInfoMap (String user_id) throws DataAccessException;
	public List<Map<String, String>> selectUserWish (String user_id) throws DataAccessException;
	public List<Map<String, String>> selectCheckSale (String user_id) throws DataAccessException;
	public MemberVO selectOtherUser(String user_name) throws DataAccessException;
	public int updateState(Map<String, Object> map) throws DataAccessException;

}
