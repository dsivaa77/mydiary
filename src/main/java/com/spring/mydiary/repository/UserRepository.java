package com.spring.mydiary.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.spring.mydiary.entity.User;

public interface UserRepository extends JpaRepository<User, Long>
{
	public User findByUsername(String username);
}
