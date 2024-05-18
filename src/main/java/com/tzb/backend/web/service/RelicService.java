package com.tzb.backend.web.service;

import com.tzb.backend.admin.domain.entity.Relic;
import com.tzb.backend.web.domain.dto.RelicListDto;

import java.util.List;

/**
 * @author 29002
 */
public interface RelicService {
    List<RelicListDto> getRelic();
    Relic getRelicById(Long id);
}
