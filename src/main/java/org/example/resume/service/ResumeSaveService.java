package org.example.resume.service;

import org.example.resume.entity.ResumeSave;

public interface ResumeSaveService {
    Integer save(ResumeSave resumeSave);
    ResumeSave getByUserId(Integer userId);
}
