package com.tzb.backend.admin.repository.spc;

import com.tzb.backend.admin.domain.entity.Artwork;
import com.tzb.backend.admin.domain.entity.User;
import jakarta.persistence.criteria.Predicate;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;

@Component
public class ArtworkSpecifications {

    public Specification<Artwork> searchArtworks(String name, String material) {
        return searchArtworks(name, material, null, null,null);
    }

    public Specification<Artwork> searchArtworks(String name, String material, Integer type, Integer publisher,Integer state) {
        return (root, query, criteriaBuilder) -> {
            List<Predicate> predicates = new ArrayList<>();

            if (StringUtils.hasText(name)) {
                predicates.add(criteriaBuilder.like(root.get("name"), "%"+name+"%"));
            }
            if (StringUtils.hasText(material)) {
                predicates.add(criteriaBuilder.like(root.get("material"), "%"+material+"%"));
            }
            if (type != null) {
                predicates.add(criteriaBuilder.equal(root.get("type"), type));
            }
            if (publisher != null) {
                predicates.add(criteriaBuilder.equal(root.get("publisher"), publisher));
            }
            if (state !=null){
                predicates.add(criteriaBuilder.equal(root.get("state"), state));
            }

            return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
        };
    }
}
