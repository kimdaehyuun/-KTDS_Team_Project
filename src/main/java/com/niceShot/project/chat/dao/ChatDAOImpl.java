package com.niceShot.project.chat.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.niceShot.project.chat.vo.ChatVO;
import com.niceShot.project.chat.vo.MessageVO;
import com.niceShot.project.product.vo.ProductVO;

@Repository("chatDAO")
public class ChatDAOImpl implements ChatDAO{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<MessageVO> getChatMessage(String chat_id) throws DataAccessException {
		return sqlSession.selectList("mapper.chat.getChatMessage", chat_id);
	}

	@Override
	public ProductVO getProductInfo(String product_id) throws DataAccessException {
		return sqlSession.selectOne("mapper.chat.getProductInfo", product_id);
	}

	@Override
	public int checkChat(Map<String, String> map) throws DataAccessException {
		return sqlSession.selectOne("mapper.chat.checkChatRoom", map);
	}

	@Override
	public int CreateChatRoom(Map<String, String> map) throws DataAccessException {
		return sqlSession.insert("mapper.chat.createNewChatRoom", map);
	}

	@Override
	public ChatVO LoadChatRoom(Map<String, String> map) throws DataAccessException {
		return sqlSession.selectOne("mapper.chat.loadChatRoom", map);
	}

	@Override
	public int sendMsg(Map<String, String> map) throws DataAccessException {
		return sqlSession.insert("mapper.chat.insertMsg", map);
	}

	@Override
	public List<Map<String, String>> searchRoom(String user_id) throws DataAccessException {
		return sqlSession.selectList("mapper.chat.searchRoom", user_id);
	}
	
}
