package com.tzb.backend.admin.domain.dto;

import lombok.Data;

@Data
public class ArtworkPageDto {
    private Long id;
    private String name;
    private String image;
    private String publisher;
    private String material;
    private Integer type;
    private Integer state;
}
