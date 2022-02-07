package kr.co.goodee39.service;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class VolunteerService {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	//게시글 가져오기 및 페이징
		public void selectVolunteer(
				String title, 
				int mnum,  
				String perid,
				Model model) {
}
}