package com.tzb.backend.admin.controller;

import com.tzb.backend.admin.domain.request.artwork.AddArtworkRequest;
import com.tzb.backend.admin.domain.request.artwork.ArtworkPageRequest;
import com.tzb.backend.admin.domain.request.artwork.UpdateArtworkRequest;
import com.tzb.backend.admin.domain.request.relic.AddRelicRequest;
import com.tzb.backend.admin.domain.request.relic.RelicPageRequest;
import com.tzb.backend.admin.domain.request.relic.UpdateRelicRequest;
import com.tzb.backend.admin.service.ArtworkService;
import com.tzb.backend.common.annotation.ResultWrapper;
import com.tzb.backend.common.auth.RoleType;
import com.tzb.backend.common.auth.Roles;
import com.tzb.backend.web.service.RelicService;
import io.swagger.v3.oas.annotations.Operation;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@ResultWrapper
@CrossOrigin
@RequiredArgsConstructor
@RequestMapping("/relic")
@RestController
public class RelicController {

    private final RelicService relicService;

    @Operation(summary = "添加")
    @PostMapping
    @Roles(RoleType.SUPER_ADMIN)
    public Object addRelic(@RequestBody @Validated AddRelicRequest request) {
        relicService.addRelic(request);
        return null;
    }
    /**
     * 分页查询
     *
     * @return R
     */

    @Operation(summary = "查询")
    @GetMapping("/page")
    public Object findPagination(RelicPageRequest request) {
        return relicService.queryPage(request);
    }
    @PutMapping
    @Roles(RoleType.SUPER_ADMIN)
    public Object updateRelic(@RequestBody @Validated UpdateRelicRequest request) {
        relicService.updateRelic(request);
        return null;
    }
    @DeleteMapping("{id}")
    @Roles(RoleType.SUPER_ADMIN)
    public Object deleteRelic(@PathVariable Long id) {
        relicService.deleteRelic(id);
        return null;
    }
    /**
     * 查询角色权限
     *
     * @return R
     */
    @GetMapping("/artwork")
    public Object findRelicArtwork(Long id) {
        return relicService.findRelicArtwork(id);
    }


}
