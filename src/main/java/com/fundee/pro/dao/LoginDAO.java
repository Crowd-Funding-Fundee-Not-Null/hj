package com.fundee.pro.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fundee.pro.dto.LoginDTO;

@Repository
public class LoginDAO {

    private SqlSessionTemplate sessionTemplate;

    @Autowired
    public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
        this.sessionTemplate = sessionTemplate;
    }

    public int insertMember(LoginDTO dto) {
        return sessionTemplate.insert("com.fundee.pro.mapper.LoginMapper.insertMember", dto);
    }

    public int updateMember(LoginDTO dto) {
        return sessionTemplate.update("com.fundee.pro.mapper.LoginMapper.updateMember", dto);
    }

    public int deleteMember(String id) {
        return sessionTemplate.delete("com.fundee.pro.mapper.LoginMapper.deleteMember", id);
    }

    public boolean login(String id, String password) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("id", id);
        params.put("password", password);

        Integer count = sessionTemplate.selectOne("com.fundee.pro.mapper.LoginMapper.loginCount", params);
        return count != null && count.intValue() > 0;
    }
}
