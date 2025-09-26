package com.fundee.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.fundee.dto.LoginDTO;

@Mapper
public interface LoginMapper {

	int insertMember(LoginDTO dto);

    int updateMember(LoginDTO dto);

    int deleteMember(String id);

    int loginCount(@Param("id") String id, @Param("password") String password);

    int findRoleById(String id);

    int existsById(String id);

    String findIdByEmail(String email);

    int existsByEmail(@Param("email") String email);

    int existsByNickname(@Param("nickname") String nickname);

    String findNicknameById(@Param("id") String id);	
    
    String findPwdByIdAndEmail(@Param("id") String id, @Param("email") String email);

    LoginDTO selectLogin(Map<String, Object> param);

    LoginDTO findById(String id);
    
}