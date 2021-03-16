package com.weightMarket.service;

import java.util.List;

import com.weightMarket.entity.*;

public interface GetPriceUserService {

	int add(GetPriceUser gpu);

	List<GetPriceUser> selectGetPriceUserList(Boolean deal);

	int selectForInt(String userName, String phone, String createTimeStart, String createTimeEnd, String pnName, Boolean deal);

	List<GetPriceUser> selectForList(String userName, String phone, String createTimeStart, String createTimeEnd, String pnName,
			Boolean deal, int page, int rows, String sort, String order);

}
