package kr.co.goodee39.service;

import java.util.Arrays;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;

import kr.co.goodee39.vo.ImageVO;
import kr.co.goodee39.vo.mnwVO;

@Service
public class MnwService {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	// 게시글 등록하기
	@Transactional
	public void insertBBS(mnwVO vo) {

		// JSON 객체에 대한 핸들링
		Gson gson = new Gson();
		ImageVO[] fileArray = gson.fromJson(vo.getFileList(), ImageVO[].class);
		List<ImageVO> fileList = Arrays.asList(fileArray);

		// 게시글 삽입
		sqlSessionTemplate.insert("bbs.insertBBS", vo);

		for (ImageVO img : fileList) {
			// 파일 이름 삽입 with 조회가능하게 num이름과 함께
			img.setBnum(vo.getNum());
			img.setBdiv(vo.getBdiv());
			sqlSessionTemplate.insert("img.insertImage", img);
		}
	}
}
