package com.demoweb.dto;

import lombok.Data;

@Data
public class AppSetting {
	
	private String settingName;
	private String settingValue;
			
	public AppSetting() {}
	public AppSetting(String settingName, String settingValue) {	
		this.settingName = settingName;
		this.settingValue = settingValue;
	}
	
}
