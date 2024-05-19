package com.tzb.backend.admin.domain.dto;

import lombok.Data;

@Data
public class ArtworkDto {
    private Long id;
    private String name;
    private String image;
    private Integer publisher;
    private Integer type;
    private String material;
}
