package st.commodity.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import st.commodity.model.ComMessageModel;
import st.commodity.model.ComMessagePicModel;
import st.commodity.service.ComMessagePicService;
import st.commodity.service.ComMessageService;
import st.core.session.HtmlUtil;

@Controller
@RequestMapping("/search")
public class ComSearchController {

	@Autowired
	private ComMessageService<ComMessageModel> comMessageService;
	@Autowired
	private ComMessagePicService<ComMessagePicModel> comMessagePicService;

	@RequestMapping(value = "/tosearch.do", method = RequestMethod.POST)
	@ResponseBody
	public String tosearch1(String comName, HttpServletRequest request) {
		request.getSession().setAttribute("comName", comName);
		return "ok";
	}

	@RequestMapping(value = "/bycomName.do", method = RequestMethod.POST)
	@ResponseBody
	public void comsearch(ComMessageModel com, HttpServletResponse response) throws Exception {
		List<ComMessageModel> infoList = comMessageService.selectModel(com);
		List<ComMessageModel> listtemp = this.comAndPic(infoList);
		// 设置页面数据
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		jsonMap.put("total", com.getPager().getRowCount());
		jsonMap.put("rows", listtemp);
		HtmlUtil.writerJson(response, jsonMap);
	}

	// /search/show.do?comCode

	@RequestMapping(value = "/show.do")
	public ModelAndView comshow(ComMessageModel com, HttpServletResponse response) throws Exception {
		List<ComMessageModel> infoList = comMessageService.selectAll(com);
		List<ComMessageModel> listtemp = this.comAndPic(infoList);
		// 设置页面数据
		ModelAndView m = new ModelAndView();
		m.setViewName("introduction");
		m.addObject("com", listtemp.get(0));

		// Map<String, Object> jsonMap = new HashMap<>();
		// jsonMap.put("total", total);
		// jsonMap.put("rows", listtemp);
		// HtmlUtil.writerJson(response, jsonMap);
		return m;
	}

	@RequestMapping(value = "/clashow.do")
	public ModelAndView tosearch2(String comClassifyId, String claName, HttpServletRequest request) {
		ModelAndView m = new ModelAndView();
		m.setViewName("search");
		m.addObject("comName", claName);
		return m;
	}

	@RequestMapping(value = "/bycomClassifyId.do")
	@ResponseBody
	public void comcla(ComMessageModel com, HttpServletResponse response) throws Exception {
		List<ComMessageModel> infoList = comMessageService.selectAll(com);
		List<ComMessageModel> listtemp = this.comAndPic(infoList);
		// 设置页面数据
		int total = comMessageService.selectCount(new ComMessageModel());
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		jsonMap.put("total", total);
		jsonMap.put("rows", listtemp);
		HtmlUtil.writerJson(response, jsonMap);
	}

	public List<ComMessageModel> comAndPic(List<ComMessageModel> infoList) throws Exception {
		List<ComMessageModel> listtemp = new ArrayList<ComMessageModel>();
		int length = infoList.size();
		for (int i = 0; i < length; i++) { // 根据商品id找到该商品的图片信息
			ComMessageModel c = infoList.get(i);
			ComMessagePicModel cp = new ComMessagePicModel();
			cp.setComId(c.getId());
			List<ComMessagePicModel> list = comMessagePicService.selectAll(cp);
			if (list != null && !list.isEmpty()) {
				c.setUrla(list.get(0).getUrla());
			}
			listtemp.add(c);
		}
		return listtemp;
	}

}
