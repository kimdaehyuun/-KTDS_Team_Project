package com.niceShot.project.chat.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.niceShot.project.chat.vo.ChatVO;
import com.niceShot.project.chat.vo.MessageVO;
import com.niceShot.project.product.vo.ProductVO;

public interface ChatDAO {

	public List<MessageVO> getChatMessage(String chat_id) throws DataAccessException;

	public ProductVO getProductInfo(String product_id) throws DataAccessException;

	public int checkChat(Map<String, String> map) throws DataAccessException;

	public int CreateChatRoom(Map<String, String> map) throws DataAccessException;

	public ChatVO LoadChatRoom(Map<String, String> map) throws DataAccessException;

	public int sendMsg(Map<String, String> map) throws DataAccessException;

	public List<Map<String, String>> searchRoom(String user_id) throws DataAccessException;
	
}
