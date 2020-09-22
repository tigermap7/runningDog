package com.kh.runningdog.contents;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.python.core.PyFunction;
import org.python.core.PyObject;
import org.python.core.PyString;
import org.python.util.PythonInterpreter;

public class KnowledgeCrawling {
	
	private static PythonInterpreter intPre;
	
	//반려동물 지식 리스트 크로링
	public static JSONObject knowledgeList(String animal) {

		intPre = new PythonInterpreter();
		intPre.execfile("C:\\gaenasona_workspace\\runningdog\\src\\main\\webapp\\resources\\contents_pythonFiles\\knowledgeList.py");

		PyFunction pyFunction = (PyFunction) intPre.get("knowledgeList", PyFunction.class);

		PyObject pyobj = pyFunction.__call__(new PyString(animal));
		
		String result = pyobj.toString();
		
		//크롤링해서 받은 결과값 JSONObject로 변환
		JSONParser parser = new JSONParser();
		JSONObject jobj = new JSONObject();
		try {
			jobj = (JSONObject) parser.parse(result);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return jobj;
	}
	
	
	//반려동물 지식 상세정보 크롤링
	public static String knowledgeDetal(String link) {
		intPre = new PythonInterpreter();
		intPre.execfile("C:\\gaenasona_workspace\\runningdog\\src\\main\\webapp\\resources\\contents_pythonFiles\\knowledgeDetail.py");
		
		PyFunction pyFunction = (PyFunction) intPre.get("knowledgeDetail", PyFunction.class);

		PyObject pyobj = pyFunction.__call__(new PyString(link));
		
		String result = pyobj.toString();
		
		JSONParser parser = new JSONParser();
		
		JSONObject jobj = new JSONObject();
		try {
			jobj = (JSONObject) parser.parse(result);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String content = jobj.get("content").toString();
		
		return content; 
	}
	
	

}
