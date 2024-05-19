package com.tzb.backend.admin.domain.dto;

import lombok.Data;

@Data
public class RelicPageDto {
    private Long id;    //文物ID
    private String name;    //文物名称
    private  String image;   //图片
    private String era;     //年代
    private String material;    //材质
    private double weight;     //重量
    private double width;     //宽度
    private double height;      //高度
    private double depth;    //深度


}
