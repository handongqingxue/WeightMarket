package com.weightMarket.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weightMarket.dao.*;
import com.weightMarket.entity.ProductNeed;
import com.weightMarket.service.*;

@Service
public class ProductNeedServiceImpl implements ProductNeedService {

	@Autowired
	private ProductNeedMapper productNeedDao;
	
	public int selectForInt(String name) {
		// TODO Auto-generated method stub
		return productNeedDao.selectForInt(name);
	}

	public List<ProductNeed> selectForList(String name, int page, int rows, String sort, String order) {
		// TODO Auto-generated method stub
		return productNeedDao.selectForList(name,(page-1)*rows, rows, sort, order);
	}

	public int add(ProductNeed pn) {
		// TODO Auto-generated method stub
		return productNeedDao.add(pn);
	}

	public List<ProductNeed> selectList() {
		// TODO Auto-generated method stub
		return productNeedDao.selectList();
	}

	public ProductNeed getById(String id) {
		// TODO Auto-generated method stub
		return productNeedDao.getById(id);
	}

	public int edit(ProductNeed pn) {
		// TODO Auto-generated method stub
		return productNeedDao.edit(pn);
	}

}
