package com.tzb.backend.admin.mapper;

import com.tzb.backend.admin.domain.dto.ArtworkPageDto;
import com.tzb.backend.admin.domain.entity.Artwork;
import org.mapstruct.Mapper;

import static com.tzb.backend.common.mapstruct.MapstructConstant.DEFAULT_COMPONENT_MODEL;

@Mapper(componentModel = DEFAULT_COMPONENT_MODEL)
public interface ArtworkMapper {
    ArtworkPageDto toArtworkPageDto(Artwork artwork);
}
