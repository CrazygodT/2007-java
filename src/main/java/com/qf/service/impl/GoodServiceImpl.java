package com.qf.service.impl;

import com.qf.dao.GoodMapper;
import com.qf.pojo.Good;
import com.qf.pojo.GoodsType;
import com.qf.service.GoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GoodServiceImpl implements GoodService {
    @Autowired
    GoodMapper goodMapper;

    @Override
    public List findAll() {

        return goodMapper.findAll();
    }

    @Override
    public GoodsType findById(Integer id) {

        return goodMapper.findById(id);
    }

    @Override
    public Integer update(Good good) {

        return goodMapper.update(good);
    }

    @Override
    public Integer delete(Integer id) {
        return goodMapper.delete(id);
    }

    @Override
    public Integer insert(Good good) {
        return goodMapper.insert(good);
    }
}
