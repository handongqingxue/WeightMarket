package com.weightMarket.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.weightMarket.entity.*;

public interface ProductTypeUserMapper {

	int add(ProductTypeUser gpu);

	List<ProductTypeUser> selectProductTypeUserList(@Param("deal") Boolean deal);

	int selectForInt(@Param("userName") String userName, @Param("phone") String phone, @Param("createTimeStart") String createTimeStart, 
			@Param("createTimeEnd") String createTimeEnd, @Param("deal") Boolean deal);

	List<ProductTypeUser> selectForList(@Param("userName") String userName, @Param("phone") String phone, @Param("createTimeStart") String createTimeStart, 
			@Param("createTimeEnd") String createTimeEnd, @Param("deal") Boolean deal, @Param("start") int start, @Param("rows") int rows, String sort, String order);

}
