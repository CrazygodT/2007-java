package com.qf.pojo;


import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
public class GoodsType {

    private Integer id;
    private String goodsName;
    private Double price;
    private Integer score;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date deployDate;
    private String imgPath;
    private String comment;
    private Integer typeId;
    private String typename;
    private Integer level;
    private Integer pid;

}
