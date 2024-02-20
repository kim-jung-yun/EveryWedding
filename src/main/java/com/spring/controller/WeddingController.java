package com.spring.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Random;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.spring.dto.CartDTO;
import com.spring.dto.CertificationDTO;
import com.spring.dto.CheckList;
import com.spring.dto.CommunityDTO;
import com.spring.dto.DetailSearchDTO;
import com.spring.dto.EnterpriseDTO;
import com.spring.dto.EstimationDTO;
import com.spring.dto.LoginDTO;
import com.spring.dto.UserDTO;
import com.spring.dto.WeddingInfoDTO;
import com.spring.mapper.WeddingMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Slf4j
@Controller
@RequestMapping(value = "/EveryWedding")
@RequiredArgsConstructor
public class WeddingController {
	
    @Value("${coolsms.api.key}")
    private String apiKey;
    
    @Value("${coolsms.api.secret}")
    private String apiSecretKey;
    
	
    private DefaultMessageService messageService;

    @PostConstruct
    private void initialize() {
        // 반드시 계정 내 등록된 유효한 API 키, API Secret Key를 입력해주셔야 합니다!
        System.out.println("apiKey: " + apiKey); // apiKey 값 출력
        this.messageService = NurigoApp.INSTANCE.initialize("NCSNMDLVPF3JY91A", "HARA3M43PXSAJ9PXFDQPB5WNS5BYDWOA", "https://api.coolsms.co.kr");
    }
    
	private final WeddingMapper mapper;

	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Model model) {
		log.info("Every-Wedding");
		return "home";
	}
	
	@ResponseBody
	@RequestMapping(value = "/login_status", method = RequestMethod.POST)
	public ResponseEntity<String> login_status(Model model) {
		 log.info("login_status");
		    LoginDTO loginDto = new LoginDTO();
		    loginDto = mapper.selectLoginInfo();
		    boolean loginNow;
		    
		    if (loginDto == null) {
		        log.info("로그아웃 상태");
		        loginNow = false;
		    } else {
		        log.info("로그인 상태");
		        loginNow = true;
		    }
		    
		    model.addAttribute("loginNow", loginNow);
		    log.info("login_status");
		    
		    // json타입으로 형변환
		    Gson gson = new Gson();
		    String json = gson.toJson(model.asMap());
		    
		    HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", "application/json;charset=UTF-8");
		    
		    return new ResponseEntity<String>( json, header, HttpStatus.OK );
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/login_info", method = RequestMethod.POST)
	public ResponseEntity<LoginDTO> login_info(Model model) {
		 log.info("login_info");
		    LoginDTO loginDto = new LoginDTO();
		    loginDto = mapper.selectLoginInfo();
		    
		    log.info("login_info");

		    HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", "application/json;charset=UTF-8");
		    
		    
		    return new ResponseEntity<LoginDTO>( loginDto, header, HttpStatus.OK );
	}
	

	
	
	@RequestMapping(value = "/logout", method = RequestMethod.POST)
	public String logout(Model model) {
		log.info("logout");
		mapper.deleteLoginInfo();
		return "home";
	}
	
	@RequestMapping(value = "/reservation", method = RequestMethod.GET)
	public String reservation( Model model) {
		log.info("reservation");
		List<EnterpriseDTO> entList = new ArrayList<>();
		entList = mapper.selectEntListAll();
		model.addAttribute("entList", entList);
		return "reservation";
	}
	
	@RequestMapping(value = "/total_search", method = RequestMethod.POST)
	public String detail_search( Model model,  String search_word) {
		log.info("total_search  search_word - " + search_word);		
		List<EnterpriseDTO> entList = new ArrayList<>();
		entList = mapper.returnTotalSearchResult("%"+search_word+"%");
		model.addAttribute("entList", entList);
		return "reservation";
	}
	
	
	@RequestMapping(value = "/detail_search", method = RequestMethod.POST)
	public String detail_search( Model model,  DetailSearchDTO detailDto) { //@RequestBody
		log.info("detail_search detailDto - " + detailDto);		
		List<EnterpriseDTO> entList = new ArrayList<>();
		entList = mapper.returnEntSearchResult(detailDto);		
		model.addAttribute("entList", entList);
		return "reservation";
	}
	
	
	@RequestMapping(value = "/estimation", method = RequestMethod.GET)
	public String estimation( Model model, WeddingInfoDTO weddingInfoDto) {
		log.info("estimation");
	    String returnValue="";
	    LoginDTO loginDto = new LoginDTO();
	    loginDto = mapper.selectLoginInfo();
		if(loginDto ==null) {
			returnValue = "home";
		} else {
		    if(mapper.weddingInfoCheck(loginDto.getUser_id())>0) {
		    	weddingInfoDto = mapper.selectWeddingInfo(loginDto.getUser_id());
				log.info("wedding info : "+weddingInfoDto);
				model.addAttribute("weddingInfoDto", weddingInfoDto);

		    } 
		    
		    loginDto = mapper.selectLoginInfo();
		    returnValue="estimation";
			
		}

		return returnValue;

	}
	
	@RequestMapping(value = "/estimation_result", method = RequestMethod.POST)
	public String estimation_result( Model model, WeddingInfoDTO weddingInfoDto, CheckList checkList) {
		log.info("estimation_result"+weddingInfoDto);
	    LoginDTO loginDto = new LoginDTO();
	    loginDto = mapper.selectLoginInfo();
	    weddingInfoDto.setUser_id(loginDto.getUser_id());
	    EstimationDTO estimationDto = new EstimationDTO();
	    int d_day=0;
	    log.info("Wedding Information :" + weddingInfoDto);

	    //웨딩인포를 입력한 적이 있다면
	    if(mapper.weddingInfoCheck(loginDto.getUser_id())==1) {
	    	mapper.updateWeddingInfo(weddingInfoDto);
	    	weddingInfoDto = mapper.selectWeddingInfo(loginDto.getUser_id());
	    } 
	    //웨딩인포를 여러번 입력한 적이 있다면 
	    else if (mapper.weddingInfoCheck(loginDto.getUser_id())>1) {
	    	mapper.updateWeddingInfo(weddingInfoDto);
	    }
	    //웨딩인포를 입력한 적이 없다면
	    else if (mapper.weddingInfoCheck(loginDto.getUser_id())==0){
	    	mapper.insertWeddingInfo(weddingInfoDto);
		    d_day = mapper.selectDateDiff(weddingInfoDto);
		    log.info("d-day: " + d_day);
		    log.info("CheckList Information :" + checkList);

	    } 

	    
		int count=0;
		int total=0;
		
	    //hall 40% studio 18% dress 27% makeup 6 salon 6  bouquet 3%
	    List<HashMap> rateList = new ArrayList<>();
		HashMap<String, Integer> map1 = new HashMap<>();
		HashMap<Integer,String> map2 = new HashMap<>();
		HashMap<String, Double> map3 = new HashMap<>();
		
	    if(checkList.getHall() != null) {	//hall is not null
			count++;
			total+=40;
			map1.put(checkList.getHall(), 40);
			map2.put(map2.size()+1, checkList.getHall());
	    } 
	    
	    if(checkList.getStudio()!=null) {	
			count++;
			total +=18;
			map1.put(checkList.getStudio(), 19);
			map2.put(map2.size()+1, checkList.getStudio());
	    }
	    
	    if(checkList.getDress()!=null) {
			count++;
			total+=27;
			map1.put(checkList.getDress(), 27);
			map2.put(map2.size()+1, checkList.getDress());
	    } 
	    
	    if(checkList.getMakeup()!=null) {
			count++;
			total+=6;
			map1.put(checkList.getMakeup(), 5);
			map2.put(map2.size()+1, checkList.getMakeup());
	    }
	    
	    if(checkList.getSalon()!=null) {
			count++;
			total+=6;
			map1.put(checkList.getSalon(), 6);
			map2.put(map2.size()+1, checkList.getSalon());
	    }
	    
	    if(checkList.getBouquet()!=null) {
			count++;
			total+=3;
			map1.put(checkList.getBouquet(), 3);
			map2.put(map2.size()+1, checkList.getBouquet());
	    }
	    
		int sum = 0;

		for(int i=1; i<map1.size()+1; i++) {
			sum += map1.get(map2.get(i));
		}
	    
		for(int i=1; i<map1.size()+1; i++) {
			int tempRate =  map1.get(map2.get(i));
			double rate = (tempRate * 100)/sum;
			map3.put(map2.get(i),rate);
			int value = (int) Math.round(rate*0.01*weddingInfoDto.getBudget());
			log.info("estimation value: "+ value);
			
			if(map2.get(i).equals(checkList.getHall())) {
				estimationDto.setHall(value);
			}
			 if(map2.get(i).equals("studio")) {
				estimationDto.setStudio(value);
			}
			 if(map2.get(i).equals(checkList.getDress())) {
				estimationDto.setDress(value);
			}
			 if(map2.get(i).equals("makeup")) {
				estimationDto.setMakeup(value);
			}
			 if(map2.get(i).equals("salon")) {
				estimationDto.setSalon(value);
			}
			 if(map2.get(i).equals("bouquet")) {
				estimationDto.setBouquet(value);
			}
			
		}

		log.info("Estimation Information : "+estimationDto);
		log.info("Estimation Information : "+ map2);
		log.info("Estimation Information : "+map3);

		model.addAttribute("count", count);
		model.addAttribute("d_day", d_day);
		model.addAttribute("weddingInfoDto", weddingInfoDto);
		model.addAttribute("nameMap", map2);
		model.addAttribute("rateMap", map3);
		model.addAttribute("estimationDto", estimationDto);
		model.addAttribute("checkList", checkList);

		return "estimation";
	}
	
	
	@RequestMapping(value = "/estimation_complete", method = RequestMethod.POST)
	public String estimation_complete( Model model, EstimationDTO estimationDTO) {
		log.info("estimation_complete");
	    LoginDTO loginDto = new LoginDTO();
	    loginDto = mapper.selectLoginInfo();
	    estimationDTO.setUser_id(loginDto.getUser_id());
		log.info("Estimation Information : "+estimationDTO);
		mapper.insertEstimation(estimationDTO);
		return "estimation";
	}
	
	
	@RequestMapping(value = "/community", method = RequestMethod.GET)
	public String community( Model model) {
		List<CommunityDTO> cList = new ArrayList<>();
		cList = mapper.returnCommunityAll();
		model.addAttribute("cList", cList);
		
		log.info("community");
		return "community";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login( Model model) {
		log.info("login");
		
		return "login";
	}
	
	@RequestMapping(value = "/login_complete", method = RequestMethod.POST)
	public String login_complete( Model model, LoginDTO loginDTO, HttpServletRequest request) {
		
		log.info("login_complete userDto" + loginDTO);
		//LoginDTO loginInfoDTO = 
		HttpSession session = request.getSession();
		int result = -1;
		String returnValue = "";
		if(loginDTO.isUser_type()) {			//user
			result = mapper.userLoginCheck(loginDTO);
			loginDTO.setUser_name(mapper.getUserName(loginDTO));
		}else if (!loginDTO.isUser_type()){		//ent
			result = mapper.entLoginCheck(loginDTO);
			loginDTO.setUser_name(mapper.getEntName(loginDTO));
		} else {
			returnValue="login";
		}
		
		
		log.info("loginDTO 완전체 - "+loginDTO);
		mapper.insertLoginInfo(loginDTO);
		if(result==1) {		//로그인 정보 일치		
			session.setAttribute("loginDTO", loginDTO);
			returnValue="home";
			
		} else {			//로그인정보 불일치
			session.setAttribute("loginDTO", null);
			returnValue="login";
		}
		return returnValue;
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join( Model model) {
		log.info("join");
		return "join";
	}
	
	@RequestMapping(value = "/id_check", method = RequestMethod.GET)
	public String id_check( Model model ) {		// @RequestParam("id") String id
		log.info("id_check");
		return "id_check";
	}
	
	
	@RequestMapping(value = "/duplication_check", method = RequestMethod.GET)
	public String duplication_check( Model model, String id) {
		log.info("duplication_check id - "+ id);
		int result=0;
		
		if(id!=null) {
			result = mapper.idCheck(id);
		}
		
		String msg="";
		
		if(result > 0) {
			msg = "사용불가능한 아이디 입니다!";
		}else {
			msg = "사용가능한 아이디 입니다!";			
		}
		model.addAttribute("result", result);
		model.addAttribute("id", id);
		model.addAttribute("msg", msg);
		return "id_check";
	}
	
	@RequestMapping(value = "/duplication_ok", method = RequestMethod.GET)
	public String duplication_ok( Model model, String id) {
		log.info("duplication_check id - "+ id);
		int result = mapper.idCheck(id);
		String msg="";
		
		if(result > 0) {
			msg = "사용불가능한 아이디 입니다!";
		}else {
			msg = "사용가능한 아이디 입니다!";			
		}
		model.addAttribute("result", result);
		model.addAttribute("id", id);
		model.addAttribute("msg", msg);
		return "id_check";
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String ent_detail( Model model,  @RequestParam("id") String ent_id) {
		log.info("ent_detail");
		EnterpriseDTO entDto = new EnterpriseDTO();
		entDto = mapper.returnEntInfo(ent_id);
		int imgTotal = mapper.returnEntImgCount(ent_id);
		model.addAttribute("imgTotal", imgTotal);
		model.addAttribute("entDto", entDto);
		
		return "ent_detail";
	}
	
	@RequestMapping(value = "/cart_add", method = RequestMethod.GET)
	public String cart_add( Model model,  @RequestParam("id") String ent_id) {
		log.info("cart_add ent_id : "+ent_id);

		LoginDTO loginDto = new LoginDTO();
	    loginDto = mapper.selectLoginInfo();
	    String returnValue="";	    
	    
	    if(loginDto == null ) {
	    	log.info("로그아웃....");
	    	EnterpriseDTO entDto = mapper.returnEntInfo(ent_id);
	    	model.addAttribute("entDto", entDto);
			int imgTotal = mapper.returnEntImgCount(ent_id);
			model.addAttribute("imgTotal", imgTotal);
	    	
	    	returnValue="ent_detail";
	    	
	    } else {
	    	log.info("로그인중...");
	    	CartDTO cartDto = new CartDTO();
		    
		    cartDto.setCart_id(loginDto.getUser_id()+"_cart");
		    cartDto.setUser_id(loginDto.getUser_id());
		    cartDto.setEnt_id(ent_id);
		    
			if( mapper.cart4UserCheck(cartDto.getUser_id()) == 0 ) {
				mapper.insertCart4User(cartDto.getUser_id());
			}	    
			if(mapper.entCartCheck(cartDto) <= 0) {
				mapper.insertEntCart(cartDto);
			} 
			
			List<EnterpriseDTO> cartList = new ArrayList<>();
			cartList = mapper.selectEntCartList(cartDto.getCart_id());
			model.addAttribute("cartList", cartList);
			log.info("cart_add cartList : "+cartList);
			log.info("cart_add cartList : "+cartList.get(0));

	    	returnValue="cart";
	    }


		return returnValue;
	}
	
	@RequestMapping(value = "/cart", method = RequestMethod.POST)
	public String cart( Model model) {
		LoginDTO loginDto = new LoginDTO();
	    loginDto = mapper.selectLoginInfo();
	    String returnValue="";
	    if(loginDto ==null ) {
	    	returnValue = "home";
	    } else {
	    	List<EnterpriseDTO> cartList = new ArrayList<>();
			cartList = mapper.selectEntCartList(loginDto.getUser_id()+"_cart");
			if(cartList !=null) {
				model.addAttribute("cartList", cartList);
				returnValue = "cart";
			}else {
				returnValue = "home";
			}
	    }
		
		return returnValue;
	}
	
	@RequestMapping(value = "/join_complete", method = RequestMethod.POST)
	public String join_complete( Model model, UserDTO userDto) {
		log.info("join_complete userDto - "+ userDto);
		mapper.insertUserInfo(userDto);
		return "login";
	}
	
	@RequestMapping(value = "/booking", method = RequestMethod.GET)
	public String booking( Model model,@RequestParam("id") String ent_id) {
		log.info("booking");
		return "booking";
	}
	
	@RequestMapping(value = "/request", method = RequestMethod.GET)
	public String request( Model model, @RequestParam("id") String ent_id) {
		log.info("request:" );
		LoginDTO loginDto = new LoginDTO();
	    loginDto = mapper.selectLoginInfo();
		String returnValue="";
		String msg = "";
		
    	EnterpriseDTO entDto = mapper.returnEntInfo(ent_id);
	    WeddingInfoDTO infoDto = mapper.selectWeddingInfo(loginDto.getUser_id());
	    EstimationDTO estDto = mapper.selectEstimation(loginDto.getUser_id());

	    //인증을 받아온다
	    int result = mapper.returnCertification(loginDto.getUser_id());
	    
	    //은증값이 완료(1) 됐거나, 웨딩인포가 있다면 , 견적내용이 있다면 
	    if(result ==1 && infoDto!=null && estDto !=null) {	//인증완료
		    log.info("wedding_info budget : "+infoDto.getBudget());
		    String code_id = mapper.returnEntCodeId(ent_id);
	        Calendar calendar = Calendar.getInstance();
	        calendar.setTime(infoDto.getDate());
	        int month = calendar.get(Calendar.MONTH) + 1;
	        String season = "";
	        int season_price = 0;
	        if((month>=3&& month<=5)||(month>=9 && month<=11) ) {
	        	season = "성수기";
	        	season_price = entDto.getPeak();
	        }else  {
	        	season = "비수기";
	        	season_price = entDto.getOff();
	        }
		    model.addAttribute("season", season);
		    model.addAttribute("season_price", season_price);

		    model.addAttribute("infoDto", infoDto);
		    model.addAttribute("code_id", code_id);
		    model.addAttribute("loginDto", loginDto);
		    model.addAttribute("estDto", estDto);
		    model.addAttribute("entDto", entDto);
	    	returnValue="request";

	    } else {	//인증실패
	    	model.addAttribute("msg", msg);
	    	returnValue="home";
	    }
		return returnValue;
	    
	}
	
	@RequestMapping(value = "/request-list", method = RequestMethod.GET)
	public String request_list( Model model) {
		log.info("request-list");
		return "request-list";
	}
	
	@RequestMapping(value = "/check-list", method = RequestMethod.GET)
	public String check_list( Model model ) {
		log.info("check-list");
		return "check-list";
	}
	
	@RequestMapping(value = "/find", method = RequestMethod.GET)
	public String find( Model model) {
		log.info("find");
		return "find";
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search( Model model) {
		log.info("search");
		return "search";
	}
	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage( Model model) {
		log.info("mypage");
		LoginDTO loginDto = new LoginDTO();
	    loginDto = mapper.selectLoginInfo();
	    String returnValue="";
	    if(loginDto.isUser_type()) {
	    	returnValue="mypage4user";
	    } else {
	    	returnValue="mypage4ent";
	    }
		return returnValue;
	}
	
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public String info( Model model) {
		log.info("info");
		return "info";
	}
	
	
	@RequestMapping(value = "/authentification", method = RequestMethod.GET)
	public String authentification( Model model) {
		log.info("authentification");
		return "authentification";
	}
	
	@RequestMapping(value = "/request-add", method = RequestMethod.POST)
	public String request_add( Model model) {
		log.info("request-add");
		String returnValue="";
		LoginDTO loginDto = new LoginDTO();
	    loginDto = mapper.selectLoginInfo();
	    int result = mapper.returnCertification(loginDto.getUser_id());
	    if(result > 0) {	//인증완료
	    	returnValue="request-list";
	    } else {	//인증실패
	    	returnValue="authentification";
	    }
		return returnValue;
	}
	

    private int generateRandomNumber() {
        Random random = new Random();
        return random.nextInt(9000) + 1000;
	}
    
	@RequestMapping(value = "/certification", method = RequestMethod.GET)
	public String certification( Model model, String toNumber) {
		log.info("certification");
        Message message = new Message();
        
        int randomNumber = generateRandomNumber();

        message.setFrom("01020126616");
        message.setTo(toNumber);
        message.setText("[EveryWedding] 아래 인증번호를 화면에 입력해주세요. 인증번호 : ["+randomNumber+"]");

        SingleMessageSentResponse response = this.messageService.sendOne(new SingleMessageSendingRequest(message));
        System.out.println(response);

		log.info("number:"+randomNumber);
        model.addAttribute("randomNumber", randomNumber);
        
        return "authentification";
	}
	
	@RequestMapping(value = "/certification-complete", method = RequestMethod.GET)
	public String certification_complete( Model model, CertificationDTO dto) {
		LoginDTO loginDto = new LoginDTO();
	    loginDto = mapper.selectLoginInfo();
		String returnValue="";
		String msg ="";
		log.info("number:"+dto.getNumber());
		log.info("number:"+dto.getRandomNumber());

		if(dto.getRandomNumber() == dto.getNumber()) {
			mapper.certificationUser(loginDto.getUser_id());
			returnValue = "home";
			msg = "인증성공, 홈으로 갑니다.";
		} else {
			msg = "인증번호가 맞지 않습니다.";
			returnValue = "authentification";

		}
        
        return returnValue;
	}
	
}
