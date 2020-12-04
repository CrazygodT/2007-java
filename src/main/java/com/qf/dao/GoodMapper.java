package com.qf.dao;


import com.qf.pojo.Good;
import com.qf.pojo.GoodsType;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GoodMapper {

    List findAll();

    GoodsType findById(Integer id);

    Integer update(Good good);

    Integer delete(Integer id);

    Integer insert(Good good);
}
