package com.fundee.pro;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fundee.dao.LoginDAO;
import com.fundee.dto.LoginDTO;

@Controller
public class LoginController {

    @Autowired
    private LoginDAO loginDAO;   

    // 로그인 폼
    @RequestMapping(value="/loginForm", method=RequestMethod.GET)
    public String loginForm() {
        return "loginForm";
    }

    // 로그인 처리
    @RequestMapping(value="/login", method=RequestMethod.POST)
    public String login(@RequestParam String id,
                        @RequestParam String password,
                        HttpSession session,
                        Model model) {

        // DAO에서 유저 전체 정보(LoginDTO)를 가져오도록 변경
        LoginDTO user = loginDAO.findByIdAndPassword(id, password);

        if (user != null) {
            session.setAttribute("loginUser", user);            // 객체 통째로 저장
            session.setAttribute("loginId", user.getId());  	// 아이디
            session.setAttribute("loginName", user.getName());
            session.setAttribute("loginNickname", user.getNickname()); // 닉네임

            
            // ★ 여기서 ROLE 체크
            if (user.getRole() != null && user.getRole() == 1) {
                return "redirect:/index.do";   // 관리자 메인
            } else {
                return "redirect:/index.do";    // 일반회원 메인
            }

        } else {
            model.addAttribute("message", "아이디 또는 비밀번호가 올바르지 않습니다.");
            return "loginForm";
        }
    }

    // 회원가입 폼
    @RequestMapping(value="/join", method=RequestMethod.GET)
    public String joinForm() {
        return "join";
    }

    // 회원가입 처리
    @RequestMapping(value="/join", method=RequestMethod.POST)
    public String join(@ModelAttribute LoginDTO dto, Model model) {

        // 서버 비밀번호 일치 검증
        if (dto.getPassword() == null || !dto.getPassword().equals(dto.getPasswordCheck())) {
            model.addAttribute("message", "비밀번호 확인이 일치하지 않습니다.");
            return "join";
        }

        // 이메일 중복 확인
        if (loginDAO.existsByEmail(dto.getEmail()) > 0) {
            model.addAttribute("message", "이미 사용 중인 이메일입니다.");
            return "join";
        }

        // role 보정
        Integer role = dto.getRole();
        if (role == null || (role != 0 && role != 1)) role = 0;
        dto.setRole(role);

        try {
            int r = loginDAO.insertMember(dto);
            return (r == 1) ? "redirect:/loginForm" : "join";
        } catch (org.springframework.dao.DuplicateKeyException e) {
            model.addAttribute("message", "이미 사용 중인 정보가 있습니다. (이메일/아이디/닉네임 등)");
            return "join";
        } catch (Exception e) {
            model.addAttribute("message", "회원가입 중 오류가 발생했습니다.");
            return "join";
        }
        
        
        
    }

    // 아이디 찾기 폼
    @RequestMapping(value="/find_id", method=RequestMethod.GET)
    public String findIdForm() {
        return "find_id";
    }

    // 아이디 찾기 처리
    @RequestMapping(value="/find_id", method=RequestMethod.POST)
    public String findId(@RequestParam String email, Model model) {
        String id = loginDAO.findIdByEmail(email);
        if (id == null) {
            model.addAttribute("message", "일치하는 아이디를 찾을 수 없습니다.");
            return "find_id_ok";
        }
        model.addAttribute("foundId", id);
        return "find_id_ok";
    }

    // 이메일 중복 체크
    @RequestMapping(
        value = {"/checkEmail", "/checkEmail.do"},
        method = RequestMethod.GET,
        produces = "text/plain;charset=UTF-8"
    )
    @ResponseBody
    public String checkEmail(@RequestParam("email") String email) {
        int cnt = loginDAO.existsByEmail(email);
        return String.valueOf(cnt);   // "0" 또는 "1" 반환
    }
    @RequestMapping(
	    value = {"/checkNickname", "/checkNickname.do"},
	    method = RequestMethod.GET,
	    produces = "text/plain;charset=UTF-8"
	)
    
    
	@ResponseBody
	public String checkNickname(@RequestParam("nickname") String nickname) {
	    int cnt = loginDAO.existsByNickname(nickname);
	    return String.valueOf(cnt);  
	}

    //로그아웃
    @RequestMapping(value="/logout", method=RequestMethod.GET)
    public String logout(HttpSession session) {
        session.invalidate(); // 세션 완전 종료
        return "redirect:/index.do"; 
    }
    
    // 비밀번호 찾기 폼
    @RequestMapping(value="/find_pwd", method=RequestMethod.GET)
    public String findPwdForm() {
        return "find_pwd";
    }

    // 비밀번호 찾기 처리
    @RequestMapping(value="/find_pwd", method=RequestMethod.POST)
    public String findPwd(@RequestParam String id,
                          @RequestParam String email,
                          Model model) {
        String pwd = loginDAO.findPwdByIdAndEmail(id, email);

        if (pwd == null) {
            model.addAttribute("message", "일치하는 정보가 없습니다.");
        } else {
            model.addAttribute("foundPwd", pwd);
        }
        return "find_pwd_ok";
    }

    
    
    
    
    
}

















