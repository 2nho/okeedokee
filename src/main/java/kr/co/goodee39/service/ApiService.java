package kr.co.goodee39.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.stereotype.Service;

@Service
public class ApiService {

	public String getXml() {

		StringBuffer sb = new StringBuffer();
		
		String xmlFile = "";

		try {
			// URL 설정
			StringBuilder urlBuilder = new StringBuilder("http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic");
			// 인증키 설정
			urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") + "=QWmRBRgQFVjPLxlHE0NTfMfwlmHMGKmPqTeI1D%2BPhZO2gQzZpIR0ycYZCtH%2BN7p8W7amKDhwRqHFzjCfSU%2Fvzw%3D%3D");
			// 축종 : 견(417000)
			urlBuilder.append("&" + URLEncoder.encode("upkind", "UTF-8") + "=" + URLEncoder.encode("417000", "UTF-8"));
			// 출력 페이지 수
			urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8"));
			// 총 가져올 정보 수
			urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("500", "UTF-8"));
			// urlBuilder.append("&type=json"); /*json 출력인데 안먹힘*/

			// url 생성
			URL url = new URL(urlBuilder.toString());
			System.out.println(url.toString());
			
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			// Request 타입 설정
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-Type", "application/json");

			//반환코드 : 200
			//System.out.println("Response code: " + conn.getResponseCode());

			//텍스트 타입 설정 
			BufferedReader rd;
			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}

			// 가져온 내용들 한 변수로 합치기
			String line;
			while ((line = rd.readLine()) != null) {
				sb.append(line + "\n");
			}

			rd.close();
			conn.disconnect();

			// xml 파일화
			xmlFile = sb.toString();
			
			return xmlFile;
			

		} catch (Exception e) {
			e.printStackTrace();
			
			return null;
		}
		
	}
}
