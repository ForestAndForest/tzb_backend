package com.tzb.backend.admin.repository;

import com.tzb.backend.admin.domain.entity.Artwork;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

@Repository
public interface ArtworkRepository extends JpaRepository<Artwork,Long>, JpaSpecificationExecutor<Artwork> {
}
