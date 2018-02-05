package st.commodity.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import st.commodity.model.ComClassifyModel;
import st.commodity.service.ComClassifyService;
import st.core.session.HtmlUtil;

@Controller
@RequestMapping("/com_cla")
public class ComClassifyController {

	@Autowired
	private ComClassifyService<ComClassifyModel> comClassifyService;

	@RequestMapping(value = "/cla.do", method = RequestMethod.POST)
	public void comClassify(HttpServletResponse response) throws Exception {

		List<ComClassifyModel> infoList = comClassifyService.selectAll(new ComClassifyModel());
		// System.out.println(infoList.get(0).getClaName());
		// 设置页面数据
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		jsonMap.put("total", 1);
		jsonMap.put("rows", infoList);
		// System.out.println(JSONUtil.toJSONString(infoList));
		HtmlUtil.writerJson(response, jsonMap);
	}

	@RequestMapping(value = "/getcla1.do")
	public void getComClassify1(ComClassifyModel comcla, HttpServletResponse response) throws Exception {
		// ComClassifyModel comcla = new ComClassifyModel();
		comcla.setParCode("0");
		List<ComClassifyModel> infoList = comClassifyService.selectAll(comcla);
		// 设置页面数据
		HtmlUtil.writerJson(response, infoList);
	}

	@RequestMapping(value = "/getcla2.do")
	public void getComClassify2(ComClassifyModel com, HttpServletResponse response) throws Exception {

		List<ComClassifyModel> infoList = comClassifyService.selectAll(com);
		// 设置页面数据
		HtmlUtil.writerJson(response, infoList);
	}
	

}
