package com.weightMarket.dao;

import com.weightMarket.entity.SystemInfo;

public interface SystemInfoMapper {

	int add(SystemInfo si);
	
	int edit(SystemInfo si);

	int getCount();

	SystemInfo get();

}
