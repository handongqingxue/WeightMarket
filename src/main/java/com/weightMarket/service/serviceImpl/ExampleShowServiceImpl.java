package com.weightMarket.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weightMarket.dao.*;
import com.weightMarket.entity.*;
import com.weightMarket.service.*;

@Service
public class ExampleShowServiceImpl implements ExampleShowService {

	@Autowired
	private ExampleShowMapper exampleShowDao;
	
	public int selectForInt(String name) {
		// TODO Auto-generated method stub
		return exampleShowDao.selectForInt(name);
	}

	public List<ExampleShow> selectForList(String name, int page, int rows, String sort, String order) {
		// TODO Auto-generated method stub
		return exampleShowDao.selectForList(name, (page-1)*rows, rows, sort, order);
	}

	public int add(ExampleShow es) {
		// TODO Auto-generated method stub
		return exampleShowDao.add(es);
	}

	public ExampleShow getById(String id) {
		// TODO Auto-generated method stub
		return exampleShowDao.getById(id);
	}

	public int edit(ExampleShow es) {
		// TODO Auto-generated method stub
		return exampleShowDao.edit(es);
	}

}
