package com.weightMarket.service.serviceImpl;

import java.util.List;

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

	public List<GetPriceUser> selectGetPriceUserList(Boolean deal) {
		// TODO Auto-generated method stub
		List<GetPriceUser> gpuList = getPriceUserDao.selectGetPriceUserList(deal);
		for (GetPriceUser getPriceUser : gpuList) {
			Integer secondAgo = getPriceUser.getSecondAgo();
			String timeAgo=null;
			if(secondAgo>86400) {
				timeAgo=secondAgo/86400+"��ǰ";
			}
			else if(secondAgo>3600) {
				timeAgo=secondAgo/3600+"Сʱǰ";
			}
			else if(secondAgo>60) {
				timeAgo=secondAgo/60+"����ǰ";
			}
			else {
				timeAgo=secondAgo+"��ǰ";
			}
			getPriceUser.setTimeAgo(timeAgo);
		}
		return gpuList;
	}

}
