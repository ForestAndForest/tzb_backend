package com.tzb.backend.pms.service;


import com.tzb.backend.pms.domain.dto.LoginTokenDto;
import com.tzb.backend.pms.domain.dto.UserDetailDto;
import com.tzb.backend.pms.domain.dto.UserPageDto;
import com.tzb.backend.pms.domain.request.*;
import org.springframework.data.domain.Page;

import java.util.List;

/**
 * User Service
 *
 * @author dhb
 */
public interface UserService {

    /**
     * 用户登录
     *
     * @param request 请求
     * @return 返回token
     */
    LoginTokenDto login(LoginRequest request);

    /**
     * 用户信息
     *
     * @param userId   用户id
     * @param roleCode 用户角色编码
     * @return 用户信息
     */
    UserDetailDto detail(Long userId, String roleCode);

    /**
     * 切换角色
     *
     * @param userId   用户id
     * @param roleCode 角色编码
     * @return 切换后重新获取token
     */
    LoginTokenDto switchRole(Long userId, String roleCode);

    /**
     * 注册用户
     *
     * @param request 请求
     */
    void register(RegisterUserRequest request);

    /**
     * 刷新token
     */
    LoginTokenDto refreshToken();

    /**
     * 修改密码
     *
     * @param request 请求
     */
    void changePassword(ChangePasswordRequest request);

    /**
     * 分页查询
     *
     * @param request 请求
     * @return ret
     */
    List<UserPageDto> queryPage(UserPageRequest request);

    /**
     * 根据id删除用户，不能删除自己
     *
     * @param id 用户id
     */
    void removeUser(Long id);

    /**
     * 重置密码
     *
     * @param userId  用户id
     * @param request 包含密码
     */
    void resetPassword(Long userId, UpdatePasswordRequest request);

    /**
     * 给用户分配角色
     *
     * @param userId  用户id
     * @param request 包含角色id
     */
    void addRoles(Long userId, AddUserRolesRequest request);

    /**
     * 更新用户信息
     *
     * @param id      用户id
     * @param request 用户信息
     */
    void updateProfile(Long id, UpdateProfileRequest request);
}
