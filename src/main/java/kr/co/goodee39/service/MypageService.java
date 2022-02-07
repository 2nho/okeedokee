package kr.co.goodee39.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import kr.co.goodee39.vo.MemberVO;
import kr.co.goodee39.vo.NoticeVO;
import kr.co.goodee39.vo.ReservationVO;

@Service
public class MypageService {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	
	public String cpiMember(MemberVO vo, String cpi) {
		MemberVO vo1 = sqlSessionTemplate.selectOne("member.selectMember", vo);
		String path = "";
		if(vo1 != null && cpi != null) {
			path = "forward:/cpiModify";
		}else {
			path = "redirect:/mypage";
		}
		return path;
	}

	@Transactional
	public void reserCreateService(ReservationVO vo) {
		sqlSessionTemplate.insert("reservation.insertReser", vo);
	}

	public void selectReserList(Model model, int num, String content) {
		ReservationVO vo = new ReservationVO();
		vo.setStart((num-1)*vo.getCount());
		
		if(!content.equals("")) {
			model.addAttribute("content", content);
			vo.setContent("%"+content+"%");
		}
		
		model.addAttribute("list",sqlSessionTemplate.selectList("reservation.selectReserList",vo));
		int count = sqlSessionTemplate.selectOne("reservation.selectReserCount",vo);
		model.addAttribute("num", num);
		
		int total = count/10+((count%10==0)?0:1);
		int minBlock = (((num-1)/10)*10)+1;
		int maxBlock = (((num-1)/10)+1)*10;
		
		model.addAttribute("total", total);
		model.addAttribute("maxBlock", maxBlock);
		model.addAttribute("minBlock", minBlock);
	}
	
}
