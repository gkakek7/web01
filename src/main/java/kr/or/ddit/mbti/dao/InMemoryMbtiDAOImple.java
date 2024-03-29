package kr.or.ddit.mbti.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.MbtiVO;

public class InMemoryMbtiDAOImple implements MbtiDAO {
	

	private Map<String, MbtiVO> mbtiMap;

	public InMemoryMbtiDAOImple() {
		super();
		mbtiMap = new HashMap<String, MbtiVO>();
		mbtiMap.put("istj", new MbtiVO("istj","1. ISTJ 소금형","/WEB-INF/views/mbti/mbti/isfj.html"));
		mbtiMap.put("istj", new MbtiVO("istj","1. ISTJ 소금형","/WEB-INF/views/mbti/mbti/istj.html"));
        mbtiMap.put("isfj", new MbtiVO("isfj","2. ISFJ 권력형","/WEB-INF/views/mbti/mbti/isfj.html"));
        mbtiMap.put("infj", new MbtiVO("infj","3. INFJ 예언자형","/WEB-INF/views/mbti/mbti/infj.html"));
        mbtiMap.put("intj", new MbtiVO("intj","4. INTJ 과학자형","/WEB-INF/views/mbti/mbti/intj.html"));
        mbtiMap.put("istp", new MbtiVO("istp","5. ISTP 백과사전형","/WEB-INF/views/mbti/mbti/istp.html"));
        mbtiMap.put("isfp", new MbtiVO("isfp","6. ISFP 성인군자형","/WEB-INF/views/mbti/mbti/isfp.html"));
        mbtiMap.put("infp", new MbtiVO("infp","7. INFP 잔다르크형","/WEB-INF/views/mbti/mbti/infp.html"));
        mbtiMap.put("intp", new MbtiVO("intp","8. INTP 아이디어형","/WEB-INF/views/mbti/mbti/intp.html"));
        mbtiMap.put("estp", new MbtiVO("estp","9. ESTP 활동가형","/WEB-INF/views/mbti/mbti/estp.html"));
        mbtiMap.put("esfp", new MbtiVO("esfp","10. ESFP 사교형","/WEB-INF/views/mbti/mbti/esfp.html"));
        mbtiMap.put("enfp", new MbtiVO("enfp","11. ENFP 스파크형","/WEB-INF/views/mbti/mbti/enfp.html"));
        mbtiMap.put("entp", new MbtiVO("entp","12. ENTP 발명가형","/WEB-INF/views/mbti/mbti/entp.html"));
        mbtiMap.put("estj", new MbtiVO("estj","13. ESTJ 사업가형","/WEB-INF/views/mbti/mbti/estj.html"));
        mbtiMap.put("esfj", new MbtiVO("esfj","14. ESFJ 친선도모형","/WEB-INF/views/mbti/mbti/esfj.html"));
        mbtiMap.put("enfj", new MbtiVO("enfj","15. ENFJ 언변능숙형","/WEB-INF/views/mbti/mbti/enfj.html"));
        mbtiMap.put("entj", new MbtiVO("entj","16. ENTJ 지도자형","/WEB-INF/views/mbti/mbti/entj.html"));
	}

	@Override
	public List<MbtiVO> selectMbtiList() {
		return new ArrayList<MbtiVO>(mbtiMap.values());
	}

	@Override
	public MbtiVO selectMbti(String type) {
		return mbtiMap.get(type);
	}

}
