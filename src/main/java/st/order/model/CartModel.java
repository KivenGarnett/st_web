package st.order.model;

import st.core.model.BaseModel;

public class CartModel extends BaseModel {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Integer comId;
	private Integer userId;
	private Integer comNum;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getComId() {
		return comId;
	}

	public void setComId(Integer comId) {
		this.comId = comId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getComNum() {
		return comNum;
	}

	public void setComNum(Integer comNum) {
		this.comNum = comNum;
	}

}
