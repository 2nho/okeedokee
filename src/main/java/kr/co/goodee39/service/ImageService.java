package kr.co.goodee39.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.goodee39.vo.ImageVO;

@Service
public class ImageService {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	// 게시글 수정시 이미지 삭제
	@Transactional
	public void deleteImgFile(ImageVO[] ivos) {
		for (ImageVO ivo : ivos) {
			sqlSessionTemplate.delete("img.deleteImg", ivo);
		}

	}
	
	

}
