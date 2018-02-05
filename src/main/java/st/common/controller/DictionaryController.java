package st.common.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import st.common.model.DictionaryModel;
import st.common.service.DictionaryService;
import st.core.session.HtmlUtil;
import st.user.model.UserAddressModel;

@Controller
@RequestMapping("/dictionary")
public class DictionaryController {
	@Autowired
	private DictionaryService<DictionaryModel> dictionaryService;
	
	@RequestMapping(value = "/getadd1.do", method = RequestMethod.POST)
	public void getDictionary1(DictionaryModel address, HttpServletResponse response) throws Exception {
		// ComClassifyModel comcla = new ComClassifyModel();
		address.setParentCode("0");
		List<DictionaryModel> infoList = dictionaryService.selectAll(address);
		// 设置页面数据
		HtmlUtil.writerJson(response, infoList);
	}

	@RequestMapping(value = "/getadd2.do")
	public void getDictionary2(DictionaryModel com, HttpServletResponse response) throws Exception {
		List<DictionaryModel> infoList = dictionaryService.selectAll(com);
		// 设置页面数据
		HtmlUtil.writerJson(response, infoList);
	}
	
	@RequestMapping(value = "/getadd3.do")
	public void getDictionary3(DictionaryModel com, HttpServletResponse response) throws Exception {

		List<DictionaryModel> infoList = dictionaryService.selectAll(com);
		// 设置页面数据
		HtmlUtil.writerJson(response, infoList);
	}
}
