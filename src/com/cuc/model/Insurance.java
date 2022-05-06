package com.cuc.model;

public class Insurance {
	private int insuranceId;// Insurance Number
	private String insuranceName;// Insurance Name
	private float insurancePrice;// Insurance Price
	private String insuranceContent;// Insurance Content
	private int state;// Insurance available status

	public int getInsuranceId() {
		return insuranceId;
	}

	public void setInsuranceId(int insuranceId) {
		this.insuranceId = insuranceId;
	}

	public String getInsuranceName() {
		return insuranceName;
	}

	public void setInsuranceName(String insuranceName) {
		this.insuranceName = insuranceName;
	}

	public float getInsurancePrice() {
		return insurancePrice;
	}

	public void setInsurancePrice(float insurancePrice) {
		this.insurancePrice = insurancePrice;
	}

	public String getInsuranceContent() {
		return insuranceContent;
	}

	public void setInsuranceContent(String insuranceContent) {
		this.insuranceContent = insuranceContent;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

}
