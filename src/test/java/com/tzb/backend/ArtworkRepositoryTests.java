package com.tzb.backend;

import com.tzb.backend.admin.domain.entity.Artwork;
import com.tzb.backend.admin.repository.ArtworkRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.time.LocalDateTime;

import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
public class ArtworkRepositoryTests {

    @Autowired
    private ArtworkRepository artworkRepository;

    @Test
    public void testCreateArtwork() {
        Artwork artwork = new Artwork();
        artwork.setName("Test Artwork");
        artwork.setDescription("This is a test description");
        artwork.setImage("test_image.jpg");
        artwork.setPublisher(1);
        artwork.setType(1);
        artwork.setStock(10);
        artwork.setPrice(100.0);
        artwork.setMaterial("Oil on canvas");
        artwork.setIsSoldOut(false);
        artwork.setState( 1);
        artwork.setPageView(0);

        Artwork savedArtwork = artworkRepository.save(artwork);

        assertThat(savedArtwork.getId()).isNotNull();
        assertThat(savedArtwork.getName()).isEqualTo("Test Artwork");
        assertThat(savedArtwork.getCreteTime()).isNotNull();
    }
}
