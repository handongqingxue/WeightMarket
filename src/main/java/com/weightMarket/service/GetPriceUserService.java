package com.weightMarket.service;

import java.util.List;

import com.weightMarket.entity.GetPriceUser;

public interface GetPriceUserService {

	int add(GetPriceUser gpu);

	List<GetPriceUser> selectGetPriceUserList(Boolean deal);

}
