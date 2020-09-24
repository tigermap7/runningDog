/*
 * package com.kh.runningdog.member.controller;
 * 
 * import java.io.IOException; import java.io.UnsupportedEncodingException;
 * import java.util.ArrayList; import java.util.List;
 * 
 * import javax.servlet.http.HttpSession;
 * 
 * import org.codehaus.jackson.map.ObjectMapper; import
 * org.springframework.stereotype.Controller; import
 * org.springframework.ui.Model; import
 * org.springframework.web.bind.annotation.RequestMapping;
 * 
 * import com.fasterxml.jackson.databind.JsonNode; import
 * com.google.inject.Inject; import
 * com.kh.runningdog.member.model.service.MemberService;
 * 
 * import sun.net.www.http.HttpClient;
 * 
 * @Controller public class kakaoLoginController {
 * 
 * @Inject private MemberService memberService;
 * 
 * private final static String id = "rest api"; private final static String url
 * = "redirect uri";
 * 
 * @RequestMapping(value = "/kakaoLogin.do") public String loginview(Model
 * model, HttpSession session) { String kakaoUrl
 * ="https://kauth.kakao.com/oauth/authorize?" +"client_id="+id +
 * "&redirect_uri="+url+"&response_type=code";
 * model.addAttribute("kakaoUrl",kakaoUrl); return "login"; }
 * 
 * 
 * public static JsonNode getAccessToken(String autorize_code){ final String
 * RequestUrl = "https://kauth.kakao.com/oauth/token"; final
 * List<BasicNameValuePair> postParams = new ArrayList<BasicNameValuePair>();
 * postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
 * postParams.add(new BasicNameValuePair("client_id", id)); // REST API KEY
 * postParams.add(new BasicNameValuePair("redirect_uri", url)); // 리다이렉트 URI
 * postParams.add(new BasicNameValuePair("code", autorize_code)); // 로그인 과정중 얻은
 * code 값 final HttpClient client = HttpClientBuilder.create().build(); final
 * HttpPost post = new HttpPost(RequestUrl); JsonNode returnNode = null; try {
 * post.setEntity(new UrlEncodedFormEntity(postParams)); final HttpResponse
 * response = client.execute(post); final int responseCode =
 * response.getStatusLine().getStatusCode();
 * System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
 * System.out.println("Post parameters : " + postParams);
 * System.out.println("Response Code : " + responseCode);
 * 
 * //JSON 형태 반환값 처리 ObjectMapper mapper = new ObjectMapper(); returnNode =
 * mapper.readTree(response.getEntity().getContent()); } catch
 * (UnsupportedEncodingException e) { e.printStackTrace(); } catch
 * (ClientProtocolException e) { e.printStackTrace(); } catch (IOException e) {
 * e.printStackTrace(); } finally { } return returnNode; }
 * 
 * public static JsonNode getKakaoUserInfo(String access_token) { final String
 * RequestUrl = "https://kapi.kakao.com/v2/user/me"; final HttpClient client =
 * HttpClientBuilder.create().build(); final HttpPost post = new
 * HttpPost(RequestUrl); String accessToken = access_token;
 * 
 * // add header post.addHeader("Authorization", "Bearer " + accessToken);
 * JsonNode returnNode = null; try { final HttpResponse response =
 * client.execute(post); final int responseCode =
 * response.getStatusLine().getStatusCode();
 * System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
 * System.out.println("Response Code : " + responseCode);
 * 
 * //JSON 형태 반환값 처리 ObjectMapper mapper = new ObjectMapper(); returnNode =
 * mapper.readTree(response.getEntity().getContent()); } catch
 * (UnsupportedEncodingException e) { e.printStackTrace(); } catch
 * (ClientProtocolException e) { e.printStackTrace(); } catch (IOException e) {
 * e.printStackTrace(); } finally { // clear resources } return returnNode;
 * 
 * }
 * 
 * @RequestMapping(value="/kakaologin.do",method=RequestMethod.GET) public
 * String kakaologin(@RequestParam("code") String code,HttpSession
 * session)throws Exception{ JsonNode jsonToken = getAccessToken(code); String
 * access_token = jsonToken.get("access_token").toString(); JsonNode userInfo =
 * getKakaoUserInfo(access_token); String id = userInfo.get("id").toString();
 * String nickName = userInfo.get("properties").get("nickname").toString();
 * session.setAttribute("userid", nickName); System.out.println(id+nickName);
 * return "redirect:crazyboard.do"; }
 * 
 * }
 */