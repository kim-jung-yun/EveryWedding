package com.spring.mapper;

import java.util.List;

import com.spring.dto.CartDTO;
import com.spring.dto.CommunityDTO;
import com.spring.dto.DetailSearchDTO;
import com.spring.dto.EnterpriseDTO;
import com.spring.dto.EstimationDTO;
import com.spring.dto.LoginDTO;
import com.spring.dto.RequestDTO;
import com.spring.dto.UserDTO;
import com.spring.dto.WeddingInfoDTO;

public interface WeddingMapper {
	public List<EnterpriseDTO> selectEntListAll();
	public EnterpriseDTO returnEntInfo(String ent_id);
	public int returnEntImgCount(String ent_id);
	public List<EnterpriseDTO> returnEntSearchResult(DetailSearchDTO detailDto);
	public List<EnterpriseDTO> returnTotalSearchResult(String search_word);
	public void insertUserInfo(UserDTO dto);
	public int idCheck(String id);
	public int userLoginCheck(LoginDTO loginDTO);
	public int entLoginCheck(LoginDTO loginDTO);
	public String getUserName(LoginDTO loginDTO);
	public String getEntName(LoginDTO loginDTO);
	public void insertLoginInfo(LoginDTO loginDTO);
	public LoginDTO selectLoginInfo();
	public void deleteLoginInfo();
	public void insertWeddingInfo(WeddingInfoDTO weddingInfoDto);
	public int weddingInfoCheck(String user_id);
	public WeddingInfoDTO selectWeddingInfo(String user_id);
	public void updateWeddingInfo(WeddingInfoDTO weddingInfoDto);
	public void insertEstimation(EstimationDTO estimationDto);
	public int selectDateDiff(WeddingInfoDTO weddingInfoDto);
	public void insertCart4User(String user_id);
	public int cart4UserCheck(String user_id);
	public void insertEntCart(CartDTO cartDto);
	public int entCartCheck(CartDTO cartDto);
	public List<EnterpriseDTO> selectEntCartList(String cart_id);
	public EstimationDTO selectEstimation(String user_id);
	public String returnEntCodeId(String ent_id);
	public List<CommunityDTO> returnCommunityAll();
	public void certificationUser(String user_id);
	public void insertRequest(RequestDTO requestDto);
	public int returnCertification(String user_id);
}
