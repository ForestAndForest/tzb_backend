package com.tzb.backend.admin.domain.request.artwork;

import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
public class DeleteArtworkRequest {
    @NotNull(message="id不能为空")
    private Long id;
}
