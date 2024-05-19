package com.tzb.backend;

import com.tzb.backend.admin.domain.entity.Artwork;
import com.tzb.backend.admin.domain.request.artwork.ArtworkPageRequest;
import com.tzb.backend.admin.mapper.ArtworkMapper;
import com.tzb.backend.admin.repository.ArtworkRepository;
import com.tzb.backend.admin.repository.spc.ArtworkSpecifications;
import com.tzb.backend.admin.service.impl.ArtworkServiceImpl;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.any;

public class ArtworkServiceTest {

    @Mock
    private ArtworkRepository artworkRepository;

    @Mock
    private ArtworkSpecifications artworkSpecifications;

    @Mock
    private ArtworkMapper artworkMapper;

    @InjectMocks
    private ArtworkServiceImpl artworkService;

    @BeforeEach
    public void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    public void testQueryPage() {
        ArtworkPageRequest request = new ArtworkPageRequest();
        request.setName("艺术品");
        request.setMaterial(null);
        request.setType(null);
        request.setPublisher(null);
        request.setState((byte) 1);
        Pageable pageable = request.toPageable();
        Specification<Artwork> spec = artworkSpecifications.searchArtworks(
                request.getName(),
                request.getMaterial(),
                request.getType(),
                request.getPublisher(),
                request.getState());
        Page<Artwork> artworkPage = artworkRepository.findAll(spec,pageable);
//        List<ArtworkPageDto> artworkPageDtoList = artworkPage.getContent().stream().map(artworkMapper::toArtworkPageDto).toList();
        System.out.println(artworkPage);
    }
}
