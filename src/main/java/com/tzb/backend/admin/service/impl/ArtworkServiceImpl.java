package com.tzb.backend.admin.service.impl;

import com.tzb.backend.admin.domain.dto.ArtworkPageDto;
import com.tzb.backend.admin.domain.entity.Artwork;
import com.tzb.backend.admin.domain.request.AddArtworkRequest;
import com.tzb.backend.admin.domain.request.ArtworkPageRequest;
import com.tzb.backend.admin.mapper.ArtworkMapper;
import com.tzb.backend.admin.mapper.FUserMapper;
import com.tzb.backend.admin.repository.ArtworkRepository;
import com.tzb.backend.admin.repository.ArtworkSpecifications;
import com.tzb.backend.admin.repository.UserRepository;
import com.tzb.backend.admin.service.ArtworkService;
import com.tzb.backend.admin.service.UserService;
import com.tzb.backend.common.core.PageResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("ArtworkServiceImpl")
@RequiredArgsConstructor
public class ArtworkServiceImpl implements ArtworkService {
    private final ArtworkRepository artworkRepository;
    private final ArtworkMapper artworkMapper;
    private final UserRepository userRepository;
    private final FUserMapper fUserMapper;
    private final UserService userService;
    private final ArtworkSpecifications artworkSpecifications;


    @Override
    public void addArtwork(AddArtworkRequest request) {

    }

    @Override
    public PageResponse queryPage(ArtworkPageRequest request) {
        Pageable pageable = request.toPageable();
        Specification<Artwork> spec = artworkSpecifications.searchArtworks(
                request.getName(),
                request.getMaterial(),
                request.getType(),
                request.getPublisher(),
                request.getState());
        Page<Artwork> artworkPage = artworkRepository.findAll(spec, pageable);
        List<ArtworkPageDto> artworkPageDtoList = artworkPage.getContent().stream().map(artwork -> {
            ArtworkPageDto dto = artworkMapper.toArtworkPageDto(artwork);
        String username = userRepository.findUserById(artwork.getPublisher()).getUsername();
        dto.setPublisher(username);
        return dto;
        }).toList();
        long total = artworkRepository.count(spec);

        return new PageResponse(artworkPageDtoList, total);


}
}

//    artwork -> {
//        ArtworkPageDto dto = artworkMapper.toArtworkPageDto(artwork);
//        // 获取角色权限列表并设置到DTO中
//        String username = userRepository.findUserById(artwork.getPublisher()).getUsername();
//        dto.setPublisher(username);
//        return dto;

