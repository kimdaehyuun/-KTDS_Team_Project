package com.niceShot.project.chat.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.niceShot.project.chat.dao.ChatDAO;
import com.niceShot.project.chat.vo.ChatVO;
import com.niceShot.project.chat.vo.MessageVO;
import com.niceShot.project.product.vo.ProductVO;

@Service("chatService")
@Transactional(propagation = Propagation.REQUIRED)
public class ChatServiceImpl implements ChatService{
	@Autowired
	private ChatDAO chatDAO;
	
	public List<MessageVO> getChatMessage (String chat_id) throws DataAccessException{
		return chatDAO.getChatMessage(chat_id);
	}
	
	public ProductVO getProductInfo(String product_id) throws DataAccessException{
		return chatDAO.getProductInfo(product_id);
	}
	
	public int checkChat(Map<String, String> map) throws DataAccessException{
		return chatDAO.checkChat(map);
	}

	public int CreateChatRoom(Map<String, String> map) throws DataAccessException {
		return chatDAO.CreateChatRoom(map);
	}

	@Override
	public ChatVO LoadChatRoom(Map<String, String> map) throws DataAccessException {
		return chatDAO.LoadChatRoom(map);
	}

	@Override
	public int sendMsg(Map<String, String> map) throws DataAccessException {
		return chatDAO.sendMsg(map);
		
	}

	@Override
	public List<Map<String, String>> searchRoom(String user_id) throws DataAccessException {
		return chatDAO.searchRoom(user_id);
	}

}
