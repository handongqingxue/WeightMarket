package com.weightMarket.service;

import java.util.List;

import com.weightMarket.entity.*;

public interface ProductTypeUserService {

	int add(ProductTypeUser gpu);

	List<ProductTypeUser> selectProductTypeUserList(Boolean deal);

	int selectForInt(String userName, String phone, String createTimeStart, String createTimeEnd, Boolean deal);

	List<ProductTypeUser> selectForList(String userName, String phone, String createTimeStart, String createTimeEnd,
			Boolean deal, int page, int rows, String sort, String order);

}
