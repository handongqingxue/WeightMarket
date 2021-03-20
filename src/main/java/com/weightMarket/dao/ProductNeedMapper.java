package com.weightMarket.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.weightMarket.entity.ProductNeed;

public interface ProductNeedMapper {

	int selectForInt(@Param("name") String name);

	List<ProductNeed> selectForList(@Param("name")String name, @Param("start")int start, @Param("rows")int rows, String sort, String order);

	int add(ProductNeed pn);

	List<ProductNeed> selectList();

	ProductNeed getById(@Param("id") String id);

	int edit(ProductNeed pn);

}
