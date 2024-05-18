package com.tzb.backend.admin.domain.request;

import jakarta.validation.constraints.NotBlank;

public class AddArtworkRequest {
    @NotBlank(message = "手工艺术品名不能为空")
    private String name;
    private String description;
    private String image;
    @NotBlank(message = "手工艺术品类型不能为空")
    private Integer type;
    @NotBlank(message = "库存不能为空")
    private Integer stock;
    @NotBlank(message = "售价不能为空")
    private double price;
    @NotBlank(message = "用料不能为空")
    private String material;
}
