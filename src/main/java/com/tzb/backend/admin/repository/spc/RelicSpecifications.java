package com.tzb.backend.admin.repository.spc;

import com.tzb.backend.admin.domain.entity.Artwork;
import com.tzb.backend.admin.domain.entity.Relic;
import jakarta.persistence.criteria.Predicate;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;

@Component
public class RelicSpecifications {

    public Specification<Relic> searchRelic(String name, String material, String value) {
        return (root, query, criteriaBuilder) -> {
            List<Predicate> predicates = new ArrayList<>();

            if (StringUtils.hasText(name)) {
                predicates.add(criteriaBuilder.like(root.get("name"), "%"+name+"%"));
            }
            if (StringUtils.hasText(material)) {
                predicates.add(criteriaBuilder.like(root.get("material"), "%"+material+"%"));
            }
            if (StringUtils.hasText(value)) {
                predicates.add(criteriaBuilder.like(root.get("material"), "%"+value+"%"));
            }

            return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
        };
    }
}
