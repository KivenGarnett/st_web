package st.order.controller;

import java.math.BigDecimal;
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
import st.commodity.model.ComMessageModel;
import st.commodity.model.ComMessagePicModel;
import st.commodity.service.ComMessagePicService;
import st.commodity.service.ComMessageService;
import st.core.session.HtmlUtil;
import st.order.model.CartModel;
import st.order.service.CartService;
import st.user.model.UserModel;

@Controller
@RequestMapping("/car")
public class CartController {

	@Autowired
	private CartService<CartModel> cartService;
	@Autowired
	private ComMessageService<ComMessageModel> comMessageService;
	@Autowired
	private ComMessagePicService<ComMessagePicModel> comMessagePicService;

	@RequestMapping("/add.do")
	@ResponseBody
	public void add(CartModel order) throws Exception {
		cartService.insert(order);
	}

	@RequestMapping("/delete.do")
	@ResponseBody
	public void delete(CartModel order) throws Exception {
		cartService.delete(order.getId());
	}

	@RequestMapping("/update.do")
	@ResponseBody
	public void update(CartModel order) throws Exception {
		cartService.delete(order.getId());
	}

	@RequestMapping(value = "/show.do", method = RequestMethod.POST)
	@ResponseBody
	public void show(HttpServletRequest request, HttpServletResponse response) throws Exception {
		UserModel user = (UserModel) request.getSession().getAttribute("user");
		CartModel cart = new CartModel();
		cart.setUserId(user.getId());
		List<CartModel> orderList = cartService.selectAll(cart);
		List<ComMessageModel> infoList = new ArrayList<ComMessageModel>();

		for (CartModel o : orderList) {
			ComMessageModel c = new ComMessageModel();
			c.setId(o.getComId());
			List<ComMessageModel> infoListtemp = comMessageService.selectAll(c);
			ComMessageModel cc = infoListtemp.get(0);
			cc.setSellnum(o.getComNum());
			cc.setSellcomid(o.getId());
			cc.setCreateTime(o.getCreateTime());
			infoList.add(cc);
		}
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
		// 设置页面数据
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		jsonMap.put("total", 1);
		jsonMap.put("rows", infoList);
		HtmlUtil.writerJson(response, jsonMap);
	}

	@RequestMapping(value = "/account.do", method = RequestMethod.POST)
	@ResponseBody
	public String account(String str, HttpServletRequest request) throws Exception {
		UserModel user = (UserModel) request.getSession().getAttribute("user");
		CartModel cart = new CartModel();
		// cart.setUserId(user.getId());
		cart.setUserId(1);
		List<CartModel> orderList = new ArrayList<CartModel>();
		String[] arry = str.split(",");
		int len = arry.length;
		for (int i = 1; i < len; i++) {
			CartModel cartcom = cartService.selectId(Integer.parseInt(arry[i]));
			orderList.add(cartcom);
		}
		if (orderList == null || orderList.isEmpty()) {
			return "0";
		}
		BigDecimal prices = new BigDecimal("0");
		for (CartModel o : orderList) {
			ComMessageModel comtemp = comMessageService.selectId(o.getComId());
			BigDecimal price = comtemp.getComPrice();
			BigDecimal num = new BigDecimal(o.getComNum());
			prices = prices.add(price.multiply(num));
		}
		return prices.toString();
	}

	// numchange
	@RequestMapping(value = "/numchange.do", method = RequestMethod.POST)
	@ResponseBody
	public String numchange(CartModel cart, HttpServletRequest request) throws Exception {
		UserModel user = (UserModel) request.getSession().getAttribute("user");
		// cart.setUserId(user.getId());
		cart.setUserId(1);
		cartService.updateActive(cart);
		CartModel carttemp = cartService.selectId(cart);
		ComMessageModel comtemp = comMessageService.selectId(carttemp.getComId());
		BigDecimal price = comtemp.getComPrice();
		BigDecimal num = new BigDecimal(cart.getComNum());
		BigDecimal prices = price.multiply(num);
		return prices.toString();
	}
}
