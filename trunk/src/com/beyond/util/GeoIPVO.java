package com.beyond.util;

import java.io.Serializable;

public class GeoIPVO implements Serializable {

	private static final long serialVersionUID = -6519575874974295843L;

	private String country;
	private String province;
	private String ip;
	private String city;
	private String longitude;
	private String latitude;
	
	public GeoIPVO(String geoStr){
		//http://api.geoio.com/q.php?key=LVLGKQjapauj5YpK&qt=geoip&d=pipe&q=188.222.201.58
		//-|-|United Kingdom|European Regional Registry|54.15|-4.473
		String[] geo=geoStr.split(",");
		this.country=geo[2];
		this.province=geo[3];
		this.longitude=geo[4];
		this.latitude=geo[5];
	}
	
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("GeoIPVO [city=");
		builder.append(city);
		builder.append(", country=");
		builder.append(country);
		builder.append(", ip=");
		builder.append(ip);
		builder.append(", latitude=");
		builder.append(latitude);
		builder.append(", longitude=");
		builder.append(longitude);
		builder.append(", province=");
		builder.append(province);
		builder.append("]");
		return builder.toString();
	} 
}
