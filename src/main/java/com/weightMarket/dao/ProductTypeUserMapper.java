package com.weightMarket.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.weightMarket.entity.*;

public interface ProductTypeUserMapper {

	int add(ProductTypeUser gpu);

	List<ProductTypeUser> selectProductTypeUserList(@Param("deal") Boolean deal);

}
