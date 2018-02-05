package st.commodity.controller;

import java.io.File;
import java.util.Date;
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
import st.commodity.model.ComMessagePicModel;
import st.commodity.service.ComClassifyService;
import st.commodity.service.ComMessagePicService;
import st.commodity.service.ComMessageService;
import st.core.session.HtmlUtil;

@Controller
@RequestMapping("/update")
public class ComUpdateController {
	@Autowired
	private ComMessageService<ComMessageModel> comMessageService;
	@Autowired
	private ComMessagePicService<ComMessagePicModel> comMessagePicService;

	@Autowired
	private ComClassifyService<ComClassifyModel> comClassifyService;

	@RequestMapping(value = "/insert.do", method = RequestMethod.POST)
	@ResponseBody
	public String insert(@RequestParam(value = "file", required = false) MultipartFile file, ComMessageModel com,
			HttpServletRequest request) throws Exception {
		ComMessageModel comtemp = new ComMessageModel();
		comtemp.setComCode(com.getComCode());

		List<ComMessageModel> list = comMessageService.selectAll(comtemp);

		if (list != null && !list.isEmpty()) {
			return "rep";
		}
		comMessageService.insert(com);
		String path = request.getSession().getServletContext().getRealPath("images");
		String name = file.getOriginalFilename();
		String fileType = name.substring(name.indexOf("."));
		String fileName = new Date().getTime() + fileType;
		File targetFile = new File(path, fileName);
		if (!targetFile.exists()) {
			targetFile.mkdirs();
		}
		// 保存图片
		try {
			file.transferTo(targetFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ComMessagePicModel compic = new ComMessagePicModel();
		compic.setComId(com.getId());
		String realpath = request.getContextPath() + "/images/" + fileName;
		compic.setUrla(realpath);
		comMessagePicService.insert(compic);
		return realpath;
	}

	@RequestMapping(value = "/toupdate.do", method = RequestMethod.POST) //
	@ResponseBody
	public void toupdate(String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ComMessageModel com = comMessageService.selectId(id);
		ComClassifyModel comclatemp = new ComClassifyModel();
		comclatemp.setId(Integer.parseInt(com.getComClassifyId()));

		ComClassifyModel comcla2 = comClassifyService.selectId(comclatemp);
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		ComClassifyModel comcla2temp = new ComClassifyModel();
		comcla2temp.setCode(comcla2.getParCode());

		List<ComClassifyModel> comcla1list = comClassifyService.selectAll(comcla2temp);
		if (comcla1list != null && !comcla1list.isEmpty()) {
			ComClassifyModel comcla1 = comcla1list.get(0);
			// request.getSession().setAttribute("comcla1", comcla1.getCode());
			jsonMap.put("comcla1", comcla1.getCode());
		}
		// request.getSession().setAttribute("comcla2", comcla2.getId());
		jsonMap.put("comcla2", comcla2.getId());
		ComMessagePicModel cp = new ComMessagePicModel();
		cp.setComId(com.getId());
		List<ComMessagePicModel> list = comMessagePicService.selectAll(cp);
		if (list != null && !list.isEmpty()) {
			String urla = list.get(0).getUrla();
			com.setUrla(urla);
		}
		jsonMap.put("com", com);

		HtmlUtil.writerJson(response, jsonMap);
		// request.getSession().setAttribute("com", com);
	}

	@RequestMapping(value = "/update.do", method = RequestMethod.POST) //
	@ResponseBody
	public String update(@RequestParam(value = "file", required = false) MultipartFile file, ComMessageModel com,
			HttpServletRequest request) throws Exception {
		com.setId(com.getId());
		com.setSellerId(com.getSellerId());
		com.setComStatus(com.getComStatus());
		String path = com.getUrla();
		com.setUrla(path);

		ComMessageModel comtemp = new ComMessageModel();
		comtemp.setComCode(com.getComCode());
		if (!com.getComCode().equals(com.getComCode())) {
			List<ComMessageModel> list = comMessageService.selectAll(com);
			if (list != null && !list.isEmpty()) {
				return "rep";
			}
		}
		if (file.isEmpty()) {
			comMessageService.update(com);
			return "ok";
		}
		File targetFile = new File(path);
		if (!targetFile.exists()) {
			targetFile.mkdirs();
		}
		// 保存图片
		try {
			file.transferTo(targetFile);
			System.out.println(path);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return path;
	}

}
