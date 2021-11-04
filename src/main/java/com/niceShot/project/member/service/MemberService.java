package com.niceShot.project.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.niceShot.project.member.vo.BusinessVO;
import com.niceShot.project.member.vo.MemberVO;
import com.niceShot.project.member.vo.RankVO;

public interface MemberService {
	
	/* ***Controller에서 받은 데이터를 서비스로 보내기 */

	 public MemberVO login(MemberVO memberVO) throws DataAccessException;
	 public BusinessVO getBusinessInfo(String user_id) throws DataAccessException;
	 public RankVO memberRank(String user_rank_id) throws DataAccessException;
	 public int idCheck(String user_account) throws DataAccessException;
	 public int register(MemberVO member) throws DataAccessException;
	 public int bizRegist(BusinessVO businessVO) throws DataAccessException;
	 public int bizNumChk(String biz_num) throws DataAccessException;
	 public int addBizId(String user_id) throws DataAccessException;
	 public List<Map<String, String>> selectUserInfoMap(String user_id) throws DataAccessException;
	 public List<Map<String, String>> selectUserWish(String user_id) throws DataAccessException; 
	 public List<Map<String, String>> selectCheckSale(String user_id) throws DataAccessException;
	 public MemberVO selectOtherUser(String user_name) throws DataAccessException;
	 public int updateState(Map<String, Object> map) throws DataAccessException;
}