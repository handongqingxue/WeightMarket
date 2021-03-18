package com.weightMarket.service;

import java.util.List;

import com.weightMarket.entity.ExampleShow;

public interface ExampleShowService {

	int selectForInt(String name);

	List<ExampleShow> selectForList(String name, int page, int rows, String sort, String order);

	int add(ExampleShow es);

	ExampleShow getById(String id);

	int edit(ExampleShow es);

	List<ExampleShow> selectList();

}
