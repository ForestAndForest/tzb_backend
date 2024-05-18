package com.tzb.backend.web.service.impl;

import com.tzb.backend.admin.domain.entity.Relic;
import com.tzb.backend.web.domain.dto.RelicListDto;
import com.tzb.backend.web.mapper.RelicMapper;
import com.tzb.backend.web.repository.RelicRepository;
import com.tzb.backend.web.service.RelicService;
import lombok.RequiredArgsConstructor;
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

    @Override
    public List<RelicListDto> getRelic() {
        return relicRepository.findAllBy().stream().map(relicMapper::toListDto).toList();
    }

    @Override
    public Relic getRelicById(Long id) {
        return relicRepository.findRelicById(id);
    }
}
