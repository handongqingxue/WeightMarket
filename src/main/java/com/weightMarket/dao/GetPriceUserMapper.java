package com.weightMarket.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.weightMarket.entity.GetPriceUser;

public interface GetPriceUserMapper {

	int add(GetPriceUser gpu);

	List<GetPriceUser> selectGetPriceUserList(@Param("deal") Boolean deal);

	int selectForInt(@Param("userName") String userName, @Param("phone") String phone, @Param("createTimeStart") String createTimeStart, 
			@Param("createTimeEnd") String createTimeEnd, @Param("pnName") String pnName, @Param("deal") Boolean deal);

	List<GetPriceUser> selectForList(@Param("userName") String userName, @Param("phone") String phone, @Param("createTimeStart") String createTimeStart, 
			@Param("createTimeEnd") String createTimeEnd, @Param("pnName") String pnName, @Param("deal") Boolean deal, @Param("start") int start, 
			@Param("rows") int rows, @Param("sort") String sort, @Param("order") String order);

}
