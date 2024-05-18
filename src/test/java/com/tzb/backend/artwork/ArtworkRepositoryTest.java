package com.tzb.backend.artwork;

import com.tzb.backend.admin.domain.dto.UserPageDto;
import com.tzb.backend.admin.domain.entity.Artwork;
import com.tzb.backend.admin.domain.entity.User;
import com.tzb.backend.admin.domain.request.ArtworkPageRequest;
import com.tzb.backend.admin.domain.request.UserPageRequest;
import com.tzb.backend.admin.mapper.FUserMapper;
import com.tzb.backend.admin.repository.ArtworkRepository;
import com.tzb.backend.admin.repository.UserRepository;
import com.tzb.backend.admin.repository.UserSpecifications;
import com.tzb.backend.common.core.PageResponse;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;

import java.util.List;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.mockito.Mockito.when;

public class ArtworkRepositoryTest {

    @Mock
    private UserRepository userRepository;
    @Mock
    private UserSpecifications userSpecifications;
    @Mock
    private FUserMapper userMapper;

    @BeforeEach
    public void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    public void testFindAll() {
        UserPageRequest request = new UserPageRequest();
        request.setUsername(null);
        request.setType(null);
        request.setEmail(null);
        request.setEnable(null);
        Pageable pageable = request.toPageable();

        String username = request.getUsername();
        String email = request.getEmail();
        Boolean enable = request.getEnable();
        Integer type = request.getType();


        Specification<User> spec = userSpecifications.searchUsers(username, email, enable, type);

        Page<User> userPage = userRepository.findAll(spec, pageable);
        List<UserPageDto> userPageDtoList = userPage.getContent().stream().map(userMapper::toUserPageDto).toList();
        long total = userRepository.count(spec);
        System.out.println("User list: " + userPage);
    }
}
