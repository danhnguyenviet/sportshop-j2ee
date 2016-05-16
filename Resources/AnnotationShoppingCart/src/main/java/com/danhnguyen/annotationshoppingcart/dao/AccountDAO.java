package com.danhnguyen.annotationshoppingcart.dao;

import com.danhnguyen.annotationshoppingcart.entity.Account;

public interface AccountDAO {

	public Account findAccount(String userName);

}