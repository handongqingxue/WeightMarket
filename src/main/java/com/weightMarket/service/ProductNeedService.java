package com.weightMarket.service;

import java.util.List;

import com.weightMarket.entity.ProductNeed;

public interface ProductNeedService {

	int selectForInt(String name);

	List<ProductNeed> selectForList(String name, int page, int rows, String sort, String order);

	int add(ProductNeed pn);

	List<ProductNeed> selectList();

	ProductNeed getById(String id);

	int edit(ProductNeed pn);

}
