package com.tzb.backend.admin.domain.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Setter
@Getter
@Entity
@Table(name = "artwork")
public class Artwork {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String description;
    private String image;
    @Column(name = "publisher")
    private Integer publisherId;
    private Integer type;
    private Integer stock;
    private double price;
    private String material;
    @Column(name = "create_time",nullable = false,updatable = false)
    private LocalDateTime creteTime;
    @Column(name = "update_time")
    private LocalDateTime updateTime;
    @Column(name = "is_sold_out")
    private Boolean isSoldOut=false;
    private Integer state=3;
    @Column(name = "page_view")
    private Integer pageView=0;

    public Artwork(){
        this.creteTime = LocalDateTime.now();
        this.updateTime = LocalDateTime.now();
    }
}
