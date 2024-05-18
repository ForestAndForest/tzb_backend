package com.tzb.backend.web.mapper;

import com.tzb.backend.admin.domain.entity.Relic;
import com.tzb.backend.web.domain.dto.RelicListDto;
import org.mapstruct.Mapper;

import static com.tzb.backend.common.mapstruct.MapstructConstant.DEFAULT_COMPONENT_MODEL;

/**
 * @author 29002
 */
@Mapper(componentModel = DEFAULT_COMPONENT_MODEL)
public interface RelicMapper {
    RelicListDto toListDto(Relic relic);
}
