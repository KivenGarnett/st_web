package st.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import st.commodity.model.ComClassifyModel;
import st.commodity.model.ComMessageModel;
import st.core.session.HtmlUtil;
import st.core.session.JSONUtil;
import st.user.model.UserAddressModel;
import st.user.model.UserModel;
import st.user.service.AddressService;

@Controller
@RequestMapping("/address")
public class AddressController {
	@Autowired
	private AddressService<UserAddressModel> addressService;

	@RequestMapping(value = "/show.do", method = RequestMethod.POST)
	@ResponseBody
	public void show(HttpServletRequest request, HttpServletResponse response) throws Exception {
		UserModel user = (UserModel) request.getSession().getAttribute("user");
		UserAddressModel useradd = new UserAddressModel();
		// useradd.setUserId(user.getId());
//		useradd.setUserId(user.getId());
		List<UserAddressModel> addlist = addressService.selectAll(useradd);
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		jsonMap.put("rows", addlist);
//		System.out.println(JSONUtil.toJSONString(jsonMap));
		HtmlUtil.writerJson(response, jsonMap);
	}

	@RequestMapping(value = "/insert.do", method = RequestMethod.POST)
	@ResponseBody
	public String insert( UserAddressModel add,HttpServletRequest request) throws Exception {
		
		UserModel userid=(UserModel) request.getSession().getAttribute("user");  //从session里获得
		
		add.setUserId(userid.getId());
		
		List<UserAddressModel> list = addressService.selectAll(add);
		
		if (list != null && !list.isEmpty()) {
			return "rep";
		}
		
		addressService.insert(add);
		
		return "ok";
	}
}
