package com.weightMarket.service;

import java.util.List;

import com.weightMarket.entity.*;

public interface ProductTypeUserService {

	int add(ProductTypeUser gpu);

	List<ProductTypeUser> selectProductTypeUserList(Boolean deal);

}
