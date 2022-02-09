package kr.co.goodee39.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

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
	
	
	public String cpiMember(MemberVO vo, String cpi, HttpServletResponse response) throws IOException{
		MemberVO vo1 = sqlSessionTemplate.selectOne("member.selectMember", vo);
		String path = "";
		if(vo1 != null && cpi != null) {
			path = "forward:/cpiModify";
		}else {
			// 데이터 처리 타입
			response.setContentType("text/html; charset=UTF-8");
			// out 인스턴스 생성
			PrintWriter out = response.getWriter();
			// alert 메시지 생성 및 이동 경로 설정
			out.println("<script>alert('계정 정보를 다시 확인해주세요.'); location.href='/okeedokee/mypage';</script>");
			// 출력
			out.flush();
			return null;
		}
		return path;
	}

	@Transactional
	public void reserCreateService(ReservationVO vo) {
		vo.setBdiv(6);
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

	public void selectReser(ReservationVO vo) {
		ReservationVO vo2 = sqlSessionTemplate.selectOne("reservation.selectReser", vo);
		vo.setRnum(vo2.getRnum());
		vo.setMnum(vo2.getMnum());
		vo.setReserName(vo2.getReserName());
		vo.setContent(vo2.getContent());
		vo.setReserDate(vo2.getReserDate());
		vo.setKindCd(vo2.getKindCd());
		vo.setSexCd(vo2.getSexCd());
		vo.setAge(vo2.getAge());
		vo.setSpecialMark(vo2.getSpecialMark());
		vo.setNoticeSdt(vo2.getNoticeSdt());
		vo.setHappenPlace(vo2.getHappenPlace());
		vo.setDogImg(vo2.getDogImg());
		vo.setCareNm(vo2.getCareNm());
		vo.setCareAddr(vo2.getCareAddr());
		vo.setCareTel(vo2.getCareTel());
		vo.setChargeNm(vo2.getChargeNm());
	}

	public void updateReser(ReservationVO vo) {
		sqlSessionTemplate.update("reservation.updateReser", vo);
	}

	public void deleteReser(ReservationVO vo) {
		sqlSessionTemplate.delete("reservation.deleteReser",vo);
	}
}
