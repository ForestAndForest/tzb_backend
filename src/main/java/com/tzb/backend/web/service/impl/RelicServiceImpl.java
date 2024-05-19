package com.tzb.backend.web.service.impl;

import com.tzb.backend.admin.domain.dto.ArtworkPageDto;
import com.tzb.backend.admin.domain.dto.RelicPageDto;
import com.tzb.backend.admin.domain.entity.Artwork;
import com.tzb.backend.admin.domain.entity.Relic;
import com.tzb.backend.admin.domain.request.relic.AddRelicRequest;
import com.tzb.backend.admin.domain.request.relic.RelicPageRequest;
import com.tzb.backend.admin.domain.request.relic.UpdateRelicRequest;
import com.tzb.backend.admin.repository.spc.RelicSpecifications;
import com.tzb.backend.common.core.PageResponse;
import com.tzb.backend.web.domain.dto.RelicListDto;
import com.tzb.backend.web.mapper.RelicMapper;
import com.tzb.backend.web.repository.RelicRepository;
import com.tzb.backend.web.service.RelicService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 29002
 */
@Service
@RequiredArgsConstructor
public class RelicServiceImpl implements RelicService {

    private final RelicRepository relicRepository;
    private final RelicMapper relicMapper;
    private final RelicSpecifications relicSpecifications;

    @Override
    public List<RelicListDto> getRelic() {
        return relicRepository.findAllBy().stream().map(relicMapper::toListDto).toList();
    }

    @Override
    public Relic getRelicById(Long id) {
        return relicRepository.findRelicById(id);
    }

    @Override
    public void addRelic(AddRelicRequest request) {

    }

    @Override
    public Object queryPage(RelicPageRequest request) {
        Pageable pageable = request.toPageable();
        Specification<Relic> spec = relicSpecifications.searchRelic(
                request.getName(),
                request.getMaterial(),
                request.getValue());
        Page<Relic> relicPage = relicRepository.findAll(spec, pageable);
        List<RelicPageDto> relicPageDtoList = relicPage.getContent().stream().map(relicMapper::toRelicPageDto).toList();
        long total = relicRepository.count(spec);

        return new PageResponse(relicPageDtoList, total);

    }

    @Override
    public void updateRelic(UpdateRelicRequest request) {

    }

    @Override
    public void deleteRelic(Long id) {

    }

    @Override
    public Object findRelicArtwork(Long id) {
        return null;
    }
}
