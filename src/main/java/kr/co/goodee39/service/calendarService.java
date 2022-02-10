package kr.co.goodee39.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.goodee39.vo.calendarVO;

@Service
public class calendarService {
		@Autowired
		SqlSessionTemplate sqlSessionTemplate;
		// 인서트
		public void insertC(calendarVO vo) {
			sqlSessionTemplate.insert("calendar.insertC",vo);
			
		}
		// 삭제
		public void deleteC(calendarVO vo) {
			sqlSessionTemplate.delete("calendar.deleteC",vo);
		}
		// 데이터 가져오기
		public List<calendarVO> selectC() {
			return sqlSessionTemplate.selectList("calendar.selectC");
		}
}