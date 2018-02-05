package st.user.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import st.core.tool.Constant;
import st.user.model.UserModel;
import st.user.service.LogResService;

@Controller
@RequestMapping("/user")
public class LogResController {
	@Autowired
	private LogResService<UserModel> logResService;

	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	@ResponseBody
	public String login(UserModel user, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String code = (String) request.getSession().getAttribute(Constant.SYS_SESSION_VALIDATECODE);
		if (!code.equalsIgnoreCase(user.getCode())) {
			return "err_code";
		}
		List<UserModel> listtemp = logResService.selectAll(user);
		if (listtemp == null || listtemp.isEmpty()) {
			return "notexits"; // 返回无此用户
		}
		UserModel userTemp = listtemp.get(0); // 得到该用户信息
		request.getSession().setAttribute("user", userTemp); // 存入session

		if ("0".equals(userTemp.getIsuser())) {
			return "isseller"; // 若为卖家跳转到admin
		}
		return "ok"; // 返回登陆成功
	}

	@RequestMapping(value = "/register.do", method = RequestMethod.POST)
	@ResponseBody
	public String register(UserModel user, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String code = (String) request.getSession().getAttribute(Constant.SYS_SESSION_VALIDATECODE);
		if (!code.equalsIgnoreCase(user.getCode())) {
			return "err_code";
		}
		UserModel userTemp = new UserModel();
		userTemp.setUserName(user.getUserName());
		List<UserModel> listtemp = logResService.selectAll(userTemp);
		if (listtemp != null && !listtemp.isEmpty()) {
			return "userrep"; // 返回账号重复 userrep
		}
		logResService.insert(user);
		return "ok";
	}

	@RequestMapping(value = "/exit.do")
	public ModelAndView exit(HttpServletRequest request) {
		request.getSession().removeAttribute("user"); // 移除session
		ModelAndView m = new ModelAndView();
		m.setViewName("index");
		return m;
	}

}
