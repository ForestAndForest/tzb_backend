package com.tzb.backend.admin.service.impl;

import com.tzb.backend.admin.domain.dto.ArtworkPageDto;
import com.tzb.backend.admin.domain.entity.Artwork;
import com.tzb.backend.admin.domain.request.artwork.AddArtworkRequest;
import com.tzb.backend.admin.domain.request.artwork.ArtworkPageRequest;
import com.tzb.backend.admin.domain.request.artwork.UpdateArtworkRequest;
import com.tzb.backend.admin.mapper.ArtworkMapper;
import com.tzb.backend.admin.mapper.FUserMapper;
import com.tzb.backend.admin.repository.ArtworkRepository;
import com.tzb.backend.admin.repository.spc.ArtworkSpecifications;
import com.tzb.backend.admin.repository.UserRepository;
import com.tzb.backend.admin.service.ArtworkService;
import com.tzb.backend.admin.service.UserService;
import com.tzb.backend.common.core.CustomException;
import com.tzb.backend.common.core.PageResponse;
import com.tzb.backend.common.utils.CopyUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
        artworkRepository.save(artworkMapper.toArtwork(request));
    }
    @Override
    public void updateArtwork(UpdateArtworkRequest request) {
        System.out.println(request);
        Artwork artwork = artworkRepository.findById(request.getId()).orElseThrow(() -> new CustomException("新闻不存在", 404));
        Artwork artworkRequest = artworkMapper.toArtwork(request);
        CopyUtils.copyProperties(artworkRequest, artwork);
        artworkRepository.save(artwork);
    }

    @Override
    @Transactional
    public void delete(Long id) {
        artworkRepository.deleteById(id);
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
        String username = userRepository.findUserById(artwork.getPublisherId()).getUsername();
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

