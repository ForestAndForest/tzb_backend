package com.tzb.backend.web.service;

import com.tzb.backend.admin.domain.entity.Relic;
import com.tzb.backend.admin.domain.request.relic.AddRelicRequest;
import com.tzb.backend.admin.domain.request.relic.RelicPageRequest;
import com.tzb.backend.admin.domain.request.relic.UpdateRelicRequest;
import com.tzb.backend.web.domain.dto.RelicListDto;

import java.util.List;

/**
 * @author 29002
 */
public interface RelicService {
    List<RelicListDto> getRelic();
    Relic getRelicById(Long id);

    void addRelic(AddRelicRequest request);

    Object queryPage(RelicPageRequest request);

    void updateRelic(UpdateRelicRequest request);

    void deleteRelic(Long id);

    Object findRelicArtwork(Long id);
}
