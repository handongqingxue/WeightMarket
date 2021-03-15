package com.weightMarket.service.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weightMarket.dao.*;
import com.weightMarket.entity.*;
import com.weightMarket.service.*;

@Service
public class GetPriceUserServiceImpl implements GetPriceUserService {

	@Autowired
	private GetPriceUserMapper getPriceUserDao;
	
	public int add(GetPriceUser gpu) {
		// TODO Auto-generated method stub
		return getPriceUserDao.add(gpu);
	}

}
