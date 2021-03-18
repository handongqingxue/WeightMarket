package com.weightMarket.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.weightMarket.entity.ExampleShow;

public interface ExampleShowMapper {

	int selectForInt(@Param("name") String name);

	List<ExampleShow> selectForList(@Param("name") String name, @Param("start") int start, @Param("rows") int rows, 
			@Param("sort") String sort, @Param("order") String order);

	int add(ExampleShow es);

	ExampleShow getById(@Param("id") String id);

	int edit(ExampleShow es);

	List<ExampleShow> selectList();

}
