package com.weightMarket.service.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weightMarket.dao.*;
import com.weightMarket.entity.*;
import com.weightMarket.service.*;

@Service
public class SystemInfoServiceImpl implements SystemInfoService {

	@Autowired
	private SystemInfoMapper systemInfoDao;
	
	public int edit(SystemInfo si) {
		// TODO Auto-generated method stub
		return 0;
	}

}
