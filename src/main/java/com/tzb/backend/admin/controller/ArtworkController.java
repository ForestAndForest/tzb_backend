package com.tzb.backend.admin.controller;

import com.tzb.backend.admin.domain.request.artwork.AddArtworkRequest;
import com.tzb.backend.admin.domain.request.artwork.ArtworkPageRequest;
import com.tzb.backend.admin.domain.request.artwork.UpdateArtworkRequest;
import com.tzb.backend.admin.mapper.ArtworkMapper;
import com.tzb.backend.admin.service.ArtworkService;
import com.tzb.backend.common.annotation.ResultWrapper;
import com.tzb.backend.common.auth.RoleType;
import com.tzb.backend.common.auth.Roles;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@ResultWrapper
@CrossOrigin
@RestController()
@RequestMapping("/artwork")
@RequiredArgsConstructor
@Tag(name = "手工艺术品管理")
public class ArtworkController {
    private final ArtworkService artworkService;

    /**
     * 添加手工艺术品
     *
     * @return R
     */

    @Operation(summary = "添加")
    @PostMapping
    @Roles(RoleType.SUPER_ADMIN)
    public Object addArtwork(@RequestBody @Validated AddArtworkRequest request) {
        artworkService.addArtwork(request);
        return null;
    }
    /**
     * 分页查询
     *
     * @return R
     */

    @Operation(summary = "查询")
    @GetMapping("/page")
    public Object findPagination(ArtworkPageRequest request) {
        return artworkService.queryPage(request);
    }
    @PutMapping
    @Roles(RoleType.SUPER_ADMIN)
    public Object update(@RequestBody @Validated UpdateArtworkRequest request) {
        artworkService.updateArtwork(request);
        return null;
    }
    @DeleteMapping("{id}")
    @Roles(RoleType.SUPER_ADMIN)
    public Object delete(@PathVariable Long id) {
        artworkService.delete(id);
        return null;
    }

}
