package org.example.resume.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.example.resume.entity.ResumeSave;
import org.example.resume.mapper.ResumeSaveMapper;
import org.example.resume.service.ResumeSaveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ResumeSaveServiceImpl implements ResumeSaveService {
    @Autowired
    ResumeSaveMapper resumeSaveMapper;


    @Override
    public Integer save(ResumeSave resumeSave) {
        return resumeSaveMapper.insert(resumeSave);
    }
    @Override
    public ResumeSave getByUserId(Integer userId) {
        return resumeSaveMapper.selectOne(new QueryWrapper<ResumeSave>().eq("user_id", userId));
    }
}
