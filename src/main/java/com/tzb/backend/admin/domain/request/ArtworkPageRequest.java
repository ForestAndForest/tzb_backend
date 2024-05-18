package com.tzb.backend.admin.domain.request;

import com.tzb.backend.common.request.MyPageRequest;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
public class ArtworkPageRequest extends MyPageRequest {
    private String name;
    private String material;
    private Integer type;
    private Integer publisher;
    private Integer state;
}
