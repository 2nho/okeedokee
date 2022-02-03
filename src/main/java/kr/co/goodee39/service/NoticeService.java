package kr.co.goodee39.service;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.google.gson.Gson;

import kr.co.goodee39.vo.ImageVO;
import kr.co.goodee39.vo.MemberVO;
import kr.co.goodee39.vo.NoticeVO;

@Service
public class NoticeService {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public void selectNoticeList(Model model, int num, String title, String content) {
		// 불러오려고 하는 페이지에 form태그가 있을 경우에는 커맨드 객체로 맵핑을 해주고
		// 그렇지 않을 경우는 굳이 커맨드 객체를 생성하지 않는다. 그래서 생성자로 
		NoticeVO vo = new NoticeVO();
		vo.setStart((num-1)*vo.getCount());
		
		if(!title.equals("")) {
			model.addAttribute("title", title);
			vo.setTitle("%"+title+"%");
		}
		if(!content.equals("")) {
			model.addAttribute("content", content);
			vo.setContent("%"+content+"%");
		}
		
		
		model.addAttribute("list",sqlSessionTemplate.selectList("notice.selectNoticeList",vo));
		int count = sqlSessionTemplate.selectOne("notice.selectNoticeCount",vo);
		model.addAttribute("num", num);
		
		int total = count/10+((count%10==0)?0:1);
		int minBlock = (((num-1)/10)*10)+1;
		int maxBlock = (((num-1)/10)+1)*10;
		
		model.addAttribute("total", total);
		model.addAttribute("maxBlock", maxBlock);
		model.addAttribute("minBlock", minBlock);
		
	}
	
	public void selectNotice(Model model, NoticeVO vo) {
//		vo = sqlSessionTemplate.selectOne("bbs.selectBBS",vo);
//		model.addAttribute("NoticeVO", vo);
		NoticeVO vo2 = sqlSessionTemplate.selectOne("notice.selectNotice",vo);
		vo.setContent(vo2.getContent());
		vo.setTitle(vo2.getTitle());
		vo.setName(vo2.getName());
		vo.setNum(vo2.getNum());
		vo.setDate(vo2.getDate());
		vo.setBdiv(vo2.getBdiv());
		
		ImageVO fvo = new ImageVO();
		fvo.setBnum(vo2.getNum());
		fvo.setBdiv(vo2.getBdiv());
		
		List<ImageVO> filelist = sqlSessionTemplate.selectList("img.selectImg",fvo);
		model.addAttribute("filelist", filelist);
	}
	
	public void deleteNotice(NoticeVO vo) {
		sqlSessionTemplate.delete("notice.deleteNotice",vo);
	}
	
	public void updateNotice(NoticeVO vo) {
		Gson gson = new Gson();
		
		ImageVO[] fileArray = gson.fromJson(vo.getFilelist(), ImageVO[].class);
		
		if(vo.getFilelist() == "") {
			vo.setHasfile("N");
		}else {
			vo.setHasfile("Y");
		}
		
		sqlSessionTemplate.update("notice.updateNotice", vo);
		
		 if(fileArray != null) { List<ImageVO> fileList = Arrays.asList(fileArray);
		 
			 for (ImageVO ImageVO : fileList) { 
				 ImageVO.setBdiv(5);
				 ImageVO.setBnum(vo.getNum());
				 
				 sqlSessionTemplate.insert("img.insertImg", ImageVO);
			 } 
		 }
		
	}
	
	@Transactional
	public void insertNotice(NoticeVO vo, HttpSession session) {
		Gson gson = new Gson();
		ImageVO[] fileArray = gson.fromJson(vo.getFilelist(), ImageVO[].class);
		List<ImageVO> fileList = Arrays.asList(fileArray);
		
		if(vo.getFilelist() == "[]") {
			vo.setHasfile("N");
		}else {
			vo.setHasfile("Y");
		}
		
		MemberVO account = (MemberVO) session.getAttribute("account");
		
		vo.setName(account.getName());
		vo.setBdiv(5);
		sqlSessionTemplate.insert("notice.insertNotice",vo);
	
		for (ImageVO ImageVO : fileList) { 
			ImageVO.setBdiv(5);
			ImageVO.setBnum(vo.getNum());
			sqlSessionTemplate.insert("img.insertImg", ImageVO);
			
		}
	}
	
	public void deleteImgAll(ImageVO fvo) {
		sqlSessionTemplate.delete("img.deleteImg", fvo);
	}
	
	@Transactional
	public void deleteImg(ImageVO[] fvos) {
		for (ImageVO ImageVO : fvos) {
			sqlSessionTemplate.delete("img.deleteImg",ImageVO);
		}
		
	}
}
