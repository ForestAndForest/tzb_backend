package com.tzb.backend.admin.domain.request.relic;

import com.tzb.backend.common.request.MyPageRequest;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
public class RelicPageRequest extends MyPageRequest {
    private String name;
    private String material;
    private String value;
}
