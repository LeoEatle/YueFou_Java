package com.leoeatle.entity;

public class Address extends idEntity {
	private String city;
	private String country;


	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}
	//返回该地址的字符串形式
	public String toString()
	{
		return ""+this.city+", "+this.country;
	}

		
}
