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
				timeAgo=secondAgo/86400+"天前";
			}
			else if(secondAgo>3600) {
				timeAgo=secondAgo/3600+"小时前";
			}
			else if(secondAgo>60) {
				timeAgo=secondAgo/60+"分钟前";
			}
			else {
				timeAgo=secondAgo+"秒前";
			}
			productTypeUser.setTimeAgo(timeAgo);
		}
		return ptuList;
	}

	public int selectForInt(String userName, String phone, String createTimeStart, String createTimeEnd, Boolean deal) {
		// TODO Auto-generated method stub
		return productTypeUserDao.selectForInt(userName, phone, createTimeStart, createTimeEnd, deal);
	}

	public List<ProductTypeUser> selectForList(String userName, String phone, String createTimeStart,
			String createTimeEnd, Boolean deal, int page, int rows, String sort, String order) {
		// TODO Auto-generated method stub
		return productTypeUserDao.selectForList(userName, phone, createTimeStart, createTimeEnd, deal, (page-1)*rows, rows, sort, order);
	}

}
