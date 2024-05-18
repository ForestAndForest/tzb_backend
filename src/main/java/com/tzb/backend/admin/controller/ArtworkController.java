package com.tzb.backend.admin.controller;

import com.tzb.backend.admin.domain.entity.Artwork;
import com.tzb.backend.admin.domain.request.AddArtworkRequest;
import com.tzb.backend.admin.domain.request.ArtworkPageRequest;
import com.tzb.backend.admin.domain.request.UserPageRequest;
import com.tzb.backend.admin.mapper.ArtworkMapper;
import com.tzb.backend.admin.service.ArtworkService;
import com.tzb.backend.common.annotation.ResultWrapper;
import com.tzb.backend.common.auth.RoleType;
import com.tzb.backend.common.auth.Roles;
import com.tzb.backend.pms.domain.request.CreateRoleRequest;
import com.tzb.backend.pms.domain.request.RolePageRequest;
import com.tzb.backend.pms.mapper.RoleMapper;
import com.tzb.backend.pms.service.RoleService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Pageable;
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
    private final ArtworkMapper artworkMapper;

    /**
     * 添加手工艺术品
     *
     * @return R
     */
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

}
