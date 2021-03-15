package com.weightMarket.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.weightMarket.entity.GetPriceUser;

public interface GetPriceUserMapper {

	int add(GetPriceUser gpu);

	List<GetPriceUser> selectGetPriceUserList(@Param("deal") Boolean deal);

}
