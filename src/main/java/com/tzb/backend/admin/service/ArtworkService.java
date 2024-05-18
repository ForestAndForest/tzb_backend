package com.tzb.backend.admin.service;

import com.tzb.backend.admin.controller.ArtworkController;
import com.tzb.backend.admin.domain.request.AddArtworkRequest;
import com.tzb.backend.admin.domain.request.ArtworkPageRequest;
import com.tzb.backend.common.core.PageResponse;
import com.tzb.backend.pms.domain.request.CreateRoleRequest;

import java.util.List;

public interface ArtworkService {
    void addArtwork(AddArtworkRequest request);

    PageResponse queryPage(ArtworkPageRequest request);
}
