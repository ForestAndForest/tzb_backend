package com.tzb.backend.admin.domain.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
public class ArtworkPageDto {
    private Long id;
    private String name;
    private String image;
    private String publisher;
    private Integer publisherId;
    private String material;
    private Integer type;
    private Integer state;
    private String description;
    private Integer stock;
    private double price;
}
