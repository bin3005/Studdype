package com.studdype.test.model.dao.study;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.studdype.test.model.dto.study.StudyDto;

@Repository
public class StudyDaoImpl implements StudyDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//스터디 list 전체 가져오기
	@Override
	public List<StudyDto> studyList(Map pageMap) {

		List<StudyDto> studyList = null;

		try {
			studyList = sqlSession.selectList(NAMESPACE + "studyList", pageMap);
		} catch (Exception e) {
			System.out.println("에러 발생: studyDao - selectList");
			e.printStackTrace();
		}

		return studyList;
	}

	//스터디 번호로 selectOne
	@Override
	public StudyDto selectOneBySno(int s_no) {
		StudyDto res = null;
		
		try {
			res = sqlSession.selectOne(NAMESPACE+"selectOneBySno", s_no);
		} catch (Exception e) {
			System.out.println("[ERROR]: selectOneBySno");
			e.printStackTrace();
		}
		return res;
	}

	// 스터디 insert
	@Override
	public int insertStudy(StudyDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insertStudy", dto);
		} catch (Exception e) {
			System.out.println("[ERROR] : insertStudy");
			e.printStackTrace();
		}
		
		return res;
	}

	// 등록된 스터디 마지막 번호
	@Override
	public int selectStudyFinalNumber() {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE+"selectStudyFinalNumber");
		} catch (Exception e) {
			System.out.println("[ERROR] : selectStudyFinalNumber");
			e.printStackTrace();
		}
		return res;
	}
	
	//스터디 리스트 총 갯수
	@Override
	public int selectTotalStudyListNum() {
		int totalListNum = 0;
		try {
			totalListNum = sqlSession.selectOne(NAMESPACE+"selectTotalStudyListNum");
		}catch(Exception e) {
			System.out.println("에러: 스터디 리스트 총 갯수");
			e.printStackTrace();
		}
		
		return totalListNum;
	}

}
