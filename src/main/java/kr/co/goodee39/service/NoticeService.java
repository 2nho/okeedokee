package kr.co.goodee39.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.google.gson.Gson;

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
		
//		FileVO fvo = new FileVO();
//		fvo.setBnum(vo2.getNum());
//		
//		List<FileVO> filelist = sqlSessionTemplate.selectList("file.selectFile",fvo);
//		model.addAttribute("filelist", filelist);
	}
	
	public void deleteNotice(NoticeVO vo) {
		sqlSessionTemplate.delete("notice.deleteNotice",vo);
	}
	
	public void updateNotice(NoticeVO vo) {
//		Gson gson = new Gson();
		
		/* FileVO[] fileArray = gson.fromJson(vo.getFilelist(), FileVO[].class); */
		
		sqlSessionTemplate.update("notice.updateNotice", vo);
		
		/*
		 * if(fileArray != null) { List<FileVO> fileList = Arrays.asList(fileArray);
		 * System.out.println(vo.getNum());
		 * 
		 * for (FileVO fileVO : fileList) { fileVO.setBnum(vo.getNum());
		 * sqlSessionTemplate.insert("file.insertFile", fileVO); } }
		 */
	}
	
	@Transactional
	public void insertNotice(NoticeVO vo) {
		Gson gson = new Gson();
		
		/*
		 * FileVO[] fileArray = gson.fromJson(vo.getFilelist(), FileVO[].class);
		 * List<FileVO> fileList = Arrays.asList(fileArray);
		 */
		
		
		sqlSessionTemplate.insert("notice.insertNotice",vo);
		
		System.out.println(vo.getNum());
		/*
		 * for (FileVO fileVO : fileList) { fileVO.setBnum(vo.getNum());
		 * sqlSessionTemplate.insert("file.insertFile", fileVO);
		 * 
		 * }
		 */
	}
}
