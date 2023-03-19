package kr.happyjob.study.adm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.happyjob.study.adm.model.SurveyModel;
import kr.happyjob.study.adm.service.SurveyService;


@Controller
@RequestMapping("/adm/")
public class SurveyController {
	
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();
	
	@Autowired
	SurveyService surveyService;
	
	/**
	 * 초기화면
	 */
	@RequestMapping("survey.do")
	public String survey(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".survey");
		logger.info("   - paramMap : " + paramMap);
		
		logger.info("+ End " + className + ".survey");

		return "adm/survey/survey";
	}
	
	// 설문조사 강사 목록 조회
	@RequestMapping("surveyTeacherList.do")
	public String surveyTeacherList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".surveyTeacherList");
		logger.info("   - paramMap : " + paramMap);
		
		int pageNum = Integer.parseInt(String.valueOf(paramMap.get("pageNum")));
		int pageSize = Integer.parseInt(String.valueOf(paramMap.get("pageSize")));
		int startPage = (pageNum -1) * pageSize;
		
		paramMap.put("pageSize", pageSize);
		paramMap.put("startPage", startPage);
		
		List<SurveyModel> surveyTeacherList = surveyService.surveyTeacherList(paramMap);
		int totalCnt = surveyService.surveyTeacherListCnt(paramMap);
		
		model.addAttribute("surveyTeacherList", surveyTeacherList);
		model.addAttribute("totalCnt", totalCnt);
		
		logger.info("+ End " + className + ".surveyTeacherList");
		
		return "adm/survey/surveyTeacherList";
	}
	
	// 설문조사 강의 목록 조회
	@RequestMapping("surveyLectureList.do")
	public String surveyLectureList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".surveyLectureList");
		logger.info("   - paramMap : " + paramMap);
		
		int pageNum = Integer.parseInt(String.valueOf(paramMap.get("pageNum")));
		int pageSize = Integer.parseInt(String.valueOf(paramMap.get("pageSize")));
		int startPage = (pageNum - 1) * pageSize;
		
		paramMap.put("pageSize", pageSize);
		paramMap.put("startPage", startPage);
		
		List<SurveyModel> surveyLectureList = surveyService.surveyLectureList(paramMap);
		int totalCnt = surveyService.surveyLectureListCnt(paramMap);
		
		model.addAttribute("surveyLectureList", surveyLectureList);
		model.addAttribute("totalCnt", totalCnt);
		
		logger.info("+ End " + className + ".surveyLectureList");
		
		return "adm/survey/surveyLectureList";
	}
	
	// 설문조사 결과 조회
	@RequestMapping("surveyResult")
	@ResponseBody
	public Map<String, Object> surveyResult(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".surveyResult");
		logger.info("   - paramMap : " + paramMap);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		SurveyModel surveyResult = surveyService.surveyResult(paramMap);
		
		returnMap.put("surveyResult", surveyResult);
		
		logger.info("+ End " + className + ".surveyResult");
		
		return returnMap;
	}
	
	
	


}
