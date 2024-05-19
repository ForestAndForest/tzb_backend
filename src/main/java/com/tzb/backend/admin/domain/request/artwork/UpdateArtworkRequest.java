package com.tzb.backend.admin.domain.request.artwork;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
public class UpdateArtworkRequest {
    private Long id;
    private String publisher;
    private Integer publisherId;
    private String name;
    private String description;
    private String image;
    private Integer type;
    private Integer stock;
    private double price;
    private String material;
}
