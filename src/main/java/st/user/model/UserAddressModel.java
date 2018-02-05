package st.user.model;

import st.core.model.BaseModel;

public class UserAddressModel extends BaseModel {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Integer userId;
	private String userName;
	private String userTel;
	private String userSheng;
	private String userShi;
	private String userQu;
	private String userAddress;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserTel() {
		return userTel;
	}

	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}

	public String getUserSheng() {
		return userSheng;
	}

	public void setUserSheng(String userSheng) {
		this.userSheng = userSheng;
	}

	public String getUserShi() {
		return userShi;
	}

	public void setUserShi(String userShi) {
		this.userShi = userShi;
	}

	public String getUserQu() {
		return userQu;
	}

	public void setUserQu(String userQu) {
		this.userQu = userQu;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

}
