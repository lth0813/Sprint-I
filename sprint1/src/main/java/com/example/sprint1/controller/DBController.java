package com.example.sprint1.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.example.sprint1.dao.SprintDao;

@Controller
public class DBController {
    @Autowired
    SprintDao sprintDao;
}
