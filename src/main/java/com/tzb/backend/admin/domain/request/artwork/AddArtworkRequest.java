package com.tzb.backend.admin.domain.request.artwork;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
public class AddArtworkRequest {
    private Integer publisher;
    @NotBlank(message = "手工艺术品名不能为空")
    private String name;
    private String description;
    private String image;
    @NotNull(message = "手工艺术品类型不能为空")
    private Integer type;
    @NotNull(message = "库存不能为空")
    private Integer stock;
    @NotNull(message = "售价不能为空")
    private double price;
    @NotBlank(message = "用料不能为空")
    private String material;
}
