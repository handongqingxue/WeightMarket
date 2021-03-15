package com.weightMarket.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weightMarket.dao.*;
import com.weightMarket.entity.*;
import com.weightMarket.service.*;

@Service
public class ProductTypeUserServiceImpl implements ProductTypeUserService {

	@Autowired
	private ProductTypeUserMapper productTypeUserDao;
	
	public int add(ProductTypeUser gpu) {
		// TODO Auto-generated method stub
		return productTypeUserDao.add(gpu);
	}

	public List<ProductTypeUser> selectProductTypeUserList(Boolean deal) {
		// TODO Auto-generated method stub
		List<ProductTypeUser> ptuList = productTypeUserDao.selectProductTypeUserList(deal);
		for (ProductTypeUser productTypeUser : ptuList) {
			Integer secondAgo = productTypeUser.getSecondAgo();
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
			productTypeUser.setTimeAgo(timeAgo);
		}
		return ptuList;
	}

}
