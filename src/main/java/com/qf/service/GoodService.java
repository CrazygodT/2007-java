package com.qf.service;

import com.qf.pojo.Good;
import com.qf.pojo.GoodsType;

import java.util.List;

public interface GoodService {

    List findAll();

    GoodsType findById(Integer id);

    Integer update(Good good);

    Integer delete(Integer id);

    Integer insert(Good good);

}
