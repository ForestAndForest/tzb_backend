package com.tzb.backend.web.controller;

import com.tzb.backend.common.annotation.ResultWrapper;
import com.tzb.backend.web.service.RelicService;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 * @author 29002
 */
@CrossOrigin
@RestController
@ResultWrapper
@RequiredArgsConstructor
@RequestMapping("/api")
@Tag(name="前台文物展示")
public class RelicExhibitController {
    private final RelicService service;

    @GetMapping("/relicExhibit")
    public Object getSpecialExhibits() {
        return service.getRelic();
    }

    @GetMapping("/relicExhibit/{id}")
    public Object getSpecialExhibitById(@PathVariable Long id) {
        return service.getRelicById(id);
    }
}
