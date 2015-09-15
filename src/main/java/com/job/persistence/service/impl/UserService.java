/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.job.persistence.service.impl;

import com.job.persistence.dao.IUserDao;
import com.job.persistence.model.User;
import com.job.persistence.service.IUserService;
import com.job.persistence.service.common.AbstractService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Service;

/**
 *
 * @author Brice GUEMKAM <briceguemkam@gmail.com>
 */
@Service("userService")
public class UserService extends AbstractService<User> implements IUserService
{

    @Autowired
    IUserDao userDao;

    @Override
    protected PagingAndSortingRepository<User, Long> getDao()
    {
        return userDao;
    }

    @Override
    public User findByUsername(String username)
    {
        return userDao.findByUsername(username);
    }

    @Override
    public User findByUsernameAndPassword(String username, String password)
    {
        return userDao.findByUsernameAndPassword(username, password);
    }
}
