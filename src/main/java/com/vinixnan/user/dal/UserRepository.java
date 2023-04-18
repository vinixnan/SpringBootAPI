package com.vinixnan.user.dal;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.vinixnan.user.model.User;

@Repository
public interface UserRepository extends MongoRepository<User, String> {
}
