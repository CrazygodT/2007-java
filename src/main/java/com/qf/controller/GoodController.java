package com.qf.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.qf.common.BaseResp;
import com.qf.pojo.Good;
import com.qf.pojo.GoodsType;
import com.qf.service.GoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/good")
public class GoodController {

    @Autowired
    GoodService goodService;

    @RequestMapping("/findAll")
    public BaseResp findAll(Integer page,Integer limit){
        PageHelper.startPage(page,limit);
        List all = goodService.findAll();
        PageInfo info = new PageInfo(all);
        BaseResp baseResp = new BaseResp();
        baseResp.setCode(0);
        baseResp.setData(all);
        baseResp.setCount(info.getTotal());
        return baseResp;
    }

    @RequestMapping("/findById")
    public GoodsType findById(Integer id){
        GoodsType goodsType = goodService.findById(id);
        //System.out.println("goodsType = " + goodsType);
        return goodsType;

    }


    @RequestMapping(value = "/update",method = RequestMethod.POST)
    public Integer update(@RequestBody Good good){
        return goodService.update(good);
    }


    @RequestMapping(value = "/delete",method = RequestMethod.POST)
    public Integer delete(Integer id){
        return goodService.delete(id);

    }
    @RequestMapping(value = "/insert",method = RequestMethod.POST)
    public Integer insert(Good good){
        return goodService.insert(good);
    }





}
