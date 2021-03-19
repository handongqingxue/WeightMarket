package com.weightMarket.service;

import java.util.List;

import com.weightMarket.entity.*;

public interface GetPriceUserService {

	int add(GetPriceUser gpu);

	List<GetPriceUser> selectList(Boolean deal);

	int selectForInt(String userName, String phone, String createTimeStart, String createTimeEnd, String pnName, String deal);

	List<GetPriceUser> selectForList(String userName, String phone, String createTimeStart, String createTimeEnd, String pnName,
			String deal, int page, int rows, String sort, String order);

	int dealById(Boolean deal, String memo, Integer id);

}
