package com.tzb.backend.web.repository;

import com.tzb.backend.admin.domain.entity.Artwork;
import com.tzb.backend.admin.domain.entity.Relic;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author 29002
 */
@Repository
public interface RelicRepository extends JpaRepository<Relic, Long>, JpaSpecificationExecutor<Relic> {
    Relic findRelicById(Long id);

    List<Relic> findAllBy();
}
