package com.tzb.backend.admin.service;

import com.tzb.backend.admin.domain.request.artwork.ArtworkPageRequest;
import com.tzb.backend.admin.domain.request.artwork.AddArtworkRequest;
import com.tzb.backend.admin.domain.request.artwork.UpdateArtworkRequest;
import com.tzb.backend.common.core.PageResponse;

public interface ArtworkService {
    void addArtwork(AddArtworkRequest request);

    PageResponse queryPage(ArtworkPageRequest request);

    void updateArtwork( UpdateArtworkRequest request);

    void delete(Long id);
}
